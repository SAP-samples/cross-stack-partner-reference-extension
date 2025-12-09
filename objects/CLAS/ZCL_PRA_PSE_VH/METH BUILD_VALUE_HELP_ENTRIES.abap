  METHOD build_value_help_entries.
    DATA: ls_value_help_entry TYPE zpra_pse_ps_id_vh,
          ls_status_code      TYPE zpra_pse_so_ps_scm=>tys_poetry_slam_status_codes_2.

    LOOP AT it_poetry_slams INTO DATA(ls_poetry_slam).
      CLEAR ls_value_help_entry.

      ls_value_help_entry-id = ls_poetry_slam-id.
      ls_value_help_entry-zzpra_pse_ps_id_sdh = ls_poetry_slam-number.
      ls_value_help_entry-zzpra_pse_ps_title_sdh = ls_poetry_slam-title.

      READ TABLE it_status_codes INTO ls_status_code
           WITH KEY code = ls_poetry_slam-status_code.
      IF sy-subrc = 0.
        ls_value_help_entry-zzpra_pse_ps_status_sdh = ls_status_code-name.
      ELSE.
        ls_value_help_entry-zzpra_pse_ps_status_sdh = ls_poetry_slam-status_code.
      ENDIF.

      INSERT ls_value_help_entry INTO TABLE rt_valuehelp_entries.
    ENDLOOP.
  ENDMETHOD.