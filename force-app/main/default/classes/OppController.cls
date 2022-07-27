public with sharing class OppController {
        @AuraEnabled(cacheable=true)
        public static List<Opportunity> displayOpportunity(ID PassedId){
            return [select Id,Name,StageName from Opportunity where AccountId =: PassedId];
        }

    }