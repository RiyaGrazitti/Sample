trigger HelloWorld on Lead (before update) {
        for(lead l : Trigger.new)
        {
        l.firstname = 'Hello';
        l.lastname = 'world';
        }
}