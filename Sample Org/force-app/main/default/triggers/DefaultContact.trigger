trigger DefaultContact on Account (After insert,After update,before Insert,before update) {
    List<Contact> ConList = new List<Contact>();
    List<Account> AccList = new List<Account>();
    Set<Id> AccId = new Set<Id>();
    if(Trigger.IsInsert && Trigger.IsAfter) 
    {
        for(Account acc: Trigger.new)
        {
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.FirstName = 'Info';
            con.LastName = 'Default';
            con.Email = 'info@websitedomain.tld';
            
            AccId.add(acc.Id);
            ConList.add(con);
        }
      Insert ConList;
    }
           
    if(Trigger.IsUpdate && Trigger.IsBefore)
    {
      Set<Id> AccId = new Set<Id>();
      for(Account acc: Trigger.new)
        {
            AccId.add(acc.Id);
        }
       Map<Id,Account> MapAccount = new Map<Id,Account>([SELECT Id,(SELECT Id,AccountId from Contacts) FROM Account where ID IN:AccId]);
        for(Account acc: Trigger.new)
        {
            AccId.add(acc.Id); 
            if(MapAccount.get(acc.Id).Contacts.size()==1)
            {
               System.debug('The number of Contacts' +acc.contacts.size());
               acc.Only_default_Contact__c = True;
            }
            else 
            {
                System.debug('The number of Contacts' +acc.contacts.size());
                acc.Only_default_Contact__c = False;
            }
         }   
    
    }
    
}