  METHOD get_http_client_for_path.
    CLEAR ro_http_client.
    ro_http_client = cl_web_http_client_manager=>create_by_http_destination( io_api_dest ).
    ro_http_client->get_http_request( )->set_uri_path( iv_uri_path ).
  ENDMETHOD.