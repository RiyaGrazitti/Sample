trigger UpdateLead on Lead (before insert,before update) {
    List <Contact> Con = [SELECT id,email from Contact];
    Map<String,Contact> MapofContacts = new Map<String,Contact>();
    
    for(Contact c:Con)
    {
        MapOfContacts.put(c.email,c);
    }
    
    for(lead ld:Trigger.new)
    {
     	if(ld.Email!=NULL && ld.Email!=trigger.oldMap.get(ld.id).email)
        {
            if(MapOfContacts.containsKey(ld.Email))
            {
                ld.Email.adderror('Email Id already Exists');
            }
        }
    }
  
}