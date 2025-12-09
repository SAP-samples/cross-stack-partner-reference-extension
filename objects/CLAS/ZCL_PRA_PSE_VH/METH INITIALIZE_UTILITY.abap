  METHOD initialize_utility.
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