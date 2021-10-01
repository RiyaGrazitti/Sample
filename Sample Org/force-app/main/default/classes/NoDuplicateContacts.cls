public class NoDuplicateContacts {
	
    Public static void DuplicateContacts(List<Contact> ConList)
    {
     List<String> emails  = New List<String>();
     List<String> Numbers = New List<String>();
        for(Contact con:ConList)
        {
          if(con.email!=NULL)
          {
              emails.add(con.Email);
          }
          if(con.Phone!=NULL)
          {
              Numbers.add(con.Phone);
          }
        }
       
      List<Contact> Conemails = new List<Contact>([SELECT email from contact where email IN:emails]);
        List<String> ConListEmails = new List<String>();
      		for(Contact c:Conemails)
            {
              ConListEmails.add(c.Email);  
            }
      List<Contact> Conphns = new List<Contact>([SELECT phone from contact where phone IN:Numbers]);
        List<String> ConListphn = new List<String>();
      		for(Contact c:Conphns)
            {
              ConListEmails.add(c.Phone);  
            }
 
        for(Contact con:ConList)
        {
            
            if(ConListEmails.Contains(con.Email) || ConListEmails.Contains(con.Phone))
            {
                Con.addError('This is a Duplicate Contact, Use an Existing One!');
            }
        }
  
    }
}