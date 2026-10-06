/** Top-level DTO returned by the proposed ClaimsAdjusterController LWC endpoint. */
public class ClaimDashboardRow {
    @AuraEnabled public Id id { get; set; }
    @AuraEnabled public String claimNumber { get; set; }
    @AuraEnabled public String claimType { get; set; }
    @AuraEnabled public Decimal claimAmount { get; set; }
    @AuraEnabled public String severity { get; set; }
    @AuraEnabled public String status { get; set; }
    @AuraEnabled public String approvalStatus { get; set; }
    @AuraEnabled public String stateTerritory { get; set; }
    @AuraEnabled public Date claimDate { get; set; }
    @AuraEnabled public String description { get; set; }
    @AuraEnabled public String customerName { get; set; }
    @AuraEnabled public Id policyId { get; set; }
    @AuraEnabled public String policyNumber { get; set; }
    @AuraEnabled public String policyType { get; set; }

    public ClaimDashboardRow(Claim__c claim) {
        id = claim.Id;
        claimNumber = claim.Name;
        claimType = claim.Claim_Type__c;
        claimAmount = claim.Claim_Amount__c;
        severity = claim.Severity__c;
        status = claim.Status__c;
        approvalStatus = claim.Approval_Status__c;
        stateTerritory = claim.State_Territory__c;
        claimDate = claim.Claim_Date__c;
        description = claim.Description__c;
        customerName = claim.Customer__r == null ? null : claim.Customer__r.Name;
        policyId = claim.Policy__c;
        policyNumber = claim.Policy__r == null ? null : claim.Policy__r.Name;
        policyType = claim.Policy__r == null ? null : claim.Policy__r.Policy_Type__c;
    }
}
