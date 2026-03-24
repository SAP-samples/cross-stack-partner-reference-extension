# IAM App Creation (in UI Package)

This tutorial describes how to create an IAM App artifact in the ABAP system to represent your deployed Fiori application and define its Launchpad intent.

Overview
- Create an IAM App in package ZPRA_PSE_LAUNCHER_UI to register the deployed UI (BSP application).
- Define semantic object/action and target mapping so the app can be launched from the Launchpad.
- Prepare for cataloging, pages/spaces, and role assignment.

References
- IAM App creation under ZPRA_PSE_LAUNCHER_UI: https://developers.sap.com/tutorials/abap-environment-deploy-fiori-elements-ui.html#b244534e-c5a8-407b-9b14-00c9f15c1bc2

Prerequisites
- UI app deployed to ABAP repository: see [39 - LCH - UI Deployment from BAS to S/4 System](39-LCH-UIDeploymentFromBAS.md).
- Service binding active and reachable: see [36 - LCH - Service Binding Creation](36-LCH-ServiceBindingCreation.md).
- ABAP package for UI content available: [32 - LCH - Package Creation](32-LCH-PackageCreation.md).

Steps in ADT (Create IAM App)
1. In ADT, open your ABAP project and expand package ZPRA_PSE_LAUNCHER_UI.
2. Create a new repository object:
   - Right-click the package > New > Other…
   - Navigate to SAP Fiori or IAM category > IAM App (naming and menu entries can vary by release).
   - Click Next.
3. Enter basic details:
   - **Name:** **ZPRA_PSE_LCH_IAM_EXT**
   - **Description:** IAM App for launcher
   - **Package:** **ZPRA_PSE_LAUNCHER_UI**
   - **Transport request:** assign as prompted
4. **Add Launchpad App Descriptor Item:**
   - In **ADT**, open the created IAM App (**ZPRA_PSE_LCH_IAM_EXT**) under package **ZPRA_PSE_LAUNCHER_UI**.
   - Add the **Fiori Launchpad App Descriptor Item ID**. In ADT, expand **Fiori User Interface → Launchpad Descriptor Items** to locate the ID (For example: **ZPRA_PSE_LCH_UI5R**)
   - This descriptor item ensures the app can be discovered and launched correctly in the **Launchpad**.

5. Save and Activate:
   - Save (Ctrl+S) and Activate (Ctrl+F3)




Next steps
- Proceed to [41 - LCH - Business Catalog Creation](41-LCH-BusinessCatalogCreation.md) to include the app in a catalog.
