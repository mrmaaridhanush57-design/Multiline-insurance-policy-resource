/**
 * Proposed hand-off to a separately configured Salesforce approval process.
 * The active process, entry criteria, approvers, and actions must be configured
 * and verified in the target org before this operation can succeed.
 */
public with sharing class ClaimApprovalSubmitter {
    public static final Decimal HIGH_VALUE_THRESHOLD = 50000;

    public class ApprovalSubmissionException extends Exception {}

    public static Boolean isHighValueClaim(Decimal amount) {
        return amount != null && amount > HIGH_VALUE_THRESHOLD;
    }

    public static Approval.ProcessResult submitForApproval(Id claimId) {
        if (claimId == null) {
            throw new ApprovalSubmissionException('A claim ID is required.');
        }

        Claim__c claim = [
            SELECT Id, Claim_Amount__c
            FROM Claim__c
            WHERE Id = :claimId
            WITH USER_MODE
            LIMIT 1
        ];
        if (!isHighValueClaim(claim.Claim_Amount__c)) {
            throw new ApprovalSubmissionException(
                'Only claims greater than $50,000 can be submitted for approval.'
            );
        }

        Approval.ProcessSubmitRequest request = new Approval.ProcessSubmitRequest();
        request.setObjectId(claim.Id);
        request.setComments('Submitted through the proposed claims approval service.');
        request.setSubmitterId(UserInfo.getUserId());
        Approval.ProcessResult result = Approval.process(request);
        if (!result.isSuccess()) {
            throw new ApprovalSubmissionException(
                'Salesforce did not submit the claim to an approval process.'
            );
        }
        return result;
    }
}
