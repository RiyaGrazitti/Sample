trigger InsertOrUpdateAccount on Account (before insert,before update) {
    for (Account acc : trigger.new){
        if(!acc.name.contains('Riya')){
            
        
        acc.name = 'Riya'+acc.name;
        }
    }

}