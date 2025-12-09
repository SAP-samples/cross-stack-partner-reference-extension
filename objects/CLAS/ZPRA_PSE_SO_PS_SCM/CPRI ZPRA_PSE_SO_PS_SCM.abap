  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define Currencies</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_currencies_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Currencies_texts</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_currencies_texts_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PoetrySlams</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_poetry_slams_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PoetrySlamStatusCodes</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_poetry_slam_status_codes_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PoetrySlamStatusCodes_texts</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_poetry_slam_status_codes_3 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Visitors</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_visitors_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Visits</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_visits_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VisitStatusCodes</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_visit_status_codes_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VisitStatusCodes_texts</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_visit_status_codes_texts_2 RAISING /iwbep/cx_gateway.
