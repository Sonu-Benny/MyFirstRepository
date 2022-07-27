trigger oppstage on Opportunity (after insert, after update) {
    
    list<Id> accList=new list<Id>();
    for(opportunity o:trigger.new)
    {
        accList.add(o.accountId);
    }
    Map<Id,Account> accMap=new Map<Id,Account>();
    for(Account acc:[SELECT Id,No_open_opport__c FROM Account WHERE Id in :accList])
    {
        accMap.put(acc.Id,acc);
    }
	for(Id accId:accMap.keySet())
    {
       boolean allclosed=True;
       for(Opportunity opp:Trigger.New)
       {
           if(opp.AccountId==accId)
           {
               if(opp.StageName!='Closed Won' && opp.StageName!='Close Lost')
                {
                    allClosed=false;
                    break;
                }
           }
       }
        accMap.get(accId).No_open_opport__c=allclosed;
    }
    UPDATE accMap.values();
}