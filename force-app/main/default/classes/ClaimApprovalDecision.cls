/** Proposed Apex endpoint for completing an assigned Salesforce approval work item. */
public with sharing class ClaimApprovalDecision {
    public class ApprovalDecisionException extends Exception {}

    @TestVisible
    private static String actionFor(Boolean approve) {
        if (approve == null) {
            throw new ApprovalDecisionException('Choose approve or reject.');
        }
        return approve ? 'Approve' : 'Reject';
    }

    public static Approval.ProcessResult decide(
        Id workItemId,
        Boolean approve,
        String comments
    ) {
        if (workItemId == null) {
            throw new ApprovalDecisionException('An approval work item ID is required.');
        }

        Approval.ProcessWorkitemRequest request = new Approval.ProcessWorkitemRequest();
        request.setWorkitemId(workItemId);
        request.setAction(actionFor(approve));
        request.setComments(comments);

        Approval.ProcessResult result = Approval.process(request);
        if (!result.isSuccess()) {
            throw new ApprovalDecisionException(
                'Salesforce could not apply the requested approval decision.'
            );
        }
        return result;
    }
}
