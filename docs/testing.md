# Testing Plan

> **Source tests are included. Tests are included and should be executed in a Salesforce org before deployment.** Live Salesforce execution is required to confirm deployment and coverage. No result or coverage percentage is claimed here.

## Test matrix

| Area | Test |
|---|---|
| Policy | Auto policy creation |
| Policy | Property policy validation |
| Policy | Life policy creation |
| Premium | Premium calculation for each proposed type |
| Premium | Missing and non-positive input handling |
| Claims | Claim creation and policy/customer relationships |
| Claims | Claim routing criteria after Flow configuration |
| Dashboard | Claim retrieval and related values |
| Dashboard | Filtering by text, status, and territory |
| Approval | High-value submission above $50,000 |
| Approval | $50,000 boundary and non-eligible claim |
| Approval | Senior Adjuster approval |
| Approval | Department Manager approval |
| Approval | Rejection at each configured step |
| Security | Allowed and denied access for each persona |

## Included Apex tests

- PremiumCalculatorTest covers illustrative rates and invalid inputs.
- ClaimsAdjusterControllerTest covers query results and related data.
- ClaimApprovalSubmitterTest covers threshold boundaries and missing ID handling.
- ClaimApprovalDecisionTest covers action mapping and missing work item handling.

End-to-end approval tests depend on the approval process and approver configuration. The sample suite does not establish end-to-end approval behavior or measured coverage.

## Suggested org execution

After deploying to a disposable test org, run:

```bash
sf apex run test --target-org <test-alias> --test-level RunLocalTests --wait 30
```

Review test failures and Salesforce-reported coverage; do not infer coverage from the number of assertions or test classes.
