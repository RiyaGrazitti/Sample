trigger PostalCode on Account (before update) {
   Set <Id> AccList = new Set<Id>();
	for(Account acc:Trigger.new)
    {
        if(acc.billingStreet!=trigger.oldMap.get(acc.id).BillingStreet)
        {     
       AccList.add(acc.Id);
        }
    }
    
    Map<Id,Integer> ConMap = new Map<Id,Integer>();
    List<Contact> ConList = new List<Contact>([SELECT Id,AccountId,MailingPostalCode,Account.BillingPostalCode from Contact where AccountID IN:AccList]);
    for(Contact c:ConList)
    {
        if(c.MailingPostalCode!=c.Account.BillingPostalCode)
        {
			if(ConMap.get(c.AccountId)==NULL)
            {
                ConMap.put(c.AccountId,1);
                system.debug('The Account Id is' +c.AccountId);
            }
            
            else
            {
                ConMap.put(c.AccountId,ConMap.get(c.AccountId)+1);
                system.debug('The Account Id Again is' +c.AccountId);
            }
        }
    }
    
    for(Account acc:Trigger.new)
    {
     if(ConMap.get(Acc.Id)!=NULL && ConMap.get(Acc.Id)>1)
     {
         acc.Out_of_Zip__c = True;
     }
       else
       {
           acc.Out_of_Zip__c = False;
       }
    }
    
}