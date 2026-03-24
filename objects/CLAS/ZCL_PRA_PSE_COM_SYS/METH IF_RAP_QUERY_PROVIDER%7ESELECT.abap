  METHOD if_rap_query_provider~select.

    DATA com_sys TYPE STANDARD TABLE OF zpra_pse_lch_ddf.
    CONSTANTS com_sys_id TYPE c LENGTH 60 VALUE `ZPRA_PSE_SO_URL`.


    cl_com_system_factory=>create_instance( )->get_cs_by_id(
                            EXPORTING iv_id = com_sys_id
                            IMPORTING eo_com_system_v2 = DATA(com_sys_res) ).

    IF com_sys_res IS BOUND.
      com_sys = VALUE #( ( system_name = com_sys_id host = com_sys_res->get_hostname( ) ) ).
    ENDIF.

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( lines( com_sys ) ).
    ENDIF.

    IF io_request->is_data_requested( ).
      io_response->set_data( com_sys ).
    ENDIF.

    io_request->get_paging( ).

  ENDMETHOD.