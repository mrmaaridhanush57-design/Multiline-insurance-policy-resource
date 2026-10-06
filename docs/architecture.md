# Architecture

## Target design

**TARGET DESIGN — conceptual architecture only.** No Salesforce component is asserted to exist or be implemented. Actual architecture must be revised after org metadata is retrieved and reviewed.

```mermaid
flowchart TD
    Customer --> Policy
    Policy --> Auto
    Policy --> Property
    Policy --> Life
    Auto --> Claim
    Property --> Claim
    Life --> Claim
    Claim --> Routing[Claim Routing Flow]
    Routing --> Adjuster[Claims Adjuster]
    Adjuster --> Dashboard[Claims Dashboard]
    Dashboard --> Controller[Apex Controller]
    Controller --> Data[Salesforce Data]
    Claim -. High-value claim .-> Senior[Senior Adjuster]
    Senior --> Manager[Department Manager]
    Manager --> Decision[Final Approval / Rejection]
```

Intended journey: customer and policy information spans Auto, Property, and Life lines; claims are routed to adjusters and surfaced on a dashboard. A high-value claim may enter the senior-adjuster and department-manager approval path. Exact relationships, automation, and UI integration remain to be verified.

## Actual implementation

**Not verified.** Import and inspect the Salesforce metadata before documenting deployed components, dependencies, or behavior.
