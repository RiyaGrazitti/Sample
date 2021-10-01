public class updateOpps {

    	public static void updateOppsNew(List<Account> AccList)
        {
            Set<Id> AccIds = new Set<Id>();
            for(Account acc : AccList)
            {
              AccIds.add(acc.Id);  
            }
    List<Opportunity> OppList = new List<Opportunity>();
        OppList = [SELECT ID,ACCOUNTID from opportunity where ACCOUNTID IN:AccIds];
        List<Opportunity> updOpps = new List<Opportunity>();    
            for(Opportunity Opp:OppList)
            {            
                if(Opp.StageName!='closed won' && Opp.createddate<(system.now()-30))
                {
                    Opp.StageName ='Closed Lost';
                    updOpps.add(Opp);
                }
            }
        update UpdOpps;    
        }
}