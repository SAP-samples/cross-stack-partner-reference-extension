# Integration Setup Guide

This guide outlines the steps required to securely integrate **SAP S/4HANA Cloud Public Edition** with the **Poetry Slam Manager (PSM)** application running on **SAP BTP**.

---

## Step 1: Create a Communication User in SAP S/4HANA Cloud Public Edition

To enable secure communication between SAP S/4HANA Cloud Public Edition and the Poetry Slam Manager application, you need to create a communication user. This user will be used for authentication during the integration process.

Follow the steps in the tutorial: [Create a Communication User](./18-CommunicationUser.md).


## Step 2: Configure the Service Broker in SAP BTP Subaccount

To establish secure communication between SAP **S/4HANA Cloud Public Edition** and the **Poetry Slam Manager** application, register the service broker in your SAP BTP subaccount and create a service broker instance. This step ensures that the **Poetry Slam Manager** service is available for consumption by SAP S/4HANA Cloud Public Edition.

Refer to the detailed instructions in the **Partner-Reference-Application** documentation: [(**Configure the Service Broker in a Consumer SAP BTP Subaccount**)](https://github.com/SAP-samples/partner-reference-application/blob/main/Tutorials/42b-Multi-Tenancy-Provisioning-Service-Broker.md#configure-the-service-broker-in-a-consumer-sap-btp-subaccount).


## Step 3: Configure Destinations in SAP BTP Subaccount

Create destinations in your SAP BTP subaccount using the communication user's credentials from SAP S/4HANA Cloud Public Edition created in [step 1](./16-Integration.md#step-1-create-a-communication-user-in-sap-s4hana-cloud-public-edition).

Refer to the detailed instructions in the **Partner-Reference-Application** documentation.[( **Set Up Destinations to Connect the SAP BTP Application to SAP S/4HANA Cloud Public Edition** )](https://github.com/SAP-samples/partner-reference-application/blob/main/Tutorials/34b-Multi-Tenancy-Provisioning-Connect-S4HC.md#set-up-destinations-to-connect-the-sap-btp-application-to-sap-s4hana-cloud-public-edition)


## Step 4: Create Communication Systems in SAP S/4HANA Cloud Public Edition

After configuring the destinations in SAP BTP subaccount, you need to set up communication systems in SAP S/4HANA Cloud Public Edition.

Follow the steps in the tutorial: [Set Up Communication Systems](./19-Communication%20System.md).


## Step 5: Configure Communication Arrangements in SAP S/4HANA Cloud Public Edition

Finally, set up communication arrangements in SAP S/4HANA Cloud Public Edition. These arrangements establish the connection between the communication systems and the necessary services, ensuring secure and efficient data exchange between the integrated systems.

Follow the steps in the tutorial: [Configure Communication Arrangements](./20-Communication%20Arrangement.md).

---

With these steps completed, your cross-stack setup supports seamless integration between SAP S/4HANA Cloud Public Edition and the Poetry Slam Manager CAP application on SAP BTP. This integration ensures secure authentication, real-time data exchange, and service reuse.
