global class Sum implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query='select id,totalOpportunityAmount__c from Account where id in (select AccountId from Opportunity)';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope)
    { 
        map<id,List<Opportunity>> mymap=new map<id,List<Opportunity>>();
        for (Opportunity op:[select id,AccountId,Amount from Opportunity where AccountId in:scope])
        {
            if (mymap.containsKey(op.AccountId)){
                mymap.get(op.AccountId).add(op);
            }
            else{
                List<Opportunity> oplist =new List<Opportunity>();
                oplist.add(op);
                mymap.put(op.AccountId,oplist);
            }
        }
        
        list<Account> acclist=new list<account>();
        for(account acc:[select id from Account where id in:mymap.keySet()])
        {
            Decimal totalSum=0;
            for(Opportunity op: mymap.get(acc.id))
            {
                if(op.Amount!=null)
                {
                    totalSum+=op.Amount;
                }
            }          
                acc.totalOpportunityAmount__c=totalSum;
            	acclist.add(acc); 
        }    
       UPDATE acclist;      
    }
    global void finish(Database.BatchableContext BC)
    {
        
    }
}