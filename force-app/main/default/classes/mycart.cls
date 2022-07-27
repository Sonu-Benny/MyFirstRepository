public with sharing class mycart {
    //List<JSON2Apex.productWrapper> displayList {get;set;}
    public static List<JSON2Apex.productWrapper> getWrapData(){
        List<JSON2Apex.productWrapper> proList = new List<JSON2Apex.productWrapper>();
        
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('https://long-running.herokuapp.com/products');
        req.setMethod('GET');
        HTTPResponse res = h.send(req);
        
        JSON2Apex wrapPostResponse = JSON2Apex.parse(res.getBody());
        List<JSON2Apex.productWrapper> wrapList = wrapPostResponse.Data.Products;
        
        
        for(JSON2Apex.productWrapper product: wrapList){
            proList.add(product);
            system.debug(product.name);
            system.debug(product.description);
        }
         
      return proList;
    }
}