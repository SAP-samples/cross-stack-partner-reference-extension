# Creating a Communication Scenario

To create a communication scenario, follow these steps:

1. Right-click the `ZPRA_PSE_SALES_ORDER` package and choose **New > Other ABAP Repository Object**.

2. Search for `Communication Scenario`, select it, and choose **Next**.

3. Enter the following data and choose **Next**:

    - **Name**: `ZPRA_PSE_SO_CS`

    - **Description**: `Communication Scenario for PoetrySlam Integration`

4. Select a transport request and choose  **Finish**.

5. Once the scenario is created, select **Outbound** at the bottom and choose **Add Outbound Service**.

6. Search for `ZPRA_PSE_SO_PS_OB_REST` and choose **Finish**.

7. From the **Outbound Settings**, set *Basic*, *X.509*, and *OAuth 2.0*. Set **OAuth 2.0 Grant Type** to *Client Credentials*.


    ![Alt text](images/20-Communication%20Scenario.png)
8. On the communication scenario, choose **Overview**. As **Allowed Instance**, set  *One instance per scenario & communication system*.

9. Choose **Publish Locally**.

    ![Alt text](images/21-%20CommunicationScenario%201.png)
