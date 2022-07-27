public class name 
{
    public string yourname{get;set;}
    public string getname{get;set;}
    public name()
    {
        yourname='Sonu';
        System.debug(yourname);   
    }
    public void namechanger()
    {
        yourname=getname;
        
    }

}