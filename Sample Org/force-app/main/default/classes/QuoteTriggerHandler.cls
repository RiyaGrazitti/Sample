public class QuoteTriggerHandler {
    Public static void DeleteQuote(List<SBQQ__Quote__c> QuoteList)
    {
     Set<Id> OppId = new Set<Id>();
        for(SBQQ__Quote__c q :QuoteList)
        {
            OppId.add(q.SBQQ__Opportunity2__c);
        }
   
 List<Contact> ConList = new List<Contact>([SELECT Id,AccountId,dead__c,Account.need_intel__c from Contact]);
        
    }
}