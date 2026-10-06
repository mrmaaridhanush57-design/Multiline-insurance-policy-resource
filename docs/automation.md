# Automation

> **Target configuration / proposed design.** This repository does not include Flow XML. Configure and validate flows in a disposable org before treating them as deployable.

## AutoQuotingFlow

Proposed screen flow: select customer and Auto policy information; collect VIN, model year, coverage, and relevant dates; call the premium service after confirming how the org should persist its result; create or update the policy; show a success summary. Screen inputs should be validated and errors should be actionable.

The current PremiumCalculator is a demonstration Apex method. A Flow-invocable adapter, approved pricing rules, and record-save behavior still need design and org validation.

## Claim Record-Triggered Flow (proposed)

Proposed record-triggered flow on Claim__c after save:

1. Evaluate policy/claim type, severity, and amount.
2. Assign the intended queue or adjuster using org-specific routing data.
3. For amounts greater than $50,000, prepare submission to the configured approval process.
4. Avoid recursive updates and make re-entry behavior explicit.

## High Value Claim Approval Flow (proposed design)

If a Flow is used to coordinate the hand-off, it should check Claim_Amount__c > 50000 and submit the record to the configured Approval Process. Keep the decision and approver chain in the Salesforce Approval Process so pending work items and approve/reject actions are auditable. This named Flow is a design concept; it has no XML in this repository.

## Approver Screen Flow (optional proposed design)

A screen flow could provide an approver-focused summary and collect comments before submitting an approval/rejection action. It must invoke supported approval handling and enforce the running user's access. Standard Salesforce approval work items may be preferable; this screen flow is not included as metadata.

## Approval experience

The high-value approval chain is described in [approval-process.md](approval-process.md). A separate screen-flow interface for an approver is optional; Salesforce standard approval work items may be used instead.

## Actual status

AutoQuotingFlow, Claim Record-Triggered Flow, High Value Claim Approval Flow, and Approver Screen Flow are documented designs only; no Flow metadata is present in force-app/main/default/flows/.
