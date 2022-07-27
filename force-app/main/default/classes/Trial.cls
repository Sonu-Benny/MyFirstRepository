global class Trial implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query='select Id from Account ORDER BY Name';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope)
    {
        Account[] updates = new Account[]{};
        for (AggregateResult ar:[select AccountId a,MAX(CreatedDate) d from Contact where AccountId in :scope GROUP BY AccountId])
        {
            updates.add(new Account(Id=(Id) ar.get('a'),Last_contact_created__c=(DateTime) ar.get('d')));
        }
        update updates;
    }
    
    global void finish(Database.BatchableContext BC)
    {
        
    }
}