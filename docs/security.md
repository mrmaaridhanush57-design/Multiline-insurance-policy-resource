# Security

> **Proposed access design.** Permission-set XML in this repository is illustrative. It does not by itself create a secure sharing model or prove access behavior.

## Proposed permission sets

| Permission Set | Intended use |
|---|---|
| Agent | Create/update policy records and read premium |
| Adjuster | Create and handle claims; use claims dashboard |
| Manager | Review claims and use approval helper classes |

Assign permission sets using actual job duties and least privilege. Salesforce Profiles remain necessary as the user's baseline.

## Layers to configure and verify

- **Organization-wide defaults (OWD):** use restrictive defaults, likely Private for Claim__c and Policy__c where the business requires record isolation. Confirm implications for reporting, integrations, and ownership.
- **Object permissions:** grant only required create/read/edit/delete rights.
- **Field-Level Security:** protect sensitive claim and policy fields; Apex user-mode queries respect these permissions.
- **Apex class access:** grant only classes required by users, including the dashboard controller for dashboard users.
- **LWC access:** expose components on approved Lightning pages and validate component visibility and underlying Apex access.
- **Sharing rules and record-level access:** create only after defining ownership, roles, queues, territory membership, and exception handling.
- **State/territory visibility:** State_Territory__c is a data field, not a security mechanism. Use an explicit sharing architecture (for example, ownership/queues and managed sharing or a supported territory model) and test with representative users. A static criteria-based rule cannot automatically compare a record's territory to each viewer's territory.

The proposed object metadata currently uses Private sharing defaults to favor least exposure. That choice must be reviewed with the actual org's use cases before deployment.

## Verification checklist

Test Agent, Adjuster, Senior Adjuster, and Manager personas. Confirm access to records, related Account/Policy data, each sensitive field, Apex endpoints, LWC pages, and approval work items. Check negative access as well as allowed access.

## Actual status

Permission-set examples are source included. No profile assignments, sharing rules, Apex access, or territory enforcement are live-verified.
