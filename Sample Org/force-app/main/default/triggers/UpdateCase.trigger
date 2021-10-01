trigger UpdateCase on Case (before insert) {
    for(case c:trigger.new)
    {
        if(c.origin == 'email')
        {
            c.priority = 'High';
            c.Status = 'New';
        }
    }
}