/**
 * PROPOSED dashboard read API. Uses sharing and user-mode SOQL; users still need
 * object and field permissions for the selected data.
 */
public with sharing class ClaimsAdjusterController {
    private static final Integer MAX_ROWS = 200;

    @AuraEnabled(cacheable=true)
    public static List<ClaimDashboardRow> getClaims() {
        List<Claim__c> records = [
            SELECT Id, Name, Claim_Type__c, Claim_Amount__c, Severity__c,
                   Status__c, Approval_Status__c, State_Territory__c, Claim_Date__c,
                   Description__c, Customer__c, Customer__r.Name, Policy__c,
                   Policy__r.Name, Policy__r.Policy_Type__c
            FROM Claim__c
            WITH USER_MODE
            ORDER BY CreatedDate DESC
            LIMIT :MAX_ROWS
        ];

        List<ClaimDashboardRow> response = new List<ClaimDashboardRow>();
        for (Claim__c record : records) {
            response.add(new ClaimDashboardRow(record));
        }
        return response;
    }
}
