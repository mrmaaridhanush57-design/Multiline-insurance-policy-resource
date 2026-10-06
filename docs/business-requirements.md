# Business Requirements

> **Project design / proposed implementation.** Requirements describe intended behavior; source artifacts are samples and have not been executed in a Salesforce org.

## Business problem

Insurance policy and claims work can be fragmented across manual processes. Quotation relies on manual steps, issuance is slow, and processing may vary by line of business. Claims may be handled manually with delayed routing and resolution. Customer, policy, and claim information can be difficult to see together, raising operating costs and creating a poor customer experience.

The project proposes Salesforce as a shared work platform: policy and claim records provide a common data model; Apex supports reusable server-side logic; Flow can orchestrate guided and record-triggered work; LWCs surface claims; approval processes support high-value decisions; and platform permissions/sharing control access. These capabilities need org-specific configuration and verification.

## Users

| User | Intended responsibilities |
|---|---|
| Agent | Quote and maintain policy information |
| Claims Adjuster | Review and handle assigned claims |
| Senior Adjuster | Review high-value claim submissions |
| Department Manager | Make subsequent approval decisions |
| Manager/Admin | Maintain configuration, access, and oversight |

## Insurance lines

1. Auto
2. Property
3. Life

## Functional requirements

### Policy

- Create and update policies.
- Prepare quotations.
- Calculate an illustrative premium, to be replaced by approved business rules.
- Classify a policy by insurance type.
- Require Auto VIN and Property square footage through validation.

### Claims

- Create a claim and associate it with a policy and customer.
- Capture amount, severity, type, territory, and status.
- Route claims using policy type, severity, and amount.
- Submit eligible high-value claims for approval.
- Approve or reject claims through the configured approval process.
- Track claim progress and approval status.

### Dashboard

- Show claims visible to the current user.
- Search and filter claims.
- Display customer, policy, and claim information.
- Handle loading, error, and empty states.

### Security

- Provide role-based access through permission sets.
- Limit claim visibility by assigned territory/state where required.
- Enforce object and field permissions as well as record sharing.

## Acceptance and verification

Functional acceptance requires deployment to a test org, exercising each insurance line and claim path, verifying access with representative users, and running Apex tests. No live acceptance results are recorded in this repository.
