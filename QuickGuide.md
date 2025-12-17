# Quick Guide: Consuming On-Stack Extensions with Multi-Off Delivery

Implementation code is available for reference in ([cross-stack-partner-reference-extension](./objects/)).

## How to Consume On-Stack Extensions in SAP S/4HANA Cloud Public Edition

Use the Git-enabled Change and Transport System (gCTS) to connect your SAP S/4HANA Cloud Public Edition to the remote Git repository that contains the extension. Follow the steps below in [Procedure](#procedure) section to pull the extension objects into your target SAP S/4HANA Cloud Public Edition system.

### Procedure

1. [**Prerequisites on Target Landscapes**](https://help.sap.com/docs/SAP_S4HANA_CLOUD/6aa39f1ac05441e5a23f484f31e477e7/a992a1c115f24e0fab1e9a67b15b9aea.html) 
2. Pull the extension objects into your target system from this repository: https://github.com/SAP-samples/cross-stack-partner-reference-extension  following the guide: [**Connecting to the Repository on Target System**](https://help.sap.com/docs/SAP_S4HANA_CLOUD/6aa39f1ac05441e5a23f484f31e477e7/9f329770b7c04b03af44de6cb350c71c.html)



#### Secure Integration

To enable secure integration between **SAP S/4HANA Cloud Public Edition** and the **Poetry Slam Manager** application on **SAP BTP**, you must configure destinations on SAP BTP and set up communication artifacts in the SAP S/4HANA Cloud Public Edition system.

Follow the detailed instructions in the [Integration Setup Guide](./Tutorials/16-Integration.md).

## Review End-to-End Solution in SAP S/4HANA Cloud Public Edition System

For the detailed step-by-step process of reviewing the end-to-end solution, refer to [Review End-to-End Solution in SAP S/4HANA Cloud Public Edition Development System](./Tutorials/17-review_end_to_end_solution.md).
