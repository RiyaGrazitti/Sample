trigger Test on Opportunity (before insert) {
    for(Opportunity a:Trigger.new){
        a.Name = a.Name + 'Test';
    }

}