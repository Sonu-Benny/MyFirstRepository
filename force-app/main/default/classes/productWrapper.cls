public class productWrapper 
{     
        public class productList
        {
            public integer id {get;set;}
            public string name {get;set;}
            public string description {get;set;}
            public integer msrp {get;set;}
            public string category {get;set;}
            public string picture {get;set;}
    	
    	}
    
        public integer page {get;set;}
        public integer pageSize {get;set;}
        public integer total {get;set;}
        public list<productList> products{get;set;}

}