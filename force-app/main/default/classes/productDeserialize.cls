public class productDeserialize {
    
    public productWrapper wrapper{get;set;}

    public productDeserialize() 
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://long-running.herokuapp.com/products');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        wrapper = (productWrapper) JSON.deserializeStrict(response.getBody(), productWrapper.class);
    }
   // public void AddToCart()
   // {
     //   ApexPages.addMessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Added to cart'));
   // }
   
    public Integer count=0;
    public Integer countvalue{get;set;}
    
    public void countclick()
    {
        countvalue= ++count;
        
    }


}