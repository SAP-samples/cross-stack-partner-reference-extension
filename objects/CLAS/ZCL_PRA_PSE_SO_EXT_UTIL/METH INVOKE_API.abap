  METHOD invoke_api.

    CLEAR ro_http_response.
    DATA(lo_http_client) =   get_http_client_for_path(
               iv_uri_path = iv_uri_path
               io_api_dest = io_api_dest ).

    DATA(http_request) = lo_http_client->get_http_request( ).
    http_request->set_header_field(
            i_name = if_web_http_header=>content_type "'Content-Type'
            i_value = 'application/json' ).

    DATA(lv_response) = lo_http_client->execute( if_web_http_client=>get ).
    log_message( lv_response ).
    ro_http_response = lv_response.
  ENDMETHOD.