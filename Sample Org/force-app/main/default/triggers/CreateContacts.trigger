trigger CreateContacts on Account (after insert,after update) {
    for(Account Ac:trigger.new){
        List <Contact> NewContactList = New List <Contact>();
        Decimal NumberOfLocations = Ac.Number_of_Locations__c;
        if(NumberOfLocations!=NULL){
            for(integer i=0;i<=NumberOfLocations;i++){
                Contact Con = new Contact();
                con.AccountId = Ac.Id;
                con.Lastname = 'Test'+i;
                NewContactList.add(Con);
            }
        }
            Insert newContactList;
    }
}