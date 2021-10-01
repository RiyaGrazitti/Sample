trigger SetPrimaryContact on Contact (After insert,After update)
{
   Set<Id> AccountIds = new set<Id>();
   Set<Id> ContactId = new set<Id>();
   Map<Id,Contact> ContactMap = new Map<Id,Contact>();
    
    for(Contact Con : Trigger.new)
    {
        if(Con.Primary__c!=Trigger.oldmap.get(Con.Id).Primary__c)
        {
          AccountIds.add(Con.AccountId);
          ContactId.add(Con.Id);
          ContactMap.put(Con.AccountId,Con);
        }
    }
   List<Account> AccountList = new List<Account>();
   List<Contact> Cons = new List<Contact>();
   List <Account> Acc = [SELECT id,Primary_Contact__c,(SELECT id,AccountId,email,name,Primary__c from Contacts) from Account where Id IN:AccountIds];
  
  Integer Count = 0;  
  for(Account ac:Acc)
  {    
       for(contact c: ac.Contacts)
       {
           if(!ContactID.equals(c.id) && c.Primary__c==True)
           {
               c.primary__c = False;
               ac.Primary_Contact__c = ContactMap.get(ac.id).name + ContactMap.get(ac.id).email;
               AccountList.add(ac);
               Cons.add(c);
           }
           else
           {
               if(c.Primary__c==False)
               {
                 Count = Count+1;
                   if(Count==ac.Contacts.size())
                   {
                       ac.Primary_Contact__c = 'No primary Contacts';
                       AccountList.add(ac);
                   }
               }
           }
       }
   }
    update AccountList;
    update Cons;
}