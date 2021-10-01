trigger UpdateOwnerOnAccount on Account (before insert) {
  List<Account> AccList = New List<Account>();
  	for(Account ac:Trigger.new)
    {
        if(ac.Industry=='Education')
        {
            AccList.add(ac);
        }
    }
          List<Account> Acc = new List<Account>();
          if(AccList.size()>0)
          {
              for(Account Ac:AccList)
              {
                  Ac.ownerid = '0055g000008s7zO';
              }
          }
}