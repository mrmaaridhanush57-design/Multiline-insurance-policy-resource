# Instructions for Codex and contributors

> **THE SALESFORCE ORG AND RETRIEVED METADATA ARE THE SOURCE OF TRUTH FOR IMPLEMENTATION DETAILS. THE README AND REQUIREMENT DOCUMENTATION DESCRIBE THE TARGET PROJECT, NOT PROOF THAT A FEATURE EXISTS.**

This is a Salesforce DX project. The `force-app` package directory is currently a scaffold and contains no implementation metadata.

- Inspect existing repository files and retrieved Salesforce metadata before creating or changing anything.
- Preserve existing implementation and use actual Salesforce API names from retrieved metadata.
- Avoid duplicate objects, fields, classes, LWCs, Flows, and other metadata.
- Never invent Salesforce metadata or make implementation claims based on target documentation.
- Never commit credentials, tokens, private keys, passwords, session IDs, or other secrets. Keep org authentication local.
- Keep Apex bulk-safe and follow Salesforce security requirements. Use appropriate sharing declarations and enforce object/field access where applicable.
- Keep LWCs reusable and accessible; handle loading, error, and empty states where relevant.
- Run relevant Apex tests after Apex changes. Do not claim tests passed unless they were actually run.
- Do not claim code coverage without actual Salesforce test results.
- Update documentation when verified architecture or behavior changes.
- Do not delete existing work without confirmation.
- Use small, meaningful commits.
