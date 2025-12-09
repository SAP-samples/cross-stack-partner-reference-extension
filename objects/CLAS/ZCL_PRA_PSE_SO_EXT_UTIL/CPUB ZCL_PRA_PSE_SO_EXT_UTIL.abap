CLASS zcl_pra_pse_so_ext_util DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_http_client_for_path
      IMPORTING iv_uri_path           TYPE string
                io_api_dest           TYPE REF TO if_http_destination
      RETURNING VALUE(ro_http_client) TYPE REF TO if_web_http_client
      RAISING   cx_web_http_client_error.

    METHODS get_communication_system
      EXPORTING eo_comm_system TYPE REF TO if_com_system_v2
                eo_api_dest    TYPE REF TO if_http_destination
      RAISING   cx_web_http_client_error
                cx_http_dest_provider_error.

    METHODS log_message
      IMPORTING
        iv_http_response TYPE REF TO if_web_http_response.

    METHODS invoke_api
      IMPORTING iv_uri_path             TYPE string
                io_api_dest             TYPE REF TO if_http_destination
      RETURNING VALUE(ro_http_response) TYPE REF TO if_web_http_response
      RAISING   cx_web_http_client_error.
