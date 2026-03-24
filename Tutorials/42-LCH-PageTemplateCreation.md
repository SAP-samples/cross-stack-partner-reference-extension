# Page Template Creation (Launchpad)

This tutorial describes how to create a Fiori Launchpad Page Template that assembles apps (intents) from your Business Catalog for a coherent end-user page.

Overview
- Create a Launchpad Page Template that consumes items from the Business Catalog.
- Arrange sections and tiles/cards to present your IAM App on a Page.
- Prepare the Page for Space assignment.

References
- Page template creation: https://developers.sap.com/tutorials/abap-environment-create-spaces-pages-template.html#3e40e72f-9ef9-4285-a78b-03243f2cda61

Prerequisites
- Business Catalog exists with the IAM App intent: see [41 - LCH - Business Catalog Creation](41-LCH-BusinessCatalogCreation.md).
- IAM App intent defined: see [40 - LCH - IAM App Creation](40-LCH-IAMAppCreation.md).
- UI app deployed: see [39 - LCH - UI Deployment from BAS to S/4 System](39-LCH-UIDeploymentFromBAS.md).

Steps (Create Launchpad Page Template)
1. In **ADT**, open your ABAP project and expand package **ZPRA_PSE_LAUNCHER_UI**.
2. Create a new repository object:
   - Right-click the package > New > Other…
   - Navigate to **Launchpad Content** > **Page Template**.
   - Click Next.
3. Enter page details:
   - **Name:** **ZPRA_PSE_LCH_LPT**
   - **Description:** Page for launcher
   - **Package:** **ZPRA_PSE_LAUNCHER_UI**
   - **Transport:** assign as prompted
4. Add sections and content:
   - Follow the steps mentioned [here](https://developers.sap.com/tutorials/abap-environment-create-spaces-pages-template.html#3e40e72f-9ef9-4285-a78b-03243f2cda61) for scoping the page.
5. **Save and Activate:**
   - Save (Ctrl+S) and Activate (Ctrl+F3)


Next steps
- Proceed to [43 - LCH - Launchpad Page Template Scoping](43-LCH-LaunchpadPageTemplateScoping.md) to scope the page template for exposure.
