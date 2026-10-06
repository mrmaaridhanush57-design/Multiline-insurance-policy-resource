@IsTest
private class ClaimApprovalSubmitterTest {
    @IsTest
    static void thresholdRequiresAmountGreaterThanFiftyThousand() {
        System.assertEquals(false, ClaimApprovalSubmitter.isHighValueClaim(null));
        System.assertEquals(false, ClaimApprovalSubmitter.isHighValueClaim(50000));
        System.assertEquals(true, ClaimApprovalSubmitter.isHighValueClaim(50000.01));
    }

    @IsTest
    static void rejectsMissingClaimId() {
        try {
            ClaimApprovalSubmitter.submitForApproval(null);
            System.assert(false, 'A missing ID must be rejected.');
        } catch (ClaimApprovalSubmitter.ApprovalSubmissionException expected) {
            System.assert(expected.getMessage().contains('claim ID'));
        }
    }

    @IsTest
    static void rejectsClaimAtOrBelowThresholdBeforeApprovalSubmission() {
        Account customer = new Account(Name = 'Approval Test Customer');
        insert customer;
        Policy__c policy = new Policy__c(
            Customer__c = customer.Id,
            Policy_Type__c = 'Life',
            Status__c = 'Active',
            Coverage_Amount__c = 100000
        );
        insert policy;
        Claim__c claim = new Claim__c(
            Policy__c = policy.Id,
            Customer__c = customer.Id,
            Claim_Type__c = 'Life',
            Claim_Amount__c = 50000,
            Severity__c = 'Medium',
            Status__c = 'New'
        );
        insert claim;

        try {
            ClaimApprovalSubmitter.submitForApproval(claim.Id);
            System.assert(false, 'A claim at the threshold must not be submitted.');
        } catch (ClaimApprovalSubmitter.ApprovalSubmissionException expected) {
            System.assert(expected.getMessage().contains('greater than $50,000'));
        }
    }
}
