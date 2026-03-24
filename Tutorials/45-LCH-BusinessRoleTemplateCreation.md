# LCH - Business Role Template Creation

This tutorial describes how to create a Business Role Template that bundles your Launchpad content (catalogs, pages, spaces) for assignment to users via business roles. It also covers creating the assignment artifact that links the Space Template to the Business Role Template.

Overview
- Create a Business Role Template (BRT) that aggregates Launchpad content required for the launcher app.
- Create the Business Role Template–Launchpad Space Template Assignment artifact to link the Space Template to the role template.
- Prepare for final role maintenance and assignment (covered in page 46).

References
- Business Role Template creation (see section in spaces/pages tutorial):
  https://developers.sap.com/tutorials/abap-environment-create-spaces-pages-template.html#60276943-5278-4e2b-a63b-59e8d1bd87be

Artifacts
- Business Role Template:
  - **Name:** **ZPRA_PSE_LCH_BRT**
  - **Description:** Business role template for launcher access.
- Business Role Template – Launchpad Space Template Assignment:
  - **Name:** **ZPRA_PSE_LCH_BRT_LST**
  - **Description:** Assignment of space template to business role template.

Prerequisites
- Business Catalog created and scoped: see [41 - LCH - Business Catalog Creation](41-LCH-BusinessCatalogCreation.md). Catalog name: ZPRA_PSE_LCH_BC.
- Page Template created and scoped: see [42 - LCH - Page Template Creation](42-LCH-PageTemplateCreation.md), [43 - LCH - Launchpad Page Template Scoping](43-LCH-LaunchpadPageTemplateScoping.md). Page Template name: ZPRA_PSE_LCH_LPT.
- Space Template created and scoping enabled via class: see [44 - LCH - Space Template Creation and Scoping](44-LCH-SpaceTemplateCreationAndScoping.md). Space Template name: ZPRA_PSE_LCH_LST.
- IAM App and target mapping created: see [40 - LCH - IAM App Creation](40-LCH-IAMAppCreation.md). IAM App: ZPRA_PSE_LCH_IAM_EXT; intent: ZPRA_PSE_LAUNCHER/display.
- UI app deployed to ABAP repository: see [39 - LCH - UI Deployment from BAS to S/4 System](39-LCH-UIDeploymentFromBAS.md).

Steps in ADT (Create Business Role Template)
1. Open your ABAP project in **ADT** and expand package **ZPRA_PSE_LAUNCHER_UI**.
2. **Create Business Role Template:**
   - Right-click the package > New > Other…
   - Select **Business Role Template**.
   - Click Next.
3. **Enter BRT details:**
   - **Name:** **ZPRA_PSE_LCH_BRT**
   - **Description:** Business role template for launcher access.
   - **Package:** **ZPRA_PSE_LAUNCHER_UI**
   - **Transport request:** assign as prompted.
4. **Add Catalog assignment:**
   - In the BRT editor, add **Catalog** **ZPRA_PSE_LCH_BC** (Business Catalog for launcher).
   - Save (Ctrl+S).

**Steps in ADT (Create Business Role Template – Launchpad Space Template Assignment)**
1. **Create the assignment artifact:**
   - Right-click the package ZPRA_PSE_LAUNCHER_UI > New > Other…
   - Navigate to **Launchpad Content** > **Business Role Template – Launchpad Space Template Assignment**.
   - Click Next.
2. **Enter assignment details:**
   - **Name:** **ZPRA_PSE_LCH_BRT_LST**
   - **Description:** Assignment of space template to business role template
   - **Package:** **ZPRA_PSE_LAUNCHER_UI**
   - **Transport request:** assign as prompted.
3. **Assign the Space Template and Role Template:**
   - **Business Role Template:** **ZPRA_PSE_LCH_BRT**
   - **Space Template:** **ZPRA_PSE_LCH_LST**
   - Save (Ctrl+S).
4. **Activate:**
   - **Activate** the assignment object (Ctrl+F3).


Next steps
- Proceed to [46 - LCH - Maintain Business Roles](46-LCH-MaintainBusinessRoles.md) to create Business Roles from the template, assign catalogs/spaces/pages, and allocate user authorizations.
