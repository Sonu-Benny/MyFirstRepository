public class trysurvey {

    public id surveyId='a0A5g000001ps2sEAA';
    public Map<Question__c,List<Answer__c>> questionAnswerMap{get; set;}
    public List<Answer__c> answerList{get; set;}
    
    public List<selectOption> pickList {get;set;}
    
    public trysurvey()
    {
        List<selectOption> pickList = new List<selectOption>();
        
        List<Question__c> questionList = new List<Question__c>();
        //surveyId = apexPages.currentPage().getParameters().get('sid');
        questionList = [SELECT Id,Question__c FROM Question__c WHERE Survey__c = :surveyId ];
        
        questionAnswerMap = new Map<Question__c,List<Answer__c>>();
        List<Answer__c> answerList = new List<Answer__c>();
       
        for(Question__c question:[SELECT Id,Question__c,Answer_type__c FROM Question__c WHERE Id in :questionList])
    	{            
        	answerList=[SELECT Option__c FROM Answer__c WHERE Question__c = :question.Id]; 
            questionAnswerMap.put(question,answerList);
            
            if(question.Answer_type__c=='Picklist')
            {
                for(Answer__c answer:[SELECT Option__c FROM Answer__c WHERE Question__c = :question.Id])
                {
                    
                pickList.add(new selectOption(answer.Option__c,answer.Option__c));
                }
            }
            
            
    	} 
	}
}