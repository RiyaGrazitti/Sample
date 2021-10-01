trigger ContactTryUpdate on Contact (after Insert,after update) {
    List <Contact> Con2 = new List<Contact>();
    List <Contact> Con = new List<Contact>();
    for(Contact c : trigger.new){
        Con = ([Select id,primary__c from Contact where AccountId = '0015g00000FacwS']);
            for (Contact co : Con){
            if(co.Primary__c==True){   
               co.primary__c = False;
                Con2.add(co);
              }
            }
    }
   // update Con2;

}