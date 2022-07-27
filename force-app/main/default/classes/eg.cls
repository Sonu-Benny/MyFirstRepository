global class eg implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query='select id,No_open_opport__c from Account where id in (select AccountId from Opportunity)';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope)
    { 
        map<id,Account> accMap=new map<id,Account>();
        map<id,List<Opportunity>> mymap=new map<id,List<Opportunity>>();
        for (Account ac:scope)
        {
            accMap.put(ac.id,ac);
        }
        for (Opportunity op:[select id,AccountId,StageName from Opportunity where AccountId in:accMap.keySet()])
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
        for(id accId:mymap.keySet())
        {
            boolean allClosed=true;
            for(Opportunity op: mymap.get(accId))
            {
                if(op.StageName!='Closed Won' && op.StageName!='Close Lost')
                {
                    allClosed=false;
                    break;
                }
            }
            if(accMap.ContainsKey(accId))
            {
                
                accMap.get(accId).No_open_opport__c=allClosed;
            }
        }
               
       UPDATE accMap.values();      
    }
    
    global void finish(Database.BatchableContext BC)
    {
        
    }
}