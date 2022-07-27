public class DFSMDemo
{	
    public String Yourname{get;set;}
    
    public DFSMDemo()
    {
        Yourname='Sonu';
        System.debug(Yourname);
    }
    public DFSMDemo(String n1)
    {
        this.Yourname='Hello World!!!'+n1;
        System.debug(Yourname);
    }
   
}