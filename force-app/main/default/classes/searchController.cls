public with sharing class searchController {
    @AuraEnabled(cacheable=true)
    public static List<Account> searchLwcAccounts(string accountName){
        string accName = '%' + accountName + '%';
        return [select Id, Name, BillingCity from Account where Name like :accName];
    }
    @AuraEnabled
    public static void delectAccount(string accId){
        DELETE [select Id from Account where id = :accId ];
    }
}