# Maintain Business Roles and Test Final Integration

This tutorial describes how to create and maintain a Business Role based on your Business Role Template, assign the required Launchpad content (catalogs, pages, spaces), allocate users, and validate end-to-end access in the Launchpad.

Overview
- Create a Business Role from the template to bundle Launchpad content for end users.
- Ensure the role includes the Business Catalog and the Launchpad Space/Page content.
- Assign the role to users and test the final integration in the Launchpad.

References
- Maintain Business Roles (spaces/pages template): https://developers.sap.com/tutorials/abap-environment-create-spaces-pages-template.html#54aa5289-ff73-4ee7-bd50-7586ec12efd8

Prerequisites
- Business Role Template created: see [45 - LCH - Business Role Template Creation](45-LCH-BusinessRoleTemplateCreation.md)
  - Template: ZPRA_PSE_LCH_BRT
  - Space assignment artifact: ZPRA_PSE_LCH_BRT_LST (links Space Template to the BRT)
- Space Template created and scoping enabled via class: see [44 - LCH - Space Template Creation and Scoping](44-LCH-SpaceTemplateCreationAndScoping.md)
  - Space Template: ZPRA_PSE_LCH_LST
  - Scoping class: zpra_cl_scope_page_space (line for Space scoping uncommented)
- Page Template created and scoped: see [42 - LCH - Page Template Creation](42-LCH-PageTemplateCreation.md), [43 - LCH - Launchpad Page Template Scoping](43-LCH-LaunchpadPageTemplateScoping.md)
  - Page Template: ZPRA_PSE_LCH_LPT
- Business Catalog created/scoped: see [41 - LCH - Business Catalog Creation](41-LCH-BusinessCatalogCreation.md)
  - Catalog: ZPRA_PSE_LCH_BC
  - Contains intent ZPRA_PSE_LAUNCHER/display pointing to BSP app ZPRA_PSE_LCH_SDF
- IAM App and descriptor item created: see [40 - LCH - IAM App Creation](40-LCH-IAMAppCreation.md)
  - IAM App: ZPRA_PSE_LCH_IAM_EXT
  - Descriptor Item: ZPRA_PSE_LCH_UI5R (SAPUI5 Repository)
- UI app deployed to ABAP repository: see [39 - LCH - UI Deployment from BAS to S/4 System](39-LCH-UIDeploymentFromBAS.md)

**Steps (UI - S/4HANA Fiori apps)**
- Open the S/4HANA Fiori Launchpad with an administrator account.
- **Maintain Business Roles app:**
  - Launch the “Maintain Business Roles” application.
  - **Create a Business Role from Template:**
    - Choose “Create from Template” (wording may vary by release).
    - **Select the template:** **ZPRA_PSE_LCH_BRT**.
    - **Enter Business Role ID** (e.g., **ZPRA_PSE_LCH_BR**) and **Description** (e.g., Business role for launcher access).
    - Save.
  - **Assign Business Catalog:**
    - In the role, add **Catalog** **ZPRA_PSE_LCH_BC** (Business Catalog for launcher).
    - Save changes.
  - **Assign Space (and Page):**
    - In **Assigned Spaces**, add **Space** **ZPRA_PSE_LCH_LST**.
    - Ensure the **Page** (**ZPRA_PSE_LCH_LPT**) under the **Space** is available to the role (some releases show page details within the Space assignment).
    - Save changes.
  - **Assign Users:**
    - Add the user IDs who should have access to the launcher page/app.
    - Save.

Validation (End-to-end test)
  - Log in as a user assigned to **ZPRA_PSE_LCH_BR**.
  - Navigate to the **Space** defined by **ZPRA_PSE_LCH_LST** and open the **Page** (**ZPRA_PSE_LCH_LPT**).
  - Confirm the tile for **ZPRA_PSE_LAUNCHER/display** is visible.
  - Click the tile and verify the Fiori app **ZPRA_PSE_LCH_SDF** launches and reads host details via the controller logic (side-by-side behavior, if configured).

**Congratulations!**
You have completed the Launchpad Integration setup. Your side-by-side application is now accessible through the S/4HANA Launchpad.

