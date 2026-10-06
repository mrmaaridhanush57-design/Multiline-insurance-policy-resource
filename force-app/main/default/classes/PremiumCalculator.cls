/**
 * PROPOSED SAMPLE IMPLEMENTATION. Pricing rates below are illustrative demonstration
 * assumptions only and are not actuarial, regulatory, or production pricing guidance.
 */
public with sharing class PremiumCalculator {
    private static final Decimal AUTO_RATE = 0.020;
    private static final Decimal PROPERTY_RATE = 0.008;
    private static final Decimal LIFE_RATE = 0.010;

    public class PremiumException extends Exception {}

    /**
     * Returns a demonstration annual premium from coverage amount and policy type.
     * Replace the sample rates with approved business rules before real use.
     */
    public static Decimal calculateAnnualPremium(Policy__c policy) {
        if (policy == null || policy.Coverage_Amount__c == null ||
            policy.Coverage_Amount__c <= 0 || policy.Policy_Type__c == null) {
            throw new PremiumException('Policy type and a positive coverage amount are required.');
        }

        Decimal rate;
        switch on policy.Policy_Type__c {
            when 'Auto' {
                rate = AUTO_RATE;
            }
            when 'Property' {
                rate = PROPERTY_RATE;
            }
            when 'Life' {
                rate = LIFE_RATE;
            }
            when else {
                throw new PremiumException('Unsupported policy type: ' + policy.Policy_Type__c);
            }
        }

        return (policy.Coverage_Amount__c * rate).setScale(2, RoundingMode.HALF_UP);
    }

    /** Bulk-safe helper for callers calculating premiums for multiple policies. */
    public static List<Decimal> calculateAnnualPremiums(List<Policy__c> policies) {
        List<Decimal> premiums = new List<Decimal>();
        if (policies == null) {
            return premiums;
        }
        for (Policy__c policy : policies) {
            premiums.add(calculateAnnualPremium(policy));
        }
        return premiums;
    }
}
