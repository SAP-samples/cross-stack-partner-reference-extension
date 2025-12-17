# Extending the Behavior Definition of Projection View C_SALESORDERMANAGE to Include the Poetry Slam Action

To extend the behavior definition of the **C_SALESORDERMANAGE** projection view, follow these steps:
   
1. In the ADT menu bar, choose **Open ABAP Development Object**.

2. Search for **C_SALESORDERMANAGE**.
   
3. Select the **C_SALESORDERMANAGE** behavior definition and choose **OK**.
   
4. In the **Project Explorer** view, choose **Link with Editor**, so that the object is visible in the Project Explorer.
   
5. Right-click the **C_SALESORDERMANAGE** behavior definition and choose **New Behavior Extension**.
   
6. Enter the following data:
   
    - **Package**: `ZPRA_PSE_SALES_ORDER`
   
    - **Name**: `ZPRA_PSE_C_SOMANAGE_BEXT`

    - **Description**: `Sales Order Behavior Extension for pse`
    
7. Choose **Next**.

8. Select a transport request and choose **Finish**.

9. Replace the generated code with the following ABAP code:

    ```ABAP
        extension for projection;

        extend behavior for SalesOrder
        {
        use action zzpra_pse_assign_ps ;
        }

        extend behavior for SalesOrderItem
        {
        }
    ```

10. Save and activate your changes.
