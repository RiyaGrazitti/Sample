trigger CreateContact on Account (after insert) {
   
    List <contact> ConList = new List <Contact>();
    for(Account acc:Trigger.new)
    {
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = acc.name;
        ConList.add(con);
    }
  Insert ConList;
}