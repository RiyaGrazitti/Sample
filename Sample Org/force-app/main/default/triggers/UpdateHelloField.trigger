trigger UpdateHelloField on Account (before insert,before update){
 	{
    for(Account acc : Trigger.new){
        if(acc.Hello__c!='World'){
        acc.Hello__c = 'World';
        }
    }
   }
}