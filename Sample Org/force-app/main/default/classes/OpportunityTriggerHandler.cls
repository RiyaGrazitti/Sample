public class OpportunityTriggerHandler {

    public static void OppAmount(List<Opportunity>OppList){
        
       Set<Id> AccId = new Set<Id>();
        for(Opportunity Opp:OppList)
        {
            AccId.add(Opp.AccountId);
        }
        
        List<Opportunity> OppListNew = new List<Opportunity>();
        List<Account> AccsList = new List<Account>();
        OppListNew = [SELECT Id,AccountId,Amount,Account.is_gold__c from Opportunity where AccountID IN:AccId];
        
        for(Opportunity Opp:OppListNew)
        {
            if(Opp.Amount>20000)
            {
                Opp.Account.is_gold__c = True;
                AccsList.add(Opp.Account);
                System.debug('The Opp Account is ' +Opp.Account);
            }
        }
        
       Update AccsList;
    }
    
    Public static void createAssetonClosedWon(List<Opportunity> OppList) {
	List<Asset> assetList = new List<Asset>();        
	for(opportunitylineitem ol : [SELECT Quantity,UnitPrice,PricebookEntry.Product2Id, PricebookEntry.Product2.Name, Description,
										Opportunity.AccountID
								 FROM opportunitylineitem 
								 WHERE opportunityId IN: OppList]){
		asset a = new asset();
		a.AccountId=ol.opportunity.AccountID;
		a.Quantity=ol.quantity;		
		a.Product2Id=ol.PricebookEntry.Product2Id;
		a.price=ol.UnitPrice;
		a.Description=ol.Description;
		a.name=ol.PricebookEntry.Product2.Name;
		assetList.add(a);	
	}		
	insert assetList;           
	}
    
  Public static void OppLineItemInsert(List<Opportunity> OppList)
  {
    list<opportunityLineItem> olilist= new list<OpportunityLineItem>();
    List<PriceBookEntry> priceBookList = [SELECT Id, Product2Id, Product2.Id, Product2.Name FROM PriceBookEntry WHERE Product2Id = '01t5g000000aSue' LIMIT 1];
    for(opportunity op:OppList){
        OpportunityLineItem oli= New OpportunityLineItem();
        oli.OpportunityId = op.ID;
        oli.PricebookEntryId = priceBookList[0].Id;
        oli.Quantity = 1;
        oli.TotalPrice = 100;
        olilist.add(oli);
    }
    if(olilist!=null&&olilist.size()>0)
        insert olilist;
  }
}