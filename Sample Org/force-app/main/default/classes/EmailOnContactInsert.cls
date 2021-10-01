public class EmailOnContactInsert {
    
    public static void EmailContact(List<Contact> ContactList){
      List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        for (Contact c : ContactList) { 
            
            if (c.Email != NULL) 
            { 
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new String[] {c.Email});
                email.setReplyTo('riyamehta0601@gmail.com');
                email.setSenderDisplayName('Mr Apex Tester');
                email.setHtmlBody('Test');
                email.setSubject('Subjected to Learning');
                emails.add(email);
            }
        }
        Messaging.sendEmail(emails);  
    }
}