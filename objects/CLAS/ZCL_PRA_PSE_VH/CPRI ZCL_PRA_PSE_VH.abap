  PRIVATE SECTION.

    DATA : mo_api_dest     TYPE REF TO if_http_destination,
           mo_http_client  TYPE REF TO if_web_http_client,
           mo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy.


    CONSTANTS: lc_communication_scneario TYPE if_com_management=>ty_cscn_id VALUE 'ZPRA_PSE_SO_CS',
               lc_outbound_service_id    TYPE if_com_management=>ty_cscn_outb_srv_id VALUE 'ZPRA_PSE_SO_PS_OB_REST',
               lc_comm_system_id         TYPE if_com_management=>ty_cs_id VALUE 'ZPRA_PSE_SO_URL',
               lc_service_root           TYPE string VALUE '/poetryslammanagerapi'.

    " SCM Type definitions
    TYPES: ty_poetry_slams       TYPE STANDARD TABLE OF zpra_pse_so_ps_scm=>tys_poetry_slams_2 WITH EMPTY KEY,
           ty_status_codes       TYPE STANDARD TABLE OF zpra_pse_so_ps_scm=>tys_poetry_slam_status_codes_2 WITH EMPTY KEY,
           ty_value_help_entries TYPE STANDARD TABLE OF zpra_pse_ps_id_vh WITH EMPTY KEY.


    DATA: lt_poetry_slams       TYPE ty_poetry_slams,
          lt_poetry_slams_codes TYPE ty_status_codes.

    METHODS:

      initialize_utility
        RAISING cx_http_dest_provider_error
                cx_web_http_client_error
                /iwbep/cx_cp_remote
                /iwbep/cx_gateway,

      handle_request_parameters
        IMPORTING
          io_request TYPE REF TO if_rap_query_request,

      get_poetry_slams
        RETURNING VALUE(rt_poetry_slams) TYPE ty_poetry_slams
        RAISING   cx_http_dest_provider_error
                  cx_web_http_client_error
                  /iwbep/cx_cp_remote
                  /iwbep/cx_gateway,

      get_status_codes
        RETURNING VALUE(rt_status_codes) TYPE ty_status_codes
        RAISING   cx_http_dest_provider_error
                  cx_web_http_client_error
                  /iwbep/cx_cp_remote
                  /iwbep/cx_gateway,

      build_value_help_entries
        IMPORTING it_poetry_slams             TYPE ty_poetry_slams
                  it_status_codes             TYPE ty_status_codes
        RETURNING VALUE(rt_valuehelp_entries) TYPE ty_value_help_entries.

