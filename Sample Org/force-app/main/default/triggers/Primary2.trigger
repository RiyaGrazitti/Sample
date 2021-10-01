trigger Primary2 on Contact (after insert,after update,after Delete) 
{
    
     Set <Id> Ids = new Set<Id>();
     Set <Id> AccId = new Set <Id>();
     List <Contact> ContId = new List<Contact>();    
     Id AccountId;
        Id ContactId;
        for (Contact con : trigger.new)
           {
             if(con.AccountId!=NULL)
                {
                AccId.add(con.AccountId);
                AccountId =  con.AccountId; 
                ContID.add(Con);
                    
                    if(con.Primary__c==True)
                    {
                    Ids.add(con.AccountId);
                    ContId.add(con);
                    }
                 }  
             }
    
    
    Set <Account> AcctIds = New Set<Account>();
    map<id,account> accmap = new map<id,account>();
    Map <Id,Account> MapAccount =  New Map <Id,Account> ([SELECT id,Primary_Contact__c from Account where Id IN:Ids]);
  
     for (Contact c: ContId)
     {
         if(Ids.size()>0){
                 
            Account myAccount = MapAccount.get(c.accountId);
            myAccount.Primary_Contact__c = c.Email;
            ContactId = c.Id;
            accmap.putAll(mapaccount);
             }
        }
 update accmap.values();    

    map<id,Contact> Conmap = new map<id,Contact>();
    List <Contact> Con2 = new List<Contact>();
    
    List <Contact> Con = new List<Contact>();
    for(Contact c : ContId)
    {
        Con = ([Select id,primary__c from Contact where AccountId IN : Ids]);
            for (Contact co : Con )
            {
            if(Co.id!=ContactId && co.Primary__c!=False && Ids.size()>0)
              {   
               co.primary__c = False;
               Con2.add(co);
               Conmap.putAll(Con2);
              }
            }
         }
    update Conmap.values();
    
List <Contact> AllContacts =  new List<Contact>([SELECT id,Primary__c from Contact where AccountID IN: AccId]);    
List <Contact> UpdateCon = New List <Contact>();
       
    for(Contact c : AllContacts)
        {
            if(c.Primary__c!=True && c.id!= ContactId){
                
                updateCon.add(c);
            }
        }
    List <Account> acc = new List<Account>();
    if(updateCon.size()==AllContacts.size())
    {
        Account ac =  new Account();
        ac.Primary_Contact__c = 'No Primary Accounts';
        acc.add(ac);
    }
    //update acc;
 }