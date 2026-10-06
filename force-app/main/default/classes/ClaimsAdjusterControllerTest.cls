@IsTest
private class ClaimsAdjusterControllerTest {
    @TestSetup
    static void createRecords() {
        Account customer = new Account(Name = 'Example Customer');
        insert customer;

        Policy__c policy = new Policy__c(
            Customer__c = customer.Id,
            Policy_Type__c = 'Auto',
            Status__c = 'Active',
            Coverage_Amount__c = 100000,
            VIN__c = '1HGCM82633A004352',
            Model_Year__c = 2024
        );
        insert policy;

        insert new List<Claim__c>{
            new Claim__c(
                Policy__c = policy.Id, Customer__c = customer.Id, Claim_Type__c = 'Auto',
                Claim_Amount__c = 12000, Severity__c = 'Medium', Status__c = 'New',
                State_Territory__c = 'California', Claim_Date__c = Date.today(),
                Description__c = 'Demonstration claim'
            ),
            new Claim__c(
                Policy__c = policy.Id, Customer__c = customer.Id, Claim_Type__c = 'Auto',
                Claim_Amount__c = 64000, Severity__c = 'High', Status__c = 'Pending Approval',
                Approval_Status__c = 'Pending Senior Adjuster',
                State_Territory__c = 'California', Claim_Date__c = Date.today()
            )
        };
    }

    @IsTest
    static void retrievesClaimsWithRelatedCustomerAndPolicy() {
        Test.startTest();
        List<ClaimDashboardRow> claims =
            ClaimsAdjusterController.getClaims();
        Test.stopTest();

        System.assertEquals(2, claims.size());
        System.assertEquals('Example Customer', claims[0].customerName);
        System.assertNotEquals(null, claims[0].policyId);
        System.assertEquals('Auto', claims[0].policyType);
        System.assertNotEquals(null, claims[0].claimNumber);
    }

    @IsTest
    static void exposesClaimStateAndApprovalData() {
        List<ClaimDashboardRow> claims =
            ClaimsAdjusterController.getClaims();
        Boolean foundHighValue = false;
        for (ClaimDashboardRow claim : claims) {
            if (claim.claimAmount == 64000) {
                foundHighValue = true;
                System.assertEquals('Pending Senior Adjuster', claim.approvalStatus);
                System.assertEquals('California', claim.stateTerritory);
            }
        }
        System.assert(foundHighValue, 'Expected the high-value sample claim.');
    }
}
