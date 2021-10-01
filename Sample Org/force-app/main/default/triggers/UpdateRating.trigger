trigger UpdateRating on Opportunity (after update) {

   List<Account> Acc = new List<Account>();
    for(Opportunity Opp:Trigger.new)
    {
   	    if(Opp.StageName =='Closed Won')
        {
			Account accounts = new Account();
			accounts.Id = Opp.AccountId;
            accounts.Rating = 'Hot';
            Acc.add(accounts);
                
        }
        update Acc;
    }
 
 }