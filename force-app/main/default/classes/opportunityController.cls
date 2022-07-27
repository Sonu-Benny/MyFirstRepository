public with sharing class opportunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> displayOpportunity(){
        return [select Id,Name,StageName from Opportunity];
    }
    @AuraEnabled
    public static void updateStage(string oppId){
        System.debug('opp id'+oppId);
        Opportunity opp = [select Id,StageName from Opportunity where id = :oppId ];
        System.debug('opp id'+oppId);
        System.debug('opp 1'+opp);
        opp.StageName = 'Closed Won';
        System.debug('opp 2'+opp);
        update opp;
    }
}