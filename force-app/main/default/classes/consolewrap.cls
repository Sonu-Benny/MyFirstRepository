public class consolewrap {
    
    public myWrapper data {get;set;}
    
    public class myWrapper{
        public list<productWrapper> products {get;set;}
    }
    
    public class productWrapper{
        	
            public string name {get;set;}
            public string description {get;set;}        	
            public integer msrp {get;set;}        	
            public string picture {get;set;} 
    }

}