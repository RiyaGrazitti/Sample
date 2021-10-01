trigger AccountPhoneAsContact on Contact (before insert) {
 	 Set<Id> AccountId = new Set<Id>();
    for(Contact ContactList:Trigger.new)
    {
        AccountId.add(ContactList.AccountId);
    }
   List<Account> AccListUpdate = new List<Account>();
    if(AccountId.size()>0)
    {
        Map<Id,Account> AccList = new Map<Id,Account>([SELECT id,phone from Account where ID IN:AccountId]);
        for(Contact Con:Trigger.new)
        {
            if(Con.AccountId!=NULL && AccList.ContainsKey(Con.AccountId))
            {
             Con.Phone =  AccList.get(Con.AccountId).phone;

            }
           
        }
    }
}