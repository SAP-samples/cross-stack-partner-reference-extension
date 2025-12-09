"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>PoetrySlamManagerAPIService</em>
CLASS zpra_pse_so_ps_scm DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of POETRY_SLAMS_2</p>
      BEGIN OF tys_value_controls_1,
        "! NUMBER
        number                     TYPE /iwbep/v4_value_control,
        "! TITLE
        title                      TYPE /iwbep/v4_value_control,
        "! DESCRIPTION
        description                TYPE /iwbep/v4_value_control,
        "! DATE_TIME
        date_time                  TYPE /iwbep/v4_value_control,
        "! VISITORS_FEE_AMOUNT
        visitors_fee_amount        TYPE /iwbep/v4_value_control,
        "! VISITORS_FEE_CURRENCY_CODE
        visitors_fee_currency_code TYPE /iwbep/v4_value_control,
        "! STATUS_CODE
        status_code                TYPE /iwbep/v4_value_control,
        "! SALES_ORDER_ID
        sales_order_id             TYPE /iwbep/v4_value_control,
        "! VISITORS_FEE_CURRENCY
        visitors_fee_currency      TYPE /iwbep/v4_value_control,
        "! STATUS
        status                     TYPE /iwbep/v4_value_control,
        "! VISITS
        visits                     TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_1.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of VISITORS_2</p>
      BEGIN OF tys_value_controls_2,
        "! CREATED_AT
        created_at  TYPE /iwbep/v4_value_control,
        "! CREATED_BY
        created_by  TYPE /iwbep/v4_value_control,
        "! MODIFIED_AT
        modified_at TYPE /iwbep/v4_value_control,
        "! MODIFIED_BY
        modified_by TYPE /iwbep/v4_value_control,
        "! NAME
        name        TYPE /iwbep/v4_value_control,
        "! EMAIL
        email       TYPE /iwbep/v4_value_control,
        "! VISITS
        visits      TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_2.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of VISITS_2</p>
      BEGIN OF tys_value_controls_3,
        "! CREATED_AT
        created_at       TYPE /iwbep/v4_value_control,
        "! CREATED_BY
        created_by       TYPE /iwbep/v4_value_control,
        "! MODIFIED_AT
        modified_at      TYPE /iwbep/v4_value_control,
        "! MODIFIED_BY
        modified_by      TYPE /iwbep/v4_value_control,
        "! PARENT_ID
        parent_id        TYPE /iwbep/v4_value_control,
        "! VISITOR_ID
        visitor_id       TYPE /iwbep/v4_value_control,
        "! ARTIST_INDICATOR
        artist_indicator TYPE /iwbep/v4_value_control,
        "! STATUS_CODE
        status_code      TYPE /iwbep/v4_value_control,
        "! PARENT
        parent           TYPE /iwbep/v4_value_control,
        "! VISITOR
        visitor          TYPE /iwbep/v4_value_control,
        "! STATUS
        status           TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_3.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of CURRENCIES_2</p>
      BEGIN OF tys_value_controls_4,
        "! NAME
        name       TYPE /iwbep/v4_value_control,
        "! DESCR
        descr      TYPE /iwbep/v4_value_control,
        "! SYMBOL
        symbol     TYPE /iwbep/v4_value_control,
        "! MINOR_UNIT
        minor_unit TYPE /iwbep/v4_value_control,
        "! TEXTS
        texts      TYPE /iwbep/v4_value_control,
        "! LOCALIZED
        localized  TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_4.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of POETRY_SLAM_STATUS_CODES_2</p>
      BEGIN OF tys_value_controls_5,
        "! NAME
        name      TYPE /iwbep/v4_value_control,
        "! DESCR
        descr     TYPE /iwbep/v4_value_control,
        "! TEXTS
        texts     TYPE /iwbep/v4_value_control,
        "! LOCALIZED
        localized TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_5.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of VISIT_STATUS_CODES_2</p>
      BEGIN OF tys_value_controls_6,
        "! NAME
        name      TYPE /iwbep/v4_value_control,
        "! DESCR
        descr     TYPE /iwbep/v4_value_control,
        "! TEXTS
        texts     TYPE /iwbep/v4_value_control,
        "! LOCALIZED
        localized TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_6.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of CURRENCIES_TEXTS_2</p>
      BEGIN OF tys_value_controls_7,
        "! NAME
        name  TYPE /iwbep/v4_value_control,
        "! DESCR
        descr TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_7.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of POETRY_SLAM_STATUS_CODES_3</p>
      BEGIN OF tys_value_controls_8,
        "! NAME
        name  TYPE /iwbep/v4_value_control,
        "! DESCR
        descr TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_8.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of VISIT_STATUS_CODES_TEXTS_2</p>
      BEGIN OF tys_value_controls_9,
        "! NAME
        name  TYPE /iwbep/v4_value_control,
        "! DESCR
        descr TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_9.

    TYPES:
      "! <p class="shorttext synchronized">Currencies</p>
      BEGIN OF tys_currencies_2,
        "! <em>Value Control Structure</em>
        value_controls TYPE tys_value_controls_4,
        "! name
        name           TYPE c LENGTH 255,
        "! descr
        descr          TYPE c LENGTH 1000,
        "! <em>Key property</em> code
        code           TYPE c LENGTH 3,
        "! symbol
        symbol         TYPE c LENGTH 5,
        "! minorUnit
        minor_unit     TYPE int2,
        "! odata.etag
        etag           TYPE string,
      END OF tys_currencies_2,
      "! <p class="shorttext synchronized">List of Currencies</p>
      tyt_currencies_2 TYPE STANDARD TABLE OF tys_currencies_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Currencies_texts</p>
      BEGIN OF tys_currencies_texts_2,
        "! <em>Value Control Structure</em>
        value_controls TYPE tys_value_controls_7,
        "! <em>Key property</em> locale
        locale         TYPE c LENGTH 14,
        "! name
        name           TYPE c LENGTH 255,
        "! descr
        descr          TYPE c LENGTH 1000,
        "! <em>Key property</em> code
        code           TYPE c LENGTH 3,
        "! odata.etag
        etag           TYPE string,
      END OF tys_currencies_texts_2,
      "! <p class="shorttext synchronized">List of Currencies_texts</p>
      tyt_currencies_texts_2 TYPE STANDARD TABLE OF tys_currencies_texts_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PoetrySlams</p>
      BEGIN OF tys_poetry_slams_2,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_1,
        "! <em>Key property</em> ID
        id                         TYPE sysuuid_x16,
        "! number
        number                     TYPE c LENGTH 255,
        "! title
        title                      TYPE c LENGTH 255,
        "! description
        description                TYPE c LENGTH 1000,
        "! dateTime
        date_time                  TYPE timestamp,
        "! visitorsFeeAmount
        visitors_fee_amount        TYPE p LENGTH 4 DECIMALS 2,
        "! visitorsFeeCurrency_code
        visitors_fee_currency_code TYPE c LENGTH 3,
        "! status_code
        status_code                TYPE int4,
        "! salesOrderID
        sales_order_id             TYPE string,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_poetry_slams_2,
      "! <p class="shorttext synchronized">List of PoetrySlams</p>
      tyt_poetry_slams_2 TYPE STANDARD TABLE OF tys_poetry_slams_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PoetrySlamStatusCodes</p>
      BEGIN OF tys_poetry_slam_status_codes_2,
        "! <em>Value Control Structure</em>
        value_controls TYPE tys_value_controls_5,
        "! name
        name           TYPE c LENGTH 255,
        "! descr
        descr          TYPE c LENGTH 1000,
        "! <em>Key property</em> code
        code           TYPE int4,
        "! odata.etag
        etag           TYPE string,
      END OF tys_poetry_slam_status_codes_2,
      "! <p class="shorttext synchronized">List of PoetrySlamStatusCodes</p>
      tyt_poetry_slam_status_codes_2 TYPE STANDARD TABLE OF tys_poetry_slam_status_codes_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PoetrySlamStatusCodes_texts</p>
      BEGIN OF tys_poetry_slam_status_codes_3,
        "! <em>Value Control Structure</em>
        value_controls TYPE tys_value_controls_8,
        "! <em>Key property</em> locale
        locale         TYPE c LENGTH 14,
        "! name
        name           TYPE c LENGTH 255,
        "! descr
        descr          TYPE c LENGTH 1000,
        "! <em>Key property</em> code
        code           TYPE int4,
        "! odata.etag
        etag           TYPE string,
      END OF tys_poetry_slam_status_codes_3,
      "! <p class="shorttext synchronized">List of PoetrySlamStatusCodes_texts</p>
      tyt_poetry_slam_status_codes_3 TYPE STANDARD TABLE OF tys_poetry_slam_status_codes_3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Visitors</p>
      BEGIN OF tys_visitors_2,
        "! <em>Value Control Structure</em>
        value_controls TYPE tys_value_controls_2,
        "! <em>Key property</em> ID
        id             TYPE sysuuid_x16,
        "! createdAt
        created_at     TYPE timestampl,
        "! createdBy
        created_by     TYPE c LENGTH 255,
        "! modifiedAt
        modified_at    TYPE timestampl,
        "! modifiedBy
        modified_by    TYPE c LENGTH 255,
        "! name
        name           TYPE string,
        "! email
        email          TYPE string,
        "! odata.etag
        etag           TYPE string,
      END OF tys_visitors_2,
      "! <p class="shorttext synchronized">List of Visitors</p>
      tyt_visitors_2 TYPE STANDARD TABLE OF tys_visitors_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Visits</p>
      BEGIN OF tys_visits_2,
        "! <em>Value Control Structure</em>
        value_controls   TYPE tys_value_controls_3,
        "! <em>Key property</em> ID
        id               TYPE sysuuid_x16,
        "! createdAt
        created_at       TYPE timestampl,
        "! createdBy
        created_by       TYPE c LENGTH 255,
        "! modifiedAt
        modified_at      TYPE timestampl,
        "! modifiedBy
        modified_by      TYPE c LENGTH 255,
        "! parent_ID
        parent_id        TYPE sysuuid_x16,
        "! visitor_ID
        visitor_id       TYPE sysuuid_x16,
        "! artistIndicator
        artist_indicator TYPE abap_bool,
        "! status_code
        status_code      TYPE int4,
        "! odata.etag
        etag             TYPE string,
      END OF tys_visits_2,
      "! <p class="shorttext synchronized">List of Visits</p>
      tyt_visits_2 TYPE STANDARD TABLE OF tys_visits_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VisitStatusCodes</p>
      BEGIN OF tys_visit_status_codes_2,
        "! <em>Value Control Structure</em>
        value_controls TYPE tys_value_controls_6,
        "! name
        name           TYPE c LENGTH 255,
        "! descr
        descr          TYPE c LENGTH 1000,
        "! <em>Key property</em> code
        code           TYPE int4,
        "! odata.etag
        etag           TYPE string,
      END OF tys_visit_status_codes_2,
      "! <p class="shorttext synchronized">List of VisitStatusCodes</p>
      tyt_visit_status_codes_2 TYPE STANDARD TABLE OF tys_visit_status_codes_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VisitStatusCodes_texts</p>
      BEGIN OF tys_visit_status_codes_texts_2,
        "! <em>Value Control Structure</em>
        value_controls TYPE tys_value_controls_9,
        "! <em>Key property</em> locale
        locale         TYPE c LENGTH 14,
        "! name
        name           TYPE c LENGTH 255,
        "! descr
        descr          TYPE c LENGTH 1000,
        "! <em>Key property</em> code
        code           TYPE int4,
        "! odata.etag
        etag           TYPE string,
      END OF tys_visit_status_codes_texts_2,
      "! <p class="shorttext synchronized">List of VisitStatusCodes_texts</p>
      tyt_visit_status_codes_texts_2 TYPE STANDARD TABLE OF tys_visit_status_codes_texts_2 WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! Currencies
        "! <br/> Collection of type 'Currencies'
        currencies                 TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CURRENCIES',
        "! Currencies_texts
        "! <br/> Collection of type 'Currencies_texts'
        currencies_texts           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CURRENCIES_TEXTS',
        "! PoetrySlams
        "! <br/> Collection of type 'PoetrySlams'
        poetry_slams               TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'POETRY_SLAMS',
        "! PoetrySlamStatusCodes
        "! <br/> Collection of type 'PoetrySlamStatusCodes'
        poetry_slam_status_codes   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'POETRY_SLAM_STATUS_CODES',
        "! PoetrySlamStatusCodes_texts
        "! <br/> Collection of type 'PoetrySlamStatusCodes_texts'
        poetry_slam_status_codes_t TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'POETRY_SLAM_STATUS_CODES_T',
        "! Visitors
        "! <br/> Collection of type 'Visitors'
        visitors                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VISITORS',
        "! Visits
        "! <br/> Collection of type 'Visits'
        visits                     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VISITS',
        "! VisitStatusCodes
        "! <br/> Collection of type 'VisitStatusCodes'
        visit_status_codes         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VISIT_STATUS_CODES',
        "! VisitStatusCodes_texts
        "! <br/> Collection of type 'VisitStatusCodes_texts'
        visit_status_codes_texts   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VISIT_STATUS_CODES_TEXTS',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
         "! Dummy field - Structure must not be empty
         dummy TYPE int1 VALUE 0,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for Currencies</p>
        "! See also structure type {@link ..tys_currencies_2}
        BEGIN OF currencies_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! localized
            localized TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'LOCALIZED',
            "! texts
            texts     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TEXTS',
          END OF navigation,
        END OF currencies_2,
        "! <p class="shorttext synchronized">Internal names for Currencies_texts</p>
        "! See also structure type {@link ..tys_currencies_texts_2}
        BEGIN OF currencies_texts_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF currencies_texts_2,
        "! <p class="shorttext synchronized">Internal names for PoetrySlams</p>
        "! See also structure type {@link ..tys_poetry_slams_2}
        BEGIN OF poetry_slams_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! status
            status                TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'STATUS',
            "! visitorsFeeCurrency
            visitors_fee_currency TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'VISITORS_FEE_CURRENCY',
            "! visits
            visits                TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'VISITS',
          END OF navigation,
        END OF poetry_slams_2,
        "! <p class="shorttext synchronized">Internal names for PoetrySlamStatusCodes</p>
        "! See also structure type {@link ..tys_poetry_slam_status_codes_2}
        BEGIN OF poetry_slam_status_codes_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! localized
            localized TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'LOCALIZED',
            "! texts
            texts     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TEXTS',
          END OF navigation,
        END OF poetry_slam_status_codes_2,
        "! <p class="shorttext synchronized">Internal names for PoetrySlamStatusCodes_texts</p>
        "! See also structure type {@link ..tys_poetry_slam_status_codes_3}
        BEGIN OF poetry_slam_status_codes_3,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF poetry_slam_status_codes_3,
        "! <p class="shorttext synchronized">Internal names for Visitors</p>
        "! See also structure type {@link ..tys_visitors_2}
        BEGIN OF visitors_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! visits
            visits TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'VISITS',
          END OF navigation,
        END OF visitors_2,
        "! <p class="shorttext synchronized">Internal names for Visits</p>
        "! See also structure type {@link ..tys_visits_2}
        BEGIN OF visits_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! parent
            parent  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PARENT',
            "! status
            status  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'STATUS',
            "! visitor
            visitor TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'VISITOR',
          END OF navigation,
        END OF visits_2,
        "! <p class="shorttext synchronized">Internal names for VisitStatusCodes</p>
        "! See also structure type {@link ..tys_visit_status_codes_2}
        BEGIN OF visit_status_codes_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! localized
            localized TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'LOCALIZED',
            "! texts
            texts     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TEXTS',
          END OF navigation,
        END OF visit_status_codes_2,
        "! <p class="shorttext synchronized">Internal names for VisitStatusCodes_texts</p>
        "! See also structure type {@link ..tys_visit_status_codes_texts_2}
        BEGIN OF visit_status_codes_texts_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF visit_status_codes_texts_2,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.

