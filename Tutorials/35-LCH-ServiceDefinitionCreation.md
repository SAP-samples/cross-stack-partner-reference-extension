# Service Definition Creation

This tutorial provides the steps to create the Service Definition **ZPRA_PSE_LCH_SDF** in ADT under the package **ZPRA_PSE_LAUNCHER_SERVICE** to expose the custom entity **ZPRA_PSE_LCH_DDF**.

**Overview**
- Create a CDS Service Definition in ADT to expose the custom entity for OData usage.
- Use the name **ZPRA_PSE_LCH_SDF** with description **Service Definition to expose custom entity**.
- Include an alias for the exposed entity as **PSE_Launcher**.

**Steps in ADT (Create Service Definition)**
1. In ADT, open your ABAP project and expand the package **ZPRA_PSE_LAUNCHER_SERVICE**.
2. Create a new Service Definition:
   - Right-click the package.
   - Choose **New > Other…**
   - Navigate to **Core Data Services > Service Definition**.
   - Click **Next**.
3. Enter object details:
   - **Name:** **ZPRA_PSE_LCH_SDF**
   - **Description:** Service Definition to expose custom entity
   - **Package:** **ZPRA_PSE_LAUNCHER_SERVICE**
   - Assign to a transport request when prompted.
   - Click **Finish**.
4. Replace the generated template with the following content:
   ```
   @EndUserText.label: 'Service Definition to expose DDF'
   define service ZPRA_PSE_LCH_SDF {
     expose ZPRA_PSE_LCH_DDF as PSE_Launcher;
   }
   ```
5. **Save and Activate**
   - Press Ctrl+S (Cmd+S on macOS) to save.
   - Activate (Ctrl+F3 or right-click > Activate).

**Notes**
- The alias **PSE_Launcher** becomes the entity set name in the OData service once you create a Service Binding.
- Ensure the entity name **ZPRA_PSE_LCH_DDF** matches exactly the custom entity created earlier.

**Next steps**
- Proceed to create an OData V4 Service Binding in [36 - LCH - Service Binding Creation](36-LCH-ServiceBindingCreation.md).
