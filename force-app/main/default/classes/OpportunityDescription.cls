@isTest
private class OpportunityDescription 
{
    static testMethod void descriptionValidation()
    {
        date mydate = date.parse('08/30/2021');
        Opportunity op = new Opportunity(Name='Op2',Email__c='son@tcs.com', StageName='Prospecting',CloseDate=mydate , Description='test');
        System.debug('Current opportunity' + op);
        
        test.startTest();
        insert op;
        test.stopTest();
        System.debug('des trigger fired: '+ op.Description);
        System.assertEquals('test',op.Description);
    }
	
}