  METHOD log_message.
*  This is for evaluation during debugging . log is not written
    DATA(lv_message_status) = iv_http_response->get_status( ).
    DATA(lv_message_headers) = iv_http_response->get_header_fields( ).
    DATA(lv_message_body) = iv_http_response->get_text( ).
  ENDMETHOD.