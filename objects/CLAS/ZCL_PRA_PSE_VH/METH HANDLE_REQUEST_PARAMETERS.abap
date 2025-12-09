  METHOD handle_request_parameters.

    " Store for future use - filtering, sorting, paging
    DATA(lo_paging) = io_request->get_paging( ).
    DATA(lt_requested_elements) = io_request->get_requested_elements( ).
    DATA(lt_sort_elements) = io_request->get_sort_elements( ).

    TRY.
        DATA(lv_filter_string) = io_request->get_filter( )->get_as_sql_string( ).
      CATCH cx_rap_query_filter_no_range INTO DATA(error).
        " No filter applied - continue
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception( error )->if_message~get_longtext( ).
    ENDTRY.

  ENDMETHOD.