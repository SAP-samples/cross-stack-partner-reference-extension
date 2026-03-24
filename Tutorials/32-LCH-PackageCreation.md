# Creating ABAP Packages for the Launcher

Create three ABAP packages for the Launcher feature: one root package and two subpackages for service and UI content.

Follow these steps in **ABAP Development Tools (ADT)**:

## 1) Add the superpackage to Favorites (if not already)
   - In the Project Explorer, right-click **Favorite Packages** and choose **Add Package**.
   - In the popup, search for **ZPRA_PSE_SALESORDER** and choose **OK**.

## 2) Create the root package **ZPRA_PSE_LAUNCHER**
   - Right-click the **ZPRA_PSE_SALESORDER** package and select **New -> ABAP Package**.
   - Enter the following and choose **Next**:
     - **Name:** **ZPRA_PSE_LAUNCHER**
     - **Description:** Poetry Slam Event Launcher
   - Leave **Application Component** empty and choose **Next**.
   - Choose **Create a new request**. For the **transport request description**, enter **Launcher packages creation**.
   - Choose **Finish**.
   - The **ZPRA_PSE_LAUNCHER** package appears under **ZPRA_PSE_SALESORDER**.

## 3) Create subpackage **ZPRA_PSE_LAUNCHER_SERVICE**
   - Right-click **ZPRA_PSE_LAUNCHER** and select **New -> ABAP Package**.
   - Enter the following and choose **Next**:
     - **Name:** **ZPRA_PSE_LAUNCHER_SERVICE**
     - **Description:** Poetry Slam Event Launcher Service
     - **Superpackage/Parent:** **ZPRA_PSE_LAUNCHER** (should be prefilled, verify)
   - Leave **Application Component** empty and choose **Next**.
   - Select the same **transport request** created in step 2.
   - Choose **Finish**.

## 4) Create subpackage **ZPRA_PSE_LAUNCHER_UI**
   - Right-click **ZPRA_PSE_LAUNCHER** and select **New -> ABAP Package**.
   - Enter the following and choose **Next**:
     - **Name:** **ZPRA_PSE_LAUNCHER_UI**
     - **Description:** Poetry Slam Event Launcher UI
     - **Superpackage/Parent:** **ZPRA_PSE_LAUNCHER** (should be prefilled, verify)
   - Leave **Application Component** empty and choose **Next**.
   - Select the same **transport request** created in step 2.
   - Choose **Finish**.

**Resulting package hierarchy**
- **ZPRA_PSE_SALESORDER**
  - **ZPRA_PSE_LAUNCHER**
    - **ZPRA_PSE_LAUNCHER_SERVICE**
    - **ZPRA_PSE_LAUNCHER_UI**

**Next steps**
- Proceed to [33 - LCH - Data Definition Creation](33-LCH-DataDefinitionCreation.md) to define the unmanaged CDS custom entity.

