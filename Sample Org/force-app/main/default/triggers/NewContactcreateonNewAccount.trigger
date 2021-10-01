trigger NewContactcreateonNewAccount on Account (After insert) {
   List<Contact> ContactCreateList = new List<Contact>();
    for(Account acc:Trigger.new)
    {
        if(acc.industry=='banking')
        {
            Contact Con = new Contact();
            Con.AccountId = acc.Id;
            Con.Lastname = acc.Name;
            Con.Phone = acc.Phone;
            ContactCreateList.add(Con);
        }
    }
  Insert ContactCreateList;
}