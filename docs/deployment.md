# Deployment Guide

> Deployment requires an authorized Salesforce org. No authentication or deployment was performed for this submission preparation.

## Prerequisites

- Salesforce CLI installed and current.
- Access to a disposable sandbox/development org with required permissions.
- Review of proposed metadata names, sample pricing assumptions, sharing, and approval requirements.
- No credentials or auth files stored in this repository.

## Workflow

1. Install Salesforce CLI from Salesforce's official distribution.
2. Clone this repository.
3. Authenticate to a sandbox/development org using the supported browser login flow.
4. Set and confirm the target org alias.
5. Review deployment scope and validate deployment.
6. Deploy metadata.
7. Run Apex tests.
8. Configure and verify Flows and the Approval Process (not included as deployment-ready XML here).
9. Verify permission sets, sharing, and territory access with test users.
10. Verify both LWCs on intended Lightning pages.
11. Run the demo using configured sample records.

## Example commands

```bash
sf org login web --alias insurance-dev --instance-url https://login.salesforce.com
sf org display --target-org insurance-dev
sf project deploy validate --target-org insurance-dev --source-dir force-app
sf project deploy start --target-org insurance-dev --source-dir force-app
sf apex run test --target-org insurance-dev --test-level RunLocalTests --wait 30
```

Use the sandbox login URL for a sandbox org. Confirm the alias and deployment target before any deploy. Project deploy validation and test execution require Salesforce authentication; CLI help and local source inspection do not validate deployment.

## Post-deployment checks

- Confirm Policy and Claim objects, fields, record types, field sets, and validation rules.
- Confirm class compilation and run the test suite; resolve org-specific metadata/test failures.
- Build/configure the documented Flow and approval designs in the org.
- Review sharing and permission sets with least privilege.
- Add components to Lightning pages and verify load/error/empty states.
- Record actual results in PROJECT_STATUS.md and do not claim coverage without Salesforce results.
