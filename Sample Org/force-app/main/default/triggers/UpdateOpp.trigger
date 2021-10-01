trigger UpdateOpp on Opportunity (after Insert,after update) {
    Set<Id> AccountIds = new Set<Id>();
    Map<Id,Opportunity> MapOpp = new Map<Id,Opportunity>();
        for(Opportunity Opp:Trigger.new)
        {
            if(Opp.TestPhoneOpportunity__c!=NULL && Opp.TestPhoneOpportunity__c!=Trigger.oldmap.get(Opp.id).TestPhoneOpportunity__c)
            AccountIds.add(Opp.AccountId);
            MapOpp.put(Opp.AccountId,Opp);            
        }
     List<Account> Acc = new List<Account>();    
     List<Contact> CList = new List<Contact>();
    Acc = [SELECT id,TestPhoneAccount__c,(SELECT id,TestPhoneContact__c,AccountId from Contacts ) from Account where Id IN:AccountIds];
    
    for(Account ac:Acc) 
    {
        ac.TestPhoneAccount__c = MapOpp.get(ac.id).TestPhoneOpportunity__c;
            for(Contact c:ac.Contacts)
            {
                c.TestPhoneContact__c = MapOpp.get(c.AccountId).TestPhoneOpportunity__c;
                CList.add(c);
            }
       if(CList.size()>0){
       
        update cList;
        }
        
       if(acc.size()>0){        
        update acc;
        }
    }



}