# Space Template Creation and Scoping

This tutorial describes how to create a Fiori Launchpad Space Template, assign your Page Template to it, and scope the Space so end users can access the content via roles.

Overview
- Create a Space Template that references your Page Template.
- Scope and activate the Space Template for role assignment and Launchpad visibility.

References
- Space template creation: https://developers.sap.com/tutorials/abap-environment-create-spaces-pages-template.html#c1391326-eccd-4662-aae5-edc9c288c46c
- Scoping Space via class (uncomment line in scoping class): https://developers.sap.com/tutorials/abap-environment-create-spaces-pages-template.html#55a7006d-4bb7-423a-8dcc-dd1e075e9207

Prerequisites
- Page Template created and scoped: see [42 - LCH - Page Template Creation](42-LCH-PageTemplateCreation.md) and [43 - LCH - Launchpad Page Template Scoping](43-LCH-LaunchpadPageTemplateScoping.md).
- Business Catalog containing the IAM App intent is active and in scope: see [41 - LCH - Business Catalog Creation](41-LCH-BusinessCatalogCreation.md).
- IAM App created and active: see [40 - LCH - IAM App Creation](40-LCH-IAMAppCreation.md).
- UI app deployed to ABAP repository: see [39 - LCH - UI Deployment from BAS to S/4 System](39-LCH-UIDeploymentFromBAS.md).

Steps (Create Launchpad Space Template)
1. In **ADT**, open your ABAP project and expand package **ZPRA_PSE_LAUNCHER_UI**.
2. Create a new repository object:
   - Right-click the package > New > Other…
   - Navigate to **Launchpad Content** > **Space Template**.
   - Click Next.
3. **Enter space details:**
   - **Name:** **ZPRA_PSE_LCH_LST**
   - **Description:** Space for launcher
4. **Add pages:**
   - Add the **Page Template** created earlier:
     - **Page Template:** **ZPRA_PSE_LCH_LPT**
5. **Save and Activate:**
   - **Save** (Ctrl+S) and **Activate** (Ctrl+F3)

**Steps (Scope the Space Template)**
1. **Open scoping provider class**
   - In **ADT**, open the global class **zpra_cl_scope_page_space** in package **ZPRA_PSE_LAUNCHER_UI**.
2. **Enable space scoping in class**
   - In the class implementation, locate the section for **Space/Page** scoping (as described in the referenced tutorial).
   - **Uncomment** the line related to scoping the **Space** to enable Space visibility.
   - **Save**, **Activate** and **Run** the class.



**Next steps**
- Proceed to [45 - LCH - Business Role Template Creation](45-LCH-BusinessRoleTemplateCreation.md) to create the role template bundling catalog, spaces/pages, and app access.
