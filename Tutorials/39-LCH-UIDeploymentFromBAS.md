# UI Deployment from BAS to S/4 System

This tutorial describes how to deploy your BAS-generated freestyle Fiori app to the ABAP system (S/4) and verify created artifacts in the UI package.

**Overview**
- Deploy the app from **BAS** to the **SAPUI5 ABAP Repository** using the generator’s configuration or the deploy command.
- Confirm artifacts are created under the ABAP package **ZPRA_PSE_LAUNCHER_UI** in **ADT**.
- Prepare for **Launchpad** configuration and **IAM** setup.

**Prerequisites**
- App generated in BAS: see [38 - LCH - BAS Fiori App Creation (Freestyle)](38-LCH-BASFioriAppCreation.md).
- Destination to ABAP system configured in BTP subaccount: see [37 - LCH - Destinations for Fiori Deployment](37-LCH-DestinationsForFioriDeployment.md).
- Service binding active for backend: see [36 - LCH - Service Binding Creation](36-LCH-ServiceBindingCreation.md).
- ABAP package exists: **ZPRA_PSE_LAUNCHER_UI** (see [32 - LCH - Package Creation](32-LCH-PackageCreation.md)).

**Deploy options**
- Deploy from BAS command palette:
  - **Fiori: Deploy to SAPUI5 ABAP Repository**
- Deploy from terminal:
  - **npm run deploy** (uses the generator’s deployment configuration)

**Steps: Deploy from BAS command palette**
1. Open the BAS project.
2. Run Fiori: Deploy to SAPUI5 ABAP Repository.
3. Select the ABAP destination (same used for “Connect to system”).
4. Provide repository details:
   - **BSP Application name:** **ZPRA_PSE_LCH_SDF** (or your chosen BSP name)
   - **Package:** **ZPRA_PSE_LAUNCHER_UI**
   - **Transport request:** create/select as required.
5. Confirm and run deployment.
6. Observe deployment output and ensure success.

**Steps: Deploy from terminal**
1. Open the BAS terminal in your project.
2. Run:
   - **npm run deploy**
3. When prompted, provide the same destination and repository details:
   - **ABAP destination**
   - **BSP Application name:** **ZPRA_PSE_LCH_SDF**
   - **Package:** **ZPRA_PSE_LAUNCHER_UI**
   - **Transport request**
4. Confirm deployment completes successfully.

**Verify artifacts in ADT**
- Open **ADT** and navigate:
  - **Project Explorer > Favorite Packages > ZPRA_PSE_LAUNCHER_UI**
- Verify the UI repository artifacts (e.g., BSP application, resources) are present and activated.

**Next steps**
- Proceed to [40 - LCH - IAM App Creation](40-LCH-IAMAppCreation.md) to register the app in the UI package.
