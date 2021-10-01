trigger UpdatedAssistancePhone on Contact (after Insert,after Update) 
{
     
     List<Account> AccList = new List<Account>();
     List<Opportunity> OppListUpdate = new List<Opportunity>(); 
     Set<Id> AccountIds = new Set<Id>();
     Map<Id,string> MapContact = new Map<Id,String>();
      for(Contact co : Trigger.new)
      {
         if(co.AssistantPhone !=Trigger.oldMap.get(co.id).AssistantPhone)
         {
           AccountIds.add(co.AccountId);
           MapContact.put(co.AccountId,co.AssistantPhone);
         }
      }
    
    List<Account> AccountIdsList = [SELECT id,AssistantPhone__c from Account where ID IN:AccountIds];
    List<Opportunity> OppList = [SELECT id,AccountId,AssistantPhone__c from Opportunity where AccountID IN:AccountIDs];
    
    for(Account ac:AccountIdsList)
    {
        if(MapContact.ContainsKey(ac.Id))
        {    
        ac.AssistantPhone__c = MapContact.get(ac.Id);
        AccList.add(ac);
        }
    }
    for(Opportunity Opp:OppList)
        {
          if(MapContact.ContainsKey(Opp.AccountId)) 
            {    
            Opp.AssistantPhone__c = MapContact.get(Opp.AccountId);
            OppListupdate.add(Opp);
            }
        }
    
    if(AccList.size()>0)
    { 
    update AccList;
    }
    if(OppListUpdate.size()>0)
    { 
    update OppListUpdate;
    }
}