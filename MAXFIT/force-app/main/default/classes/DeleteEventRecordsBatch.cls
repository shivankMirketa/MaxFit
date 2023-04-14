public  class DeleteEventRecordsBatch implements Database.Batchable<sObject> {
  
        public Database.QueryLocator start(Database.BatchableContext BC) {
            return Database.getQueryLocator([
                SELECT Id, End_Date_Time__c, Live__c
                FROM Event__c
                WHERE End_Date_Time__c < LAST_N_MONTHS: 2 AND Live__c = TRUE
            ]);
        }
    
        public void execute(Database.BatchableContext BC, List<Event__c> Events) {
            delete Events;
        }
    
        public void finish(Database.BatchableContext BC) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[]{'shivank.chaudhary@mirketa.com'};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Batch Job Completed');
            mail.setPlainTextBody('Execution of the batch has been processed. ');
    
            Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    
            for (Messaging.SendEmailResult result : results) {
                if (result.isSuccess()) {
                    System.debug('Email sent successfully.');
                } else {
                    System.debug('Email could not be sent: ' + result.getErrors()[0].getMessage());
                }
            }
        }
    
    
}