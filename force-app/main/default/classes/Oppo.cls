global class Oppo implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query='select AccountId,StageName from Opportunity where AccountId!=null';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Opportunity> scope)
    {
        map<id,List<Opportunity>> mymap=new map<id,List<Opportunity>>();
        for (Opportunity op:scope)
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
        list<Account> alist=new list<account>();
        for(account acc:[select id,No_open_opport__c from Account where id in:mymap.keySet()])
        {
            acc.No_open_opport__c=false;
            alist.add(acc);
            
            if(mymap.containsKey(acc.id))
            {
                boolean isUpdate = true;
                for(Opportunity op: mymap.get(acc.id))
                {
                    if(op.StageName!='Closed Won' && op.StageName!='Closed Lost')
                    {
                        isUpdate = false;
                        break;
                    }
                }
                if(isUpdate)
                {
                    acc.No_open_opport__c=true;
                    acclist.add(acc);
                }
            }
        }
        UPDATE alist;
        UPDATE acclist;
    }
    
    global void finish(Database.BatchableContext BC)
    {
        
    }
}