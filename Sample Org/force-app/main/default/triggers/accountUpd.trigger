trigger accountUpd on Account (after insert,after update) {
    Set<Id> AccountList = new Set<Id>();
	for(Account acc:Trigger.new)
    {
        if(acc.BillingCity!=NULL  && acc.BillingCity!=trigger.oldmap.get(acc.id).BillingCity)
        {
            AccountList.add(acc.id);
            //Testing sample
        }
    }
    List<Opportunity> Opps = [SELECT id,city__c,AccountId from Opportunity where AccountId IN:AccountList];
    List<Opportunity> OppList = new List<Opportunity>();
    if(Opps.size()>0)
    {
      for(Opportunity Op:Opps)
      {
        Op.city__c = trigger.newmap.get(op.accountId).BillingCity;
        OppList.add(Op);
  	  }
	}
   update OppList; 
}