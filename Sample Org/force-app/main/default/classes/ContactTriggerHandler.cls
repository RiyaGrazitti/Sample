public class ContactTriggerHandler {
	public static void DeadContact(List<Contact> ContactList)
    {   
        Set<Id> AccIds = new Set<Id>();
        	for(Contact Con:ContactList)
            {
                AccIds.add(Con.AccountId);   
                System.debug('The List of Account' +Con.Account);
            }
        
    List<Account> AccList = [SELECT Id from Account where ID IN:AccIds];
    System.debug('The List of Account' +AccList);
    
    Map<Id,Integer> ConMap = new Map<Id,Integer>();
    List<Account> AccListNew = new List<Account>([SELECT Id, name, (SELECT Id, Name FROM Contacts) FROM Account where ID IN:AccIds]);
    Map <Id, Integer> allAccounts = new Map <Id, Integer>();   
    
        for(Account acc:AccListNew)
        {
            allAccounts.put(acc.id,acc.Contacts.size());
            system.debug('The Accounts are ' +allAccounts);
        }

        
    List<Contact> ConList = new List<Contact>([SELECT Id,AccountId,dead__c,Account.need_intel__c from Contact where AccountID IN:AccIds]);
 		for(Contact c:ConList)
        { 
            
            if(c.Dead__c==True )
            {
                if(ConMap.get(c.AccountID)==NULL)
                {
                ConMap.put(c.AccountId,1);
                System.debug('The value of ConMapUpd' +ConMap);
                }
                else
                {
                    ConMap.put(c.AccountID,Conmap.get(C.AccountID)+1);
                }
            }
        }
      List<Account> Accupdate = new List<Account>();
      for(Account Acc:AccList)  
      {   
       
        system.debug('The Conmap size is' +Conmap.get(acc.Id));
        system.debug('The Conmap size is' +allAccounts.get(Acc.Id));  
          
        Integer contsize = (Conmap.get(acc.Id)*100)/allAccounts.get(Acc.Id);
        system.debug('The Contact size is' +contsize);  
  
         if(contsize>10)
         {
             Accupdate.add(Acc);
             acc.need_intel__c = True;
         }
    	}
        update Accupdate;
    }
        
}