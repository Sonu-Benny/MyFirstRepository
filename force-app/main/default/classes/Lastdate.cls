global class Lastdate implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query='select AccountId,MAX(CreatedDate) from Contact GROUP BY AccountId';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> scope)
    {
        
        map<Contact,id> mymap=new map<Contact,id>();
        
        	for(Contact con:[select id,name,CreatedDate,AccountId from Contact])
        	{
            	mymap.put(con,con.AccountId);
             
			}
        system.debug(mymap);
    }
    
    global void finish(Database.BatchableContext BC)
    {
        
    }
}