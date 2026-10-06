# Apex

> **Source included; Salesforce compilation and execution not verified.**

## Classes

| Class | Responsibility |
|---|---|
| PremiumCalculator | Illustrative annual premium from type and coverage amount; sample rates are not production pricing |
| ClaimsAdjusterController | Sharing-aware, user-mode query of up to 200 claims with related customer and policy data |
| ClaimDashboardRow | Top-level Aura-enabled data-transfer object returned to the LWC |
| ClaimApprovalSubmitter | Checks the strict greater-than-$50,000 threshold and submits a claim to an org-configured approval process |
| ClaimApprovalDecision | Approves/rejects an assigned Salesforce approval work item |

Database-facing services use with sharing. The dashboard query uses user-mode SOQL, so object/field permissions and record visibility affect results. Approval submission also requires a configured active Salesforce approval process; the Apex class alone does not create one.

## Pricing assumption

PremiumCalculator uses fixed sample rates by policy type solely to demonstrate reusable Apex logic. They are not actuarial guidance, approved rates, or a production formula. Replace them with approved business logic before real use.

## Test classes

The test classes cover the sample calculation and invalid inputs, retrieval/DTO data, high-value threshold boundaries, and decision mapping. End-to-end approval execution requires approval-process metadata and approver setup in the org.
