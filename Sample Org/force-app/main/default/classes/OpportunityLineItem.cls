public class OpportunityLineItem {
    Public static void OppLineItem(List<OpportunityLineItem> OppLineItemList)
    {
        for(opportunityLineItem OppLiItem : OppLineItemList)
        {
             	Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
//                email.setToAddresses(new String[] {Opp.Email});
                email.setReplyTo('riyamehta0601@gmail.com');
                email.setSenderDisplayName('Mr Apex Tester');
                email.setHtmlBody('Test');
                email.setSubject('Subjected to Learning');
//				emails.add(email);
        }
    }

}