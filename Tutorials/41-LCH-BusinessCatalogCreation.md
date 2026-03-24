# Business Catalog Creation (in UI Package)

This tutorial describes how to create a Business Catalog in the ABAP system to group your IAM App and make it available for pages/spaces and role assignment.

Overview
- Create a Business Catalog in package **ZPRA_PSE_LAUNCHER_UI** to contain the IAM App intent.
- Add the app (target mapping) to the catalog.
- Prepare the catalog for use in page templates, spaces, and roles.

References
- Business Catalog creation: https://developers.sap.com/tutorials/abap-environment-deploy-fiori-elements-ui.html#68d08b95-83f6-44b8-9567-0d94c31208d3

Prerequisites
- IAM App exists for your UI application: see [40 - LCH - IAM App Creation](40-LCH-IAMAppCreation.md).
- UI app deployed to ABAP repository: see [39 - LCH - UI Deployment from BAS to S/4 System](39-LCH-UIDeploymentFromBAS.md).
- ABAP package for UI content available: **ZPRA_PSE_LAUNCHER_UI** ([32 - LCH - Package Creation](32-LCH-PackageCreation.md)).

Steps (Create Business Catalog)
1. In **ADT**, open your ABAP project and expand package **ZPRA_PSE_LAUNCHER_UI**.
2. Create a new repository object:
   - Right-click the package > New > Other…
   - Navigate to **Launchpad Content** (or **SAP Fiori Content**) > **Business Catalog**.
   - Click Next.
3. Enter catalog details:
   - **Name:** **ZPRA_PSE_LCH_BC**
   - **Description:** Business Catalog for launcher
   - **Package:** **ZPRA_PSE_LAUNCHER_UI**
   - **Transport:** assign as prompted
4. Save and Activate:
   - Save (Ctrl+S) and Activate (Ctrl+F3)


Next steps
- Proceed to [42 - LCH - Page Template Creation](42-LCH-PageTemplateCreation.md) to design the Launchpad page that uses this catalog.
