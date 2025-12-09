  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'PoetrySlamManagerAPIService' ) ##NO_TEXT.

    def_currencies_2( ).
    def_currencies_texts_2( ).
    def_poetry_slams_2( ).
    def_poetry_slam_status_codes_2( ).
    def_poetry_slam_status_codes_3( ).
    def_visitors_2( ).
    def_visits_2( ).
    def_visit_status_codes_2( ).
    def_visit_status_codes_texts_2( ).

  ENDMETHOD.