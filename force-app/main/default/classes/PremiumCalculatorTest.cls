@IsTest
private class PremiumCalculatorTest {
    @IsTest
    static void calculatesIllustrativePremiumForEachLine() {
        List<Policy__c> policies = new List<Policy__c>{
            new Policy__c(Policy_Type__c = 'Auto', Coverage_Amount__c = 100000),
            new Policy__c(Policy_Type__c = 'Property', Coverage_Amount__c = 250000),
            new Policy__c(Policy_Type__c = 'Life', Coverage_Amount__c = 500000)
        };

        List<Decimal> results = PremiumCalculator.calculateAnnualPremiums(policies);

        System.assertEquals(3, results.size());
        System.assertEquals(2000.00, results[0]);
        System.assertEquals(2000.00, results[1]);
        System.assertEquals(5000.00, results[2]);
    }

    @IsTest
    static void rejectsMissingOrInvalidInputs() {
        try {
            PremiumCalculator.calculateAnnualPremium(null);
            System.assert(false, 'Null policy should be rejected.');
        } catch (PremiumCalculator.PremiumException expected) {
            System.assert(expected.getMessage().contains('required'));
        }

        try {
            PremiumCalculator.calculateAnnualPremium(
                new Policy__c(Policy_Type__c = 'Auto', Coverage_Amount__c = 0)
            );
            System.assert(false, 'Zero coverage should be rejected.');
        } catch (PremiumCalculator.PremiumException expected) {
            System.assert(expected.getMessage().contains('positive coverage'));
        }
    }

    @IsTest
    static void returnsEmptyListForNullCollection() {
        System.assertEquals(0, PremiumCalculator.calculateAnnualPremiums(null).size());
    }
}
