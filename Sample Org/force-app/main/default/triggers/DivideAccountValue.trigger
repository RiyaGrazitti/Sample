trigger DivideAccountValue on Account (after insert,after update) {
    set<Id> accId = new set<Id>();
    List<Contact> Con = new List<Contact>();
   		 for(Account acc:Trigger.new)    
 		  {
           accId.add(acc.Id);  
           
  		  }
   Map<Id,Account> AccList = new Map<Id,Account>([SELECT id,name,Total_Account__c, (SELECT Id,AccountId from Contacts)from Account where ID IN:AccId]);
   List<Contact> ConList = new List<Contact>([SELECT Id, AccountId,Department, Account_Value__c from Contact where AccountId IN: accId]);
   List <Contact> Con2 = New List<Contact>();
    
 		for(Contact c: ConList)
        {
            
            Account acc =  Acclist.get(c.AccountId);
            System.debug('New Account Id' +acc.id);
            c.Account_Value__c =  acc.Total_Account__c/acc.contacts.size();
            System.debug('Account Value' +c.Account_value__c);
            System.debug('Total Value' +acc.Total_Account__c);
            Con2.add(c);
            }
                    
    update Con2;
}