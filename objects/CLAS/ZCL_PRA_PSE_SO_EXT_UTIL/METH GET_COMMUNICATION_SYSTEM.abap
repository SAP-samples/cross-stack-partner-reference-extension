  METHOD get_communication_system.
    CONSTANTS: lc_communication_scneario TYPE if_com_management=>ty_cscn_id VALUE 'ZPRA_PSE_SO_CS', " in package
               lc_outbound_service_id    TYPE if_com_management=>ty_cscn_outb_srv_id VALUE 'ZPRA_PSE_SO_PS_OB_REST', " in package
               lc_comm_system_id         TYPE if_com_management=>ty_cs_id VALUE 'ZPRA_PSE_SO_URL'. " Predefined communication system name
    DATA: lv_comm_scen_id_range TYPE if_com_scenario_factory=>ty_query-cscn_id_range.

    lv_comm_scen_id_range = VALUE #( ( sign = 'I' option = 'EQ' low = lc_communication_scneario ) ).

    TRY.
        " retrieve the cmmunication arrangements related to the communication scneario
        cl_com_arrangement_factory=>create_instance( )->query_ca(
          EXPORTING
            is_query           = VALUE #( cscn_id_range = lv_comm_scen_id_range )
          IMPORTING
            et_com_arrangement = DATA(lt_com_arrangements) ).

        IF lines( lt_com_arrangements ) = 0.
          RAISE EXCEPTION TYPE cx_web_http_client_error.
        ENDIF.

        " As the communication scenario is marked as one instance,
        "there can be only one communication arrangement for this communication scernario
        DATA(lr_comm_arrangement) = lt_com_arrangements[ 1 ].

        eo_api_dest = cl_http_destination_provider=>create_by_comm_arrangement(
                                comm_scenario  = lc_communication_scneario
                                service_id     = lc_outbound_service_id
                                comm_system_id = lr_comm_arrangement->get_comm_system_id( ) ).


*       Fetch the communication system details to get the hostname for the field url
        cl_com_system_factory=>create_instance( )->get_cs_by_id(
            EXPORTING
                iv_id        = lc_comm_system_id
            IMPORTING
                eo_com_system_v2 = eo_comm_system ).

      CATCH cx_http_dest_provider_error cx_web_http_client_error INTO DATA(error).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception( error )->if_message~get_longtext( ).
        RETURN.
    ENDTRY.
  ENDMETHOD.