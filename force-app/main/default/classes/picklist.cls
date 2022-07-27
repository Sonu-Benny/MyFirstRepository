public with sharing class picklist {
	List<selectOption> op = new List<selectOption>();
	public List<selectOption> getOptions() {
		for(Answer__c acc : [select Id,Option__c from Answer__c]) {
			op.add(new selectOption(acc.Option__c,acc.Option__c));
		}
		return op;
	}
}