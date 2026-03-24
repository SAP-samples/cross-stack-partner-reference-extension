# Launchpad Page Template Scoping

This tutorial describes how to scope your Page Template so that it is available for assignment to Spaces and ultimately visible in the Launchpad.

Overview
- Scope the Page Template to make it available to the consuming Spaces.
- Ensure that the underlying catalog and IAM App intents are in scope as well.
- Prepare for Space Template creation and assignment.

References
- Page template creation: https://developers.sap.com/tutorials/abap-environment-create-spaces-pages-template.html#3e40e72f-9ef9-4285-a78b-03243f2cda61
- Scoping page (overview): https://developers.sap.com/tutorials/abap-environment-create-spaces-pages-template.html#2fb03210-545f-4cd3-9418-e599e98c03ec
- Scoping provider class example (aligns with zpra_cl_scope_page_space): https://developers.sap.com/tutorials/abap-environment-create-spaces-pages-template.html#6fc4d5ad-5380-41b6-b4bf-b37a1f18c8d9

Prerequisites
- Page Template created and active: see [42 - LCH - Page Template Creation](42-LCH-PageTemplateCreation.md).
- Business Catalog created with the IAM App intent: see [41 - LCH - Business Catalog Creation](41-LCH-BusinessCatalogCreation.md).
- IAM App created and active: see [40 - LCH - IAM App Creation](40-LCH-IAMAppCreation.md).

Steps (Scope the Page Template)
1. **Create scoping class** 
   - Create an ABAP class in package **ZPRA_PSE_LAUNCHER_UI**:
     - **Name:** **zpra_cl_scope_page_space**
     - **Description:** Scope provider for **Page/Space**
     - Get the code from the reference link.
   - **Activate the class.** You can refine the implementation later to restrict visibility conditions as required by your landscape.
2. **Save and Activate the Page Template**
   - **Save** (Ctrl+S) and **Activate** (Ctrl+F3).


Next steps
- Proceed to [44 - LCH - Space Template Creation and Scoping](44-LCH-SpaceTemplateCreationAndScoping.md) to create and scope a Space Template that references this Page Template.
