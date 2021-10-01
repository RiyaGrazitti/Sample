trigger OutOfZip on Account (after update) {
   Set<Id>AccountId = new Set<Id>();
	for(Account acc:Trigger.new)
    {
        AccountId.add(acc.Id);
    }
}