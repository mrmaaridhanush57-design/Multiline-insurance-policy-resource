# Deployment

## Target workflow

1. Connect to the authorized Salesforce org.
2. Retrieve actual metadata into `force-app/main/default`.
3. Review the retrieved source and confirm it represents the intended org state.
4. Commit reviewed source changes.
5. Deploy selected source to the intended target org.
6. Run relevant tests and verify functionality/security.

Use the Salesforce CLI appropriate to the installed project tooling and org access. Select the target org explicitly and review deployment scope before deploying. Keep authentication data local and out of Git.

## Actual implementation

**Not verified.** This repository currently contains no Salesforce metadata, and no deployment has been performed.
