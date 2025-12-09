  METHOD if_rap_query_provider~select.

    DATA :lt_value_help_entries TYPE STANDARD TABLE OF zpra_pse_ps_id_vh.
    DATA lv_search_value TYPE string.
    DATA: ls_poetry_slam_inst TYPE zpra_pse_so_ps_scm=>tys_poetry_slams_2.

    TRY.
        " Handle request parameters for future use
        handle_request_parameters( io_request ).

        " Handle based on the input filter or search value.
        DATA(lt_filters) = io_request->get_filter( )->get_as_ranges(  ).
        READ TABLE lt_filters ASSIGNING FIELD-SYMBOL(<fs_filter>)
        WITH KEY name = 'ZZPRA_PSE_PS_ID_SDH'.
        IF sy-subrc = 0.
          lv_search_value = <fs_filter>-range[ 1 ]-low.
        ENDIF.

        IF ( lv_search_value IS INITIAL ).
          lv_search_value = io_request->get_search_expression( ).
        ENDIF.

        "initialize proxy
        initialize_utility( ).

        DATA(lt_all_poetry_slams) = get_poetry_slams( ).

        IF ( lv_search_value IS NOT INITIAL ).
          READ TABLE lt_all_poetry_slams INTO ls_poetry_slam_inst
              WITH KEY number = lv_search_value.
          IF sy-subrc = 0.
            APPEND ls_poetry_slam_inst TO lt_poetry_slams.
          ENDIF.
        ELSE.
          lt_poetry_slams = lt_all_poetry_slams.
        ENDIF.

        IF ( lines( lt_poetry_slams ) EQ 0 ).
          "set the empty f4 help data
          io_response->set_data( lt_poetry_slams ).
          io_response->set_total_number_of_records(  lines( lt_poetry_slams ) ).
          RETURN.
        ENDIF.
        " Fetch status codes
        DATA(lt_poetry_slams_codes) = get_status_codes( ).

        " Build final F4 help entries
        lt_value_help_entries = build_value_help_entries(
            it_poetry_slams =  lt_poetry_slams
            it_status_codes = lt_poetry_slams_codes ).

        "set the f4 help data
        io_response->set_data( lt_value_help_entries ).
        io_response->set_total_number_of_records(  lines( lt_poetry_slams ) ).

      CATCH cx_http_dest_provider_error
            cx_web_http_client_error
            /iwbep/cx_cp_remote
            /iwbep/cx_gateway
            cx_rap_query_filter_no_range INTO DATA(error).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception( error )->if_message~get_longtext( ).
        RETURN.
    ENDTRY.

  ENDMETHOD.