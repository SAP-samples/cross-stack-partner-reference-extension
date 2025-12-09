CLASS lhc_salesorder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.

  PRIVATE SECTION.
    TYPES: BEGIN OF ty_poetry_slam,
             id                   TYPE string,
             title                TYPE string,
             number               TYPE string,
             visitorsFeeAmount(6) TYPE p DECIMALS 2,
           END OF ty_poetry_slam.

    DATA: lo_api_dest     TYPE REF TO if_http_destination,
          ls_poetry_slam  TYPE ty_poetry_slam,
          lo_comm_system  TYPE REF TO if_com_system_v2,
          mo_api_dest     TYPE REF TO if_http_destination,
          mo_http_client  TYPE REF TO if_web_http_client,
          mo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy.

    CONSTANTS: lc_communication_scneario TYPE if_com_management=>ty_cscn_id VALUE 'ZPRA_PSE_SO_CS',
               lc_outbound_service_id    TYPE if_com_management=>ty_cscn_outb_srv_id VALUE 'ZPRA_PSE_SO_PS_OB_REST',
               lc_comm_system_id         TYPE if_com_management=>ty_cs_id VALUE 'ZPRA_PSE_SO_URL',
               lc_service_root           TYPE string VALUE '/poetryslammanagerapi'.


    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SalesOrder RESULT result.

    METHODS zzpra_pse_assign_ps FOR MODIFY
      IMPORTING it_keys       FOR ACTION SalesOrder~zzpra_pse_assign_ps
      RESULT    action_result.

    METHODS precheck_action FOR PRECHECK
      IMPORTING it_keys FOR ACTION SalesOrder~zzpra_pse_assign_ps.

    METHODS initialize_scm_proxy
      RAISING cx_http_dest_provider_error
              cx_web_http_client_error
              /iwbep/cx_cp_remote
              /iwbep/cx_gateway.

    METHODS get_poetry_slam_data
      IMPORTING
                iv_poetry_slam_id     TYPE zpra_pse_ps_id
                io_api_dest           TYPE REF TO if_http_destination
      RETURNING VALUE(rs_poetry_slam) TYPE ty_poetry_slam
      RAISING   cx_http_dest_provider_error.

    METHODS update_ps_with_sales_order
      IMPORTING
                iv_poetry_slam    TYPE ty_poetry_slam
                iv_sales_order_id TYPE vbeln
                io_api_dest       TYPE REF TO if_http_destination
      RAISING   cx_http_dest_provider_error.

    METHODS: get_scm_proxy
              RAISING cx_http_dest_provider_error
                      cx_web_http_client_error
                      /iwbep/cx_cp_remote
                      /iwbep/cx_gateway.
ENDCLASS.

CLASS lhc_salesorder IMPLEMENTATION.

  METHOD get_scm_proxy.
    " Only initialize if not already done -
    IF mo_client_proxy IS NOT BOUND.
      initialize_scm_proxy( ).
    ENDIF.
  ENDMETHOD.


  METHOD get_instance_features.
    READ ENTITIES OF I_SalesOrderTP IN LOCAL MODE
      ENTITY SalesOrder
      FIELDS (  SalesOrder  )
        WITH CORRESPONDING #( keys )
          RESULT DATA(lt_result_salesorder).

    result = VALUE #( FOR ls_salesorder IN lt_result_salesorder ( %tky = ls_salesorder-%tky
             %features-%action-zzpra_pse_assign_ps = COND #( WHEN ls_salesorder-SalesOrder = ''
                                                      THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled ) ) ).

  ENDMETHOD.

  METHOD zzpra_pse_assign_ps.
    TRY.
        " Ensure SCM proxy is initialized -
        get_scm_proxy( ).

        " Get the sales order data
        READ ENTITIES OF i_salesordertp IN LOCAL MODE
        ENTITY SalesOrder
        FIELDS ( SalesOrder SoldToParty zzpra_pse_ps_id_sdh )
        WITH CORRESPONDING #( it_keys )
        RESULT DATA(lt_sales_order_data).


        " Skip if no poetry slam id is given
        READ TABLE it_keys INTO DATA(ls_key) INDEX 1.
        IF sy-subrc <> 0 OR ls_key-%param-PoetrySlamId IS INITIAL.
          action_result = VALUE #( FOR sales IN lt_sales_order_data ( %tky   = sales-%tky
                                                %param = sales ) ).

          RETURN.
        ENDIF.


        " Validate sales order exists and is saved
        READ TABLE lt_sales_order_data REFERENCE INTO DATA(lr_sales_order_entry) INDEX 1.
        IF sy-subrc <> 0 OR lr_sales_order_entry->salesorder IS INITIAL.


          action_result = VALUE #( FOR sales IN lt_sales_order_data ( %tky   = sales-%tky
                                                %param = sales ) ).
          APPEND VALUE #(
                          %msg           = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text     = 'Assign Poetry Slam after saving sales order'  ##NO_TEXT
                         ) ) TO reported-salesorder.

          .
        ENDIF.

        " Get communication system instance
        DATA lo_pse_utility TYPE REF TO zcl_pra_pse_so_ext_util.
        CREATE OBJECT lo_pse_utility.
*
        lo_pse_utility->get_communication_system(
        IMPORTING
              eo_comm_system = lo_comm_system
              eo_api_dest   =  lo_api_dest ).
        IF lo_comm_system IS NOT INITIAL.
          DATA(lv_hostname)   = lo_comm_system->get_hostname( ).
        ENDIF.

        " Retrieve poetry slam data
        DATA(ls_poetry_slam) = get_poetry_slam_data(
          iv_poetry_slam_id = ls_key-%param-PoetrySlamId
          io_api_dest       = lo_api_dest ).

        IF ls_poetry_slam IS INITIAL.

          action_result = VALUE #( FOR sales IN lt_sales_order_data ( %tky   = sales-%tky
                                              %param = sales ) ).
          APPEND VALUE #(
                 %msg = new_message_with_text(
                 severity = if_abap_behv_message=>severity-error
                 text     = |Poetry Slam with ID { ls_key-%param-PoetrySlamId } not found|  ##NO_TEXT
                ) ) TO reported-salesorder.
          RETURN.
        ENDIF.

        " Update poetry slam with sales order
        update_ps_with_sales_order(
          iv_poetry_slam = ls_poetry_slam
          iv_sales_order_id = lr_sales_order_entry->SalesOrder
          io_api_dest       = lo_api_dest ).

        CONCATENATE 'https://' lv_hostname INTO lv_hostname.
        DATA(lv_path)    = |/poetryslams/index.html#/PoetrySlams('{ ls_poetry_slam-number }')|.
        CONCATENATE lv_hostname lv_path INTO DATA(lv_full_url).

        MODIFY ENTITIES OF i_salesordertp IN LOCAL MODE
        ENTITY SalesOrder
        UPDATE FIELDS ( zzpra_pse_ps_id_sdh
                    zzpra_pse_ps_title_sdh
                    zzpra_pse_ps_url_sdh )
        WITH VALUE #(
        ( %tky                       = lr_sales_order_entry->%tky
          zzpra_pse_ps_id_sdh        = ls_poetry_slam-number
          zzpra_pse_ps_title_sdh     = ls_poetry_slam-title
          zzpra_pse_ps_url_sdh       = lv_full_url ) ).

        action_result = VALUE #( FOR sales IN lt_sales_order_data ( %tky   = sales-%tky
                                              %param = sales ) ).

      CATCH cx_http_dest_provider_error
            cx_web_http_client_error
            /iwbep/cx_cp_remote
            /iwbep/cx_gateway INTO DATA(error).
        APPEND VALUE #( %msg = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text     = |HTTP client error: { error->get_text( ) }|  ##NO_TEXT
                       ) ) TO reported-salesorder.
    ENDTRY.

  ENDMETHOD.

  METHOD precheck_action.
    " Get communication system instance
    DATA lo_pse_utility TYPE REF TO zcl_pra_pse_so_ext_util.
    CREATE OBJECT lo_pse_utility.
    TRY.
        " Ensure SCM proxy is initialized
        get_scm_proxy( ).

        lo_pse_utility->get_communication_system(
        IMPORTING
              eo_comm_system = lo_comm_system
              eo_api_dest   =  lo_api_dest ).

        READ TABLE it_keys INTO DATA(ls_key) INDEX 1.
        IF sy-subrc <> 0 OR ls_key-%param-PoetrySlamId IS INITIAL.
          RETURN.
        ENDIF.

        " Retrieve poetry slam data
        ls_poetry_slam = get_poetry_slam_data(
            iv_poetry_slam_id = ls_key-%param-PoetrySlamId
            io_api_dest       = lo_api_dest ).

        IF ls_poetry_slam IS INITIAL.
          APPEND VALUE #(
                 %msg = new_message_with_text(
                 severity = if_abap_behv_message=>severity-error
                 text     = |Poetry Slam with ID { ls_key-%param-PoetrySlamId } not found|  ##NO_TEXT
                ) ) TO reported-salesorder.
          RETURN.
        ENDIF.
      CATCH cx_http_dest_provider_error
            cx_web_http_client_error
            /iwbep/cx_cp_remote
            /iwbep/cx_gateway INTO DATA(error).
        APPEND VALUE #( %msg = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text     = |HTTP client error: { error->get_text( ) }|  ##NO_TEXT
                       ) ) TO reported-salesorder.
    ENDTRY.
  ENDMETHOD.

  METHOD initialize_scm_proxy.
    DATA: lv_comm_scen_id_range TYPE if_com_scenario_factory=>ty_query-cscn_id_range.

    lv_comm_scen_id_range = VALUE #( ( sign = 'I' option = 'EQ' low = lc_communication_scneario ) ).

    cl_com_arrangement_factory=>create_instance( )->query_ca(
      EXPORTING
        is_query           = VALUE #( cscn_id_range = lv_comm_scen_id_range )
      IMPORTING
        et_com_arrangement = DATA(lt_com_arrangements) ).

    IF lines( lt_com_arrangements ) = 0.
      RAISE EXCEPTION TYPE cx_web_http_client_error.
    ENDIF.

    DATA(lr_comm_arrangement) = lt_com_arrangements[ 1 ].

    mo_api_dest = cl_http_destination_provider=>create_by_comm_arrangement(
                            comm_scenario  = lc_communication_scneario
                            service_id     = lc_outbound_service_id
                            comm_system_id = lr_comm_arrangement->get_comm_system_id( ) ).

    mo_http_client = cl_web_http_client_manager=>create_by_http_destination( mo_api_dest ).

    " Create SCM client proxy
    mo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
      EXPORTING
         is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                             proxy_model_id      = 'ZPRA_PSE_SO_PS_SCM'
                                             proxy_model_version = '0001' )
        io_http_client             = mo_http_client
        iv_relative_service_root   = lc_service_root ).

  ENDMETHOD.


  METHOD get_poetry_slam_data.
    DATA: lt_business_data TYPE TABLE OF zpra_pse_so_ps_scm=>tys_poetry_slams_2,
          ls_business_data TYPE zpra_pse_so_ps_scm=>tys_poetry_slams_2,
          lo_resource_list TYPE REF TO /iwbep/if_cp_resource_list,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    CLEAR rs_poetry_slam.

    TRY.
        " Ensure SCM proxy is initialized
         get_scm_proxy( ).

        lo_resource_list = mo_client_proxy->create_resource_for_entity_set( 'POETRY_SLAMS' ).

        lo_request = lo_resource_list->create_request_for_read( ).

        lo_request->set_select_properties(
            it_select_property = VALUE /iwbep/if_cp_runtime_types=>ty_t_property_path(
              ( `ID` )
              ( `TITLE` )
              ( `NUMBER` )
            )
          ).

        lo_response = lo_request->execute( ).

        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        "Filter to find the specific poetry slam by number**
        READ TABLE lt_business_data INTO ls_business_data
          WITH KEY number = iv_poetry_slam_id.

        IF sy-subrc = 0.
          " Map SCM business data to your return structure
          rs_poetry_slam = CORRESPONDING #( ls_business_data ).
        ENDIF.

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        DATA(remote_message) = lx_remote->get_longtext( ).
        RETURN.
      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        DATA(gateway_message) = lx_gateway->get_longtext( ).
        RETURN.
      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        DATA(http_message) = cl_message_helper=>get_latest_t100_exception( lx_web_http_client_error )->if_message~get_longtext( ).
        RETURN.
    ENDTRY.
  ENDMETHOD.

  METHOD update_ps_with_sales_order.
    DATA: ls_business_data TYPE zpra_pse_so_ps_scm=>tys_poetry_slams_2,
          ls_entity_key    TYPE zpra_pse_so_ps_scm=>tys_poetry_slams_2,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_request       TYPE REF TO /iwbep/if_cp_request_update,
          lo_response      TYPE REF TO /iwbep/if_cp_response_update.

    TRY.
        " Ensure SCM proxy is initialized
        get_scm_proxy( ).

        ls_entity_key = VALUE #(
            id  = iv_poetry_slam-id ).

        " Prepare sales order ID (remove leading zeros)
        DATA(lv_sales_order_formatted) = |{ iv_sales_order_id ALPHA = OUT }|.
        CONDENSE lv_sales_order_formatted NO-GAPS.

        ls_business_data = VALUE #( sales_order_id = lv_sales_order_formatted ).

        lo_resource = mo_client_proxy->create_resource_for_entity_set( 'POETRY_SLAMS' )->navigate_with_key( ls_entity_key ).

        " Create PATCH request for partial update
        lo_request = lo_resource->create_request_for_update( /iwbep/if_cp_request_update=>gcs_update_semantic-patch ).

        " Set business data containing ONLY the fields to update
        lo_request->set_business_data(
          is_business_data = ls_business_data
          it_provided_property = VALUE #( ( |SALES_ORDER_ID| ) ) ).

        lo_response = lo_request->request_no_business_data( )->execute( ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        DATA(remote_message) = lx_remote->get_longtext( ).
        RETURN.
      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        DATA(gateway_message) = lx_gateway->get_longtext( ).
        RETURN.
      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        DATA(http_message) = cl_message_helper=>get_latest_t100_exception( lx_web_http_client_error )->if_message~get_longtext( ).
        RETURN.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_R_SALESORDERTP DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_R_SALESORDERTP IMPLEMENTATION.

  METHOD cleanup_finalize.
* no cleanup required
  ENDMETHOD.

ENDCLASS.