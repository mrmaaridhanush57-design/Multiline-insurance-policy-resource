# Instructions for Codex and contributors

> **THE SALESFORCE ORG AND RETRIEVED METADATA ARE THE SOURCE OF TRUTH FOR IMPLEMENTATION DETAILS. THE README AND REQUIREMENT DOCUMENTATION DESCRIBE THE TARGET PROJECT, NOT PROOF THAT A FEATURE EXISTS.**

This is a Salesforce DX project. It includes proposed implementation source and metadata intended for academic/project demonstration; these files were authored for this repository and were not retrieved from or verified in a Salesforce org. Keep that distinction explicit in changes and documentation.

- Inspect existing repository files and any available org metadata before creating or changing anything.
- Preserve existing implementation. When org metadata is unavailable, proposed Salesforce API names and configuration may be authored for the project, but label them as proposed and keep them internally consistent.
- Avoid duplicate objects, fields, classes, LWCs, Flows, and other metadata.
- Never present authored/proposed Salesforce metadata as retrieved, deployed, or org-verified.
- Never commit credentials, tokens, private keys, passwords, session IDs, or other secrets. Keep org authentication local.
- Keep Apex bulk-safe and follow Salesforce security requirements. Use appropriate sharing declarations and enforce object/field access where applicable.
- Keep LWCs reusable and accessible; handle loading, error, and empty states where relevant.
- Run relevant Apex tests after Apex changes. Do not claim tests passed unless they were actually run.
- Do not claim code coverage without actual Salesforce test results.
- Update documentation when proposed or verified architecture and behavior changes.
- Do not delete existing work without confirmation.
- Use small, meaningful commits.
