public class contacts 
{
    public list<Contact> acc{get;set;}
    public String newname{get;set;}
    public contacts()
    {
        acc=[select Name,Email,Phone from Contact];
    }
    public void changename()
    {
        String nn=newname + '%';
        acc=[select Name,Email,Phone from Contact where Name like :nn ];
    }

}