public class Calloutcontroller {
    
    public List<consolewrap.productWrapper> ConsoleWrapperList{get;set;}

	public List<consolewrap.productWrapper> getperformcallout(){

        ConsoleWrapperList = new List<consolewrap.productWrapper>();
        
        HttpRequest req = new HttpRequest();
        
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        
        req.setEndpoint('https://long-running.herokuapp.com/products');
        
        req.setMethod('GET');
        
        res = http.send(req);
        
        if(res.getstatusCode() == 200 && res.getbody() != null){
        
        ConsoleWrapperList=(List<consolewrap.productWrapper>)json.deserialize(res.getbody(),List<consolewrap.productWrapper>.class);
    
    	}

		return consolewrapperlist;

	}

}