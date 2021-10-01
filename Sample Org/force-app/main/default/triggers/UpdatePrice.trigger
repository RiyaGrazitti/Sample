trigger UpdatePrice on Books__c (before insert,before update) {
    for(Books__c Bo : Trigger.new){
        if(Bo.Price__c!=NULL){
            Bo.Price__c = (.9)*Bo.Price__c;
        }
    }

}