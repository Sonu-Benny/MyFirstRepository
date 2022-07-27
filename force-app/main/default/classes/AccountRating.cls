@isTest
private class AccountRating 
{
	static testMethod void RatingValidation()
    {
        Account ac = new Account(Name='ac1',Rating='hot');
        System.debug('Current account' + ac);
        
        test.startTest();
        insert ac;
        test.stopTest();
        System.debug('account trigger fired: '+ ac.Rating);
        System.assertEquals('hot',ac.Rating);
    }
}