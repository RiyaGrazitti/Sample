trigger UpdateLeadName on Lead (before insert,before update) {
		for(Lead ld : Trigger.new)
        {
            ld.firstname = ld.firstname + 'Doctor';
        }
}