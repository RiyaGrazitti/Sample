trigger UpdateOppNew on Opportunity (before insert) {
    Set<Id> AccountIds = new Set<Id>();
       List<Account> AccList = new List<Account>();

        for(Opportunity Opp:Trigger.new)
        {
            if(Opp.TestPhoneOpportunity__c!=NULL && Opp.TestPhoneOpportunity__c!=Trigger.oldmap.get(Opp.id).TestPhoneOpportunity__c)
            {
            AccountIds.add(Opp.AccountId);
            Account MyAcc = New Account();
       	    myAcc.Id = Opp.AccountId;
       	    MyAcc.TestPhoneAccount__c = Opp.TestPhoneOpportunity__c;
            AccList.add(MyAcc);
            }
        }
    List<Contact> ConList = new List<Contact>();
    List<Contact> Cons = New List<Contact>();
    Cons = [SELECT id,TestPhoneContact__c,Account.TestPhoneAccount__c from contact where Id IN:AccountIds];
    
    for(Contact Con:cons)
    {
        Con.TestPhoneContact__c = Con.Account.TestPhoneAccount__c;
        ConList.add(Con);
    }
   if(ConList.size()>0)
    {
    update ConList;
    }
   if(AccList.size()>0)
   {
    update AccList;
   }

}