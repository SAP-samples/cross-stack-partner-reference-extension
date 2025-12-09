  METHOD get_poetry_slams.

    DATA: lo_resource_list TYPE REF TO /iwbep/if_cp_resource_list,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    TRY.
        lo_resource_list = mo_client_proxy->create_resource_for_entity_set( 'POETRY_SLAMS' ).

        lo_request = lo_resource_list->create_request_for_read( ).

        lo_request->set_select_properties(
            it_select_property = VALUE /iwbep/if_cp_runtime_types=>ty_t_property_path(
              ( `ID` )
              ( `TITLE` )
              ( `NUMBER` )
              ( `STATUS_CODE` )
            )
          ).

        lo_response = lo_request->execute( ).

        lo_response->get_business_data( IMPORTING et_business_data = rt_poetry_slams ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        DATA(lv_remote_longtext) = lx_remote->get_longtext( ).
        DATA(lv_remote_text) = lx_remote->get_text( ).
        RETURN.
      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        DATA(lv_gateway_longtext) = lx_gateway->get_longtext( ).
        DATA(lv_gateway_text) = lx_gateway->get_text( ).
        RETURN.
    ENDTRY.


  ENDMETHOD.