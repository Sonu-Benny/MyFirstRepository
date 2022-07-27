public without sharing class JSONDeserializeLWC{
	@AuraEnabled(cacheable=true)
    public static List<ProductList> getProducts() 
    {
        ProdWrapper wrapper;
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://long-running.herokuapp.com/products');
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);

        wrapper = (ProdWrapper)JSON.deserializeStrict(response.getBody(), ProdWrapper.class);
        
        List<ProductList> products = new List<ProductList>();
       
        for(integer i=0;i<wrapper.products.size();i++)
        {
            products.add(wrapper.products[i]);
        }
        return products;   
    }
   
    public class ProdWrapper 
	{     
    	@AuraEnabled public integer page {get;set;}
        @AuraEnabled public integer pageSize {get;set;}
        @AuraEnabled public integer total {get;set;}
        @AuraEnabled public List<ProductList> products{get;set;}
    }
        public class ProductList
        {
            @AuraEnabled public integer id {get;set;}
            @AuraEnabled public string name {get;set;}
            @AuraEnabled public string description {get;set;}
            @AuraEnabled public integer msrp {get;set;}
            @AuraEnabled public string category {get;set;}
            @AuraEnabled public string picture {get;set;}
        }


	
}