public without sharing class productlwc {
	@AuraEnabled(cacheable =true)
    public static List<productList> callProduct() 
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://long-running.herokuapp.com/products');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        productWrapper wrapper = (productWrapper) JSON.deserialize(response.getBody(), productWrapper.class);
        
        list<productList> prodList = new list<productList>();
        integer i;
        for(i=0;i<wrapper.products.size();i++){
            prodList.add(wrapper.products[i]);
        }
        return prodList;   
    }
   
    public class productWrapper 
	{     
    	@AuraEnabled public integer page {get;set;}
        @AuraEnabled public integer pageSize {get;set;}
        @AuraEnabled public integer total {get;set;}
        @AuraEnabled public List<productList> products{get;set;}
    }
    public class productList
    {
        @AuraEnabled public integer id {get;set;}
        @AuraEnabled public string name {get;set;}
        @AuraEnabled public string description {get;set;}
        @AuraEnabled public integer msrp {get;set;}
        @AuraEnabled public string category {get;set;}
        @AuraEnabled public string picture {get;set;}
    }
}