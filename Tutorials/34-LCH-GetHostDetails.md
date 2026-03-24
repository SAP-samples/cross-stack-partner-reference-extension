# Get Host Details

This tutorial provides the steps to create the ABAP class **ZPRA_CL_PSE_COM_SYS** in ADT. The class implements **IF_RAP_QUERY_PROVIDER** and returns the hostname for a given communication system. It is designed to serve the unmanaged CDS Custom Entity **ZPRA_PSE_LCH_DDF** created in the previous step.

**Overview**
- Create an ABAP class **ZPRA_CL_PSE_COM_SYS** that implements **IF_RAP_QUERY_PROVIDER**.
- Fetch the communication system host via **cl_com_system_factory** and return it to the custom entity.
- Use constant **comm_sys_id** = '**ZPRA_PSE_SO_URL**' to identify the communication system.

**Prerequisites**
- The unmanaged CDS Custom Entity **ZPRA_PSE_LCH_DDF** is created and active. See tutorial [33 - LCH - Data Definition Creation](33-LCH-DataDefinitionCreation.md).
- A Communication System configured with the ID **ZPRA_PSE_SO_URL**. See tutorial [19 - Communication System](19-Communication%20System.md).

**Steps in ADT (Create ABAP Class)**
1. In ADT, open your ABAP project and expand the target package (e.g., **ZPRA_PSE_LAUNCHER_SERVICE**).
2. Create a new ABAP class:
   - Right-click the package.
   - **New > ABAP Class.**
3. Enter class details:
   - **Name:** **ZPRA_CL_PSE_COM_SYS**
   - **Description:** Logic to fetch the hostDetails from communication system
4. **Implement the RAP query provider interface:**
   - Open the class and add **INTERFACES if_rap_query_provider** to the PUBLIC SECTION (or use ADT quick-fix).
5. Paste the implementation code shown below.
6. **Save and Activate:**
   - Press Ctrl+S (Cmd+S on macOS) to save.
   - Activate the class (Ctrl+F3 or right-click > Activate).

**Class code (as provided)**
```
CLASS zpra_cl_pse_com_sys DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zpra_cl_pse_com_sys IMPLEMENTATION.

  METHOD if_rap_query_provider~select.

    DATA com_sys TYPE STANDARD TABLE OF zpra_pse_lch_ddf.
    CONSTANTS comm_sys_id TYPE c LENGTH 60 VALUE `ZPRA_PSE_SO_URL`.

    cl_com_system_factory=>create_instance( )->get_cs_by_id(
                            EXPORTING iv_id = comm_sys_id
                            IMPORTING eo_com_system_v2 = DATA(com_sys_res) ).

    com_sys = VALUE #( ( system_name = comm_sys_id host = com_sys_res->get_hostname( ) ) ).

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( lines( com_sys ) ).
    ENDIF.

    IF io_request->is_data_requested( ).
      io_response->set_data( com_sys ).
    ENDIF.

    " dummy call to meet the contract check
    io_request->get_paging( ).

  ENDMETHOD.
ENDCLASS.
```

**Next steps**
- Proceed to [35 - LCH - Service Definition Creation](35-LCH-ServiceDefinitionCreation.md) to define the service.
