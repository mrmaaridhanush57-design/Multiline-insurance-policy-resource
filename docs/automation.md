# Automation

## Target design

### AutoQuotingFlow

Expected journey: Customer → Auto Policy Information → VIN / Model Year / Coverage → Premium Calculation → Policy Creation/Update → Success Message.

### PremiumCalculator

Expected purpose: calculate a premium from policy information using the actual Salesforce implementation. The production calculation must be discovered from the org; this document does not define or invent an insurance formula.

### Claim record-triggered Flow

Expected purpose: evaluate Policy Type, Claim Severity, and Claim Amount and route claims appropriately.

All flows and behavior above are target requirements, not verified metadata.

## Actual implementation

**Not verified.** Document actual Flow names, trigger configuration, entry criteria, actions, and Apex dependencies after retrieval and org verification.
