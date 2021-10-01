trigger ContactTrigger on Contact (after update,before Insert) {
    if(Trigger.Isupdate && Trigger.IsAfter)
    {
        ContactTriggerHandler.DeadContact(Trigger.New);
        EmailOnContactInsert.EmailContact(Trigger.New);
    }
    
    if(Trigger.IsInsert && Trigger.IsBefore)
    {
       //NoDuplicateContacts.DuplicateContacts(Trigger.new);
    }

}