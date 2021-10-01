trigger UpdatePhoneOnContacts on Account (after update) 
    {
     List<Contact> ContactList = new List<Contact>();
     List<Id>AccountList = new List<Id>();      
        for(account acList:Trigger.new){
            if(acList.phone!=trigger.oldmap.get(acList.id).phone)
            {
                AccountList.add(acList.Id);
            }
        }
        
     List<Contact> ConList = [SELECT id,Phone,Account.Phone from Contact where AccountID IN:AccountList];
      
        for(Contact con:ConList)
        {
            
                con.otherphone = trigger.oldMap.get(Con.AccountId).phone;
                con.homephone = con.Account.phone;
                ContactList.add(con);
          
        }
update ContactList;        
    }