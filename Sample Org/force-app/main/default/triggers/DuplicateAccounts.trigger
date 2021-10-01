trigger DuplicateAccounts on Account (before insert,before update) {
    for(Account acc:Trigger.new){
        List<Account> AccName = New List<Account>([SELECT id,name from Account where Name=:acc.Name AND id!=:acc.Id]);
        if(AccName.size()>0){
            Acc.Name.adderror('You are creating a Duplicate Account with same Name');
             }
    }

}