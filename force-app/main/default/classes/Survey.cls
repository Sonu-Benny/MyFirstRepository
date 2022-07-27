public class Survey {

    public id surveyId;
    public Map<Question__c,List<Answer__c>> questionAnswerMap{get; set;}
    public List<Answer__c> answerList{get; set;}
    
    public Survey()
    {
        //List<Question__c> questionList = new List<Question__c>();
        surveyId = apexPages.currentPage().getParameters().get('sid');
        //questionList = [SELECT Id,Question__c FROM Question__c WHERE Survey__c = :surveyId ];
        
        questionAnswerMap = new Map<Question__c,List<Answer__c>>();
        List<Answer__c> answerList = new List<Answer__c>();
       
        for(Question__c question:[SELECT Id,Question__c,Order__c,Answer_type__c FROM Question__c WHERE Survey__c = :surveyId ORDER BY Order__c ASC])
    	{
        	answerList=[SELECT Option__c FROM Answer__c WHERE Question__c = :question.Id]; 
            questionAnswerMap.put(question,answerList);
    	} 
	}
}