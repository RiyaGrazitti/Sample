trigger PreventDeletion on Account (before Delete) {
    
   Set<Id> AccList = new Set<Id>(); 
    for(Account acc : Trigger.old)
    {
        AccList.add(acc.Id);
    }
   
    List <Contact> Con = new List<Contact>([SELECT id,AccountId from Contact where AccountID IN:AccList]);
    {
        if(Con.size()>=2)
        {
            for(Account acc1:Trigger.old)
            {
               acc1.addError('You cannot delete it');
            }
        }
    }

}