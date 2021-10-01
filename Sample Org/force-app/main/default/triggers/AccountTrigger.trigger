trigger AccountTrigger on Account (before delete,after update,after Insert) {
    
    if(Trigger.IsDelete && Trigger.IsBefore)
    {
  	    AccountTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    
	if(Trigger.IsUpdate && Trigger.IsAfter) 
    {
    	AccountTriggerHandler.UpdateWebsite(Trigger.new,Trigger.OldMap);
        updateOpps.updateOppsNew(Trigger.new);
    
    }
    
    if(Trigger.IsAfter && Trigger.IsInsert)
    {
        AccountTriggerHandler.InsertAcc(Trigger.new);
        AccountTriggerHandler.AccEmails(Trigger.new);
    }
}