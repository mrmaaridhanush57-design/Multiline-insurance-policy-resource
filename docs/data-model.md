# Data Model

## Target design

The requirements anticipate two custom objects:

- **Policy:** conceptual API name `Policy__c`; expected information may include Policy Number, Customer, Policy Type, Status, Premium, Coverage, Start Date, and End Date.
- **Claim:** conceptual API name `Claim__c`; expected information may include Claim Number, Policy, Customer, Claim Type, Claim Amount, Severity, Status, Approval Status, Assigned Adjuster, State/Territory, Claim Date, and Description.

These are requirements, not confirmation that objects, fields, or relationships exist. Actual API names, field types, record relationships, and standard-object choices must be established from Salesforce metadata. Do not create metadata based on this document alone.

## Actual implementation

**Not verified.** Populate this section only after retrieving and reviewing org metadata. Record actual object and field API names and link to their source files.
