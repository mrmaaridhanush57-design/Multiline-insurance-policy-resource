# Lightning Web Components

> **Source included; Salesforce compilation and runtime behavior not verified.**

## claimsDashboardLwc

Imports ClaimsAdjusterController.getClaims, displays a loading indicator, reports retrieval errors, and distinguishes no records from no filter matches. Client-side search covers claim number, customer, policy, policy type, and description. Status and state/territory filters are also applied client-side to the returned list.

The Apex endpoint caps results at 200 visible records. Larger datasets require pagination or server-side filters; client-side filtering does not increase access and cannot show records hidden by Salesforce security.

## claimTileLwc

Reusable child component that displays claim number, customer, policy, type, severity, amount, status, approval state, territory, and description.

## Access

The dashboard is exposed on app, home, and record pages. The Adjuster permission-set example grants Apex class access and proposed object/field permissions. Admins must also grant the necessary object, field, record, and component access in the actual org.
