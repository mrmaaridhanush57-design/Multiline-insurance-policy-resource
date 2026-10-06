@IsTest
private class ClaimApprovalDecisionTest {
    @IsTest
    static void mapsBooleanDecisionToSalesforceActions() {
        System.assertEquals('Approve', ClaimApprovalDecision.actionFor(true));
        System.assertEquals('Reject', ClaimApprovalDecision.actionFor(false));
    }

    @IsTest
    static void rejectsMissingWorkItem() {
        try {
            ClaimApprovalDecision.decide(null, true, 'Approved for testing.');
            System.assert(false, 'A missing work item must be rejected.');
        } catch (ClaimApprovalDecision.ApprovalDecisionException expected) {
            System.assert(expected.getMessage().contains('work item'));
        }
    }
}
