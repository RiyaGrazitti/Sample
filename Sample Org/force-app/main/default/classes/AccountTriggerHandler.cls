public class AccountTriggerHandler {
    
    public static void handleBeforeDelete(List<Account>AccList)
    {
        Set<Id> AccId = new Set<Id>(); 
    for(Account Acc:AccList)
    {
        AccId.add(Acc.Id);
    }
    
   List<Opportunity> OppList = new List<Opportunity>(); 
   Map<Id,Opportunity> OppMap = new map<Id,Opportunity>();
    
    OppList = [SELECT Id,AccountId from Opportunity where AccountId IN:AccId AND Iswon = true];
    
    for(Opportunity Opp:OppList)
    {
        if(!OppMap.containsKey(Opp.AccountId))
        {
          OppMap.put(Opp.AccountId,Opp);  
        }
    }
    
        for(Account Acc:AccList)
        {
            if(OppMap.containsKey(Acc.Id))
            {
                Acc.addError('You cannot delete the Account.Please contact your system adminstrator');
            }
        }

    }
 
   public static void UpdateWebsite(List<Account>AccList,Map<Id,Account>AccMap)
   {
    
   Set<Id> AccId = new Set<Id>();
   Map<Id,Account> MapAccount = new Map<Id,Account>();
   
      for(Account acc:AccList)
       {
         if(acc.Website!=AccMap.get(acc.Id).website && acc.Website!=NULL)
         {
            AccId.add(acc.Id); 
            MapAccount.put(acc.Id,acc);
         }              
           
       }
      List<Contact> UpdateCon = new List<Contact>();
      List<Contact> ContactList = new List<Contact>([SELECT ID,AccountId,FirstName,LastName from Contact where AccountId IN:AccId]);
       {
           for(Contact con:ContactList)
           {
               con.Profile__c = MapAccount.get(con.AccountId).website + '/' + con.FirstName.substring(0,1)+ con.LastName;
               UpdateCon.add(con);
           }
       }
      update UpdateCon;
   
   }
    
    
  Public static void InsertAcc(List<Account> AccListUpd)
  {
     List<Contact> ConList = new List<Contact>();
     List<Account> AccList = new List<Account>();
      for(Account acc : AccListUpd)
      {
          Contact con = new contact();
          con.AccountId = acc.Id;
          con.lastName = acc.Name;
          ConList.add(con);
       }
      Insert ConList;
      
      for(Contact con:ConList)
      {
 		  account accNew = new account();
          accNew.Id = con.AccountId;
   		  accNew.Client_Contact__c = con.Id;
          AccList.add(accNew);
      }
      update AccList;
      
  }
    
   Public static void AccEmails(List<Account> AccList)
   {
       List<User> Userlist = New List<User>();
       UserList = [SELECT Id,Email from user where Profile.name = 'System Administrator'];
       List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
       String[] toAddresses = new String[]{};
       for(user u:UserList)
       {
       toAddresses = new String[] {u.Email};
       }  
       System.debug('The email Addresses are ' +toAddresses);
       for(Account Acc:AccList)
       {
            	Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
           		email.setToAddresses(toAddresses);
                email.setReplyTo('riyamehta0601@gmail.com');
                email.setSenderDisplayName('New Account Created');
                email.setSubject('New Account Created');
                emails.add(email);
                email.setHtmlBody('Hello ' + '<br/><br/>A new ' + '<a href="'+URL.getSalesforceBaseUrl().toExternalForm()+'/'+Acc.id+'">Account</a> is created in the Salesforce Org');

       }
       Messaging.sendEmail(emails);  

   }

}