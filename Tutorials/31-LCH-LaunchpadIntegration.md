# Launchpad Integration

This page serves as the navigation hub for the Launchpad integration sequence. Use the links below to follow the guided steps from setup through deployment, content configuration, and role assignment.

## Prerequisites

Before starting the Launchpad Integration tutorials, ensure you have:
- **S/4HANA Cloud Public Edition access** with ABAP Development Tools (ADT)
- **BTP Subaccount** with SAP Business Application Studio (BAS) subscription
- **Required authorizations:**
  - Developer role for creating ABAP artifacts
  - Administrator role for Launchpad configuration and role management
- **Existing communication arrangement setup** (from previous tutorials)

## Tutorial Sequence

### Backend Setup (Packages, CDS Entities, Service Definitions/Bindings)

- **[Launcher Package Creation](32-LCH-PackageCreation.md)**
  Create the Launcher packages used for SAP Launchpad integration and organize artifacts for navigation and cataloging.

- **[Data Definition Creation](33-LCH-DataDefinitionCreation.md)**
  Create CDS custom entity (unmanaged) and follow ABAP artifact naming guidelines to expose relevant data for services and UI.

- **[Get Host Details](34-LCH-GetHostDetails.md)**
  Implement an ABAP class for retrieving backend host and communication details required by downstream integration components.

- **[Service Definition Creation](35-LCH-ServiceDefinitionCreation.md)**
  Define the OData service on top of your data model, preparing it for binding and eventual exposure to UI channels.

- **[Service Binding Creation](36-LCH-ServiceBindingCreation.md)**
  Create an OData V4 service binding for the service definition to make it consumable by Fiori/UI applications.

### BTP/BAS Setup and UI Deployment

- **[Destinations for Fiori Deployment](37-LCH-DestinationsForFioriDeployment.md)**
  Configure BTP subaccount destinations that enable BAS to deploy the UI application to the S/4 system securely.

- **[BAS Fiori App Creation](38-LCH-BASFioriAppCreation.md)**
  Scaffold and develop the Fiori application in SAP Business Application Studio (BAS), including generator-time deployment and FLP configuration.

- **[UI Deployment from BAS to S/4 System](39-LCH-UIDeploymentFromBAS.md)**
  Deploy the BAS-generated UI app to the ABAP repository (BSP) and verify artifacts under the UI package in ADT.

### IAM Configuration, Catalog, Pages, Spaces, and Roles

- **[IAM App Creation](40-LCH-IAMAppCreation.md)**
  Create an IAM App in the UI package, define semantic object/action, and set up target mapping for Launchpad navigation.

- **[Business Catalog Creation](41-LCH-BusinessCatalogCreation.md)**
  Create a Business Catalog that includes your IAM App intent, enabling catalog-based content delivery.

- **[Page Template Creation](42-LCH-PageTemplateCreation.md)**
  Create a Launchpad Page Template and organize tiles/cards sourced from the Business Catalog.

- **[Launchpad Page Template Scoping](43-LCH-LaunchpadPageTemplateScoping.md)**
  Scope the Page Template so it is available for Spaces and visible in the Launchpad.

- **[Space Template Creation and Scoping](44-LCH-SpaceTemplateCreationAndScoping.md)**
  Create a Space Template, reference the Page Template, and scope the Space for role-based access.

- **[Business Role Template Creation](45-LCH-BusinessRoleTemplateCreation.md)**
  Create a Business Role template bundling catalog, spaces/pages, and app access.

- **[Maintain Business Roles](46-LCH-MaintainBusinessRoles.md)**
  Maintain Business Roles and authorizations, assign them to users, and validate that required access is granted.
