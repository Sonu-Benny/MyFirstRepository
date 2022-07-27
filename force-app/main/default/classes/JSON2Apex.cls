public class JSON2Apex {
    @AuraEnabled
    public myWrapper Data;
    
    public class myWrapper{
        @AuraEnabled
        public list<productWrapper> products {get;set;}
    }
    
    public class productWrapper{
        	@AuraEnabled
            public string name {get;set;}
        	@AuraEnabled
            public string description {get;set;}
        	@AuraEnabled
            public integer msrp {get;set;}
        	@AuraEnabled
            public string picture {get;set;} 
    }
    
    public static JSON2Apex parse(String json)
    {
        return(JSON2Apex)System.JSON.deserialize(json,JSON2Apex.class);
    }
}