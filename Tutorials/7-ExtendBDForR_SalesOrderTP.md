# Extending the Behavior Definition R_SalesOrderTP to Include the Poetry Slam Logic

To extend the **R_SalesOrderTP** behavior definition, follow these steps:
   
1. In the ADT menu bar, choose **Open ABAP Development Object**. In the Windows operating system, you can access it using the keyboard shortcut `Control + Shift + A`.

2. Search for **R_SalesOrderTP**.
    
3. Select the **R_SalesOrderTP** behavior definition and choose **OK**.
    
4. In the **Project Explorer** view, choose **Link with Editor**, so that the object is visible in the Project Explorer.
    
5. Right-click the **R_SALESORDERTP** behavior definition and choose **New Behavior Extension**.
    
6. Enter the following data:
    
    - **Package**: `ZPRA_PSE_SALES_ORDER`
    
    - **Name**: `ZPRA_PSE_R_SO_BEXT`

    - **Description**: `Behavior extension of R_SalesOrderTp for PSE`

    - **BO Interface**: `I_SALESORDERTP`
    
   
7. Choose **Next**.

8. Select a transport request and choose **Next**.

9. Save and activate your changes.

10. In the behavior extension file, select `zzpra_pse_assign_ps` and choose **Ctr + 1**.
    
11. In the Quick Assist Proposal dialog box, choose **Create Behavior Implementation Class** (ZPRA_PSE_R_SO_BEXT).
    
12. Enter the behavior implementation for **ZPRA_PSE_R_SO_BEXT** as the description and choose **Next**.
    
13. Select a transport request and choose **Finish**.

14. Save and activate the generated class.
    
15. Inside your **ZPRA_PSE_R_SO_BEXT** behavior definition, replace the generated code with the following code:

    ```ABAP
        extension using interface i_salesordertp
        implementation in class zbp_pra_pse_r_so_bext unique;
        extend behavior for SalesOrder
        {

        action ( authorization : update , features : instance ) zzpra_pse_assign_ps
        parameter ZPRA_PSE_ASSIGN_PSE_TO_SO  result [0..1] $self;

        field(readonly) zzpra_pse_ps_id_sdh, zzpra_pse_ps_title_sdh;

        side effects {
            action zzpra_pse_assign_ps affects entity _Item._SalesOrder;
        }
        }
    ```
    <!-- ![Extended Behavior Definition](images/17-Behaviour%20Extension.png) -->
    
    <!-- TO DO: Make link as relative not to erp4sme-->
    *Note: Find the **ZPRA_PSE_R_SO_BEXT** behavior definition code [here](../objects/BDEF/ZPRA_PSE_R_SO_BEXT/REPS%20ZPRA_PSE_R_SO_BEXT============BD.abap)* 


16. Save and activate your changes.
