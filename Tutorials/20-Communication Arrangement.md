# Creating Communication Arrangements   

To create the necessary communication arrangements, follow these steps:

1. On SAP Fiori launchpad, open the **Communication Arrangements** app.

2. Choose **New**. Enter the following data and choose **Create**:

    - **Scenario**: `ZPRA_PSE_SO_CS`

    - **Arrangement Name**: `ZPRA_PSE_SO_CA`

3. In the **Common Data** section, set the **Communication System** to **ZPRA_PSE_S4HANA_TO_PS**.

4. In the **Outbound Services** section, change the **Path** to */odata/v4* and choose **Save**.

5. Choose **Check Connection**. You'll see the success message **Ping Successful**.

    ![Communication Arrangement](images/29-Communication%20Arrangement.png)

6. Create another communication arrangement named **ZPRA_PSE_SO_I_CA** with the following details:

    -   **Scenario ID** :   `SAP_COM_0109`
    -   **Arrangement Name**: `ZPRA_PSE_SO_I_CA`
    -   **Communication System**: `ZPRA_PSE_S4HANA_BP_TO_PS`
    -   Deactivate all outbound services by deselecting the **Active** checkbox.

7. Create another communication arrangement named **/ZPRA_PSE_BP_CA** with the following details:

    -   **Scenario ID** :   `SAP_COM_0008`
    -   **Arrangement Name**: `ZPRA_PSE_BP_CA`
    -   **Communication System**: `ZPRA_PSE_S4HANA_BP_TO_PS`
    -   Deactivate all outbound services by deselecting the **Active** checkbox.

        ![Arrangements](images/30-1-All%20Arangements.png)

