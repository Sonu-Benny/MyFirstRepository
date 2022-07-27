public class SurveyController
{
    public id surveyId;
    public Map<Id,Question__c> questionMap{get;set;}
    public Map<Id,List<SelectOption>> questionAnswerMap{get; set;}
    public Map<Id,List<String>> questionResponseMap{get; set;}
 
    public SurveyController()
    {
       
        surveyId = apexPages.currentPage().getParameters().get('sid');
        questionMap = new Map<Id,Question__c>([SELECT Id,Question__c,Answer_type__c,Order__c FROM Question__c WHERE Survey__c = :surveyId ORDER BY Order__c]);
        questionAnswerMap = new Map<Id,List<SelectOption>>();
        questionResponseMap = new Map<Id,List<String>>();
        
        
        for(Answer__c answer : [SELECT Question__c,Option__c FROM Answer__c WHERE Question__c in : questionMap.keySet()])
        {
            	if(!questionResponseMap.containsKey(answer.Question__c))
                {
                    questionResponseMap.put(answer.Question__c,new List<string>{''});
                }
                if (questionAnswerMap.containsKey(answer.Question__c)){
                    
                    questionAnswerMap.get(answer.Question__c).add(new SelectOption(answer.Option__c,answer.Option__c));
                }
                else{
                        List<SelectOption> answerList =new List<SelectOption>();
                        answerList.add(new SelectOption(answer.Option__c,answer.Option__c));
                        questionAnswerMap.put(answer.Question__c,answerList);	 
                }
        }
       
    }
   
    public void submit()
    {
        System.debug(questionResponseMap);
        Map<Id,Survey_response__c> storeResponseMap = new Map<Id,Survey_response__c>();
                
        for(Id quesId :questionResponseMap.keySet())
        {
            Survey_response__c response = new Survey_response__c();
            response.Survey__c = surveyId;
            response.Question__c = quesId;
            String responseString = String.join(questionResponseMap.get(quesId) , ', ' );
            response.Value__c = responseString;
            storeResponseMap.put(quesId,response);   
        }
        INSERT storeResponseMap.values();
     }
}