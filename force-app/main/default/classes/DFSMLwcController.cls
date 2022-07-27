public class DFSMLwcController {
    @AuraEnabled(cacheable=true)
    public static list<Account> getLwcAccounts(){
        return [select id,name,BillingCity from Account];
    }
}