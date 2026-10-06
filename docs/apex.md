# Apex

## Target design

- **PremiumCalculator:** calculate policy premium and provide reusable server-side business logic. Use the actual org implementation; no formula is specified here.
- **ClaimsAdjusterController:** retrieve claims and related policy/customer information, expose dashboard data to an LWC, and use suitable wrapper/data-transfer structures.
- **Potential tests:** `PremiumCalculatorTest` and `ClaimsAdjusterControllerTest`.
- Approval-related Apex may exist in the org; import and document it from actual metadata instead of inventing it.

These are target requirements. No Apex classes or tests are included in the scaffold.

## Actual implementation

**Not verified.** Record actual class names, sharing/security approach, dependencies, and behavior after metadata retrieval.
