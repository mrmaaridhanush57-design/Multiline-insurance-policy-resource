# Project Status

This repository contains a proposed academic/project implementation. “Source Included” means files exist in Git; it does not mean Salesforce accepted, deployed, or verified them. No live Salesforce org was connected for this repository preparation.

| Component | Status | Source of Truth | Notes |
|---|---|---|---|
| Project architecture | Documented | Repository design docs | Proposed target |
| Policy__c object | Source Included | Proposed repository source | Not deployed |
| Claim__c object | Source Included | Proposed repository source | Not deployed |
| Policy record types | Source Included | Proposed repository source | Auto, Property, Life |
| Claim record types | Source Included | Proposed repository source | Auto, Property, Life |
| Policy field sets | Source Included | Proposed repository source | Auto_Fields, Property_Fields |
| Policy validation rules | Source Included | Proposed repository source | VIN and positive square footage |
| PremiumCalculator | Source Included | Apex source | Uses demonstration-only rates |
| ClaimsAdjusterController | Source Included | Apex source | Salesforce compile not verified |
| Approval Apex helpers | Source Included | Apex source | Require configured approval process |
| Apex test classes | Source Included | Apex test source | Must be executed in Salesforce |
| claimsDashboardLwc | Source Included | LWC source | Bundle compilation not verified |
| claimTileLwc | Source Included | LWC source | Bundle compilation not verified |
| AutoQuotingFlow | Designed | Documentation | Flow metadata not included |
| Claim routing Flow | Designed | Documentation | Flow metadata not included |
| High-value approval process | Designed | Documentation | Process and approvers not configured |
| Agent/Adjuster/Manager permission sets | Source Included | Proposed repository source | Review and assign in org |
| State/territory-based sharing | Designed | Documentation | Requires org-specific sharing design |
| Salesforce deployment | Not Deployed | Salesforce Org | No org connection/deployment |
| Salesforce live verification | Not Live-Verified | Salesforce Org | Not performed |
| Apex code coverage | Not Live-Verified | Salesforce test results | No coverage claim |
