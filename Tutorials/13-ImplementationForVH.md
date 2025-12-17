# Implementation Logic for the Value Help

1. Create a new class named **ZCL_PRA_PSE_VH** with the name given in [Data Definition for Value Help](./11-DataDefinitionForValuehelp.md) and choose **Next**.

2. On the **Global Class** tab, replace the existing code with the following [code](../objects/CLAS/ZCL_PRA_PSE_VH/CPRI%20ZCL_PRA_PSE_VH.abap).

3. Save and activate your changes.   


## Helper Class

Include the helper class  [ZCL_PRA_PSE_SO_EXT_UTIL](../objects/CLAS/ZCL_PRA_PSE_SO_EXT_UTIL/) in your implementation. This class provides utility methods that are used within **ZCL_PRA_PSE_VH**.  

Be sure to review and use the relevant methods from the helper class as needed in your value help implementation.

