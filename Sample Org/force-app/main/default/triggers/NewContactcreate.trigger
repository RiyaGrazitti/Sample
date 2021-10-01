trigger NewContactcreate on Account (after insert, after update) {
   List <Account> AccountList = new List<Account>();
   List <Contact> ContactList = new List<Contact>();

    AccountList = [SELECT id,AnnualRevenue from Account where ID IN:Trigger.new];
        for(Account acc:AccountList)
   		 {
          if(acc.AnnualRevenue>50000)
          {
              Contact con = new Contact();
              con.AccountId = acc.id;
              con.FirstName = 'Samriti';
              con.LastName = 'Sharan';
              ContactList.add(con);
          }
   		 }
      
    Insert ContactList;
}