trigger OpportunityTrigger on Opportunity (after update,after insert) {
	if((Trigger.IsUpdate || Trigger.IsInsert) && Trigger.Isafter)
    {
        OpportunityTriggerHandler.OppAmount(Trigger.new);
        //OpportunityTriggerHandler.createAssetonClosedWon(Trigger.new);

    }
     if((Trigger.IsInsert) && Trigger.Isafter)

    	OpportunityTriggerHandler.OppLineItemInsert(Trigger.New);
}