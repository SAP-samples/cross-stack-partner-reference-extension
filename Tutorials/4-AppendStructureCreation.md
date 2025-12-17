#  Creating a New Append Structure

To create a new append structure, follow these steps.
    
1.  In the Project Explorer, navigate to your favorite objects and right-click on `SDSALESDOC_INCL_EEW_PS`. Choose **New Append Structure**.

2. In the pop-up box, enter the following details and choose **Next**:
    - **Project** : `ET7_EN`
    - **Package** : `ZPRA_PSE_SALES_ORDER`
    - **Name** : `ZPRA_PSE_SO_APPEND`
    - **Description** : `Append poetry slam details to sales order`
   <p align="center">
       <img src="images/13-Append Structure.png"
       width="70%">


3. Select the `Poetry slam objects` transport request and choose **Finish**.

4. In the generated append structure, add the following fields to extend the sales order with poetry slam details:

    ```abap
      zzpra_pse_ps_id_sdh    : zpra_pse_ps_id;
      zzpra_pse_ps_title_sdh : zpra_pse_ps_title;
      zzpra_pse_ps_url_sdh   : zpra_pse_ps_url;
    ```
   <p align="center">
       <img src="images/13-Append Structure Fields.png" width="70%">
   </p>
5. **Activate** your changes.