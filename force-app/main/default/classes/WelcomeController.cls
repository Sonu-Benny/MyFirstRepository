public class WelcomeController {
    public Id surveyId {get;set;}
    public PageReference pageForward()
    {
        PageReference pageRef = Page.Survey;
        pageRef.getParameters().put('sid',surveyId);
        pageRef.setRedirect(true);
        return pageRef;
    }
}