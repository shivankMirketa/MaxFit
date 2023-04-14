public class EventAttendeeTriggerHandler1 {
public static void sendConfirmationEmail(List<Event_Attendee__c> newRecordList ) {
    Set<Id> attendeesIdsSet = new Set<Id>();
    Set<Id> eventIdsSet = new Set<Id>();
    for(Event_Attendee__c EventAttendee : newRecordList){
        attendeesIdsSet.add(EventAttendee.Attendees__c);
        eventIdsSet.add(EventAttendee.Event__c);
    }
    Map<Id,Attendees__c> attendeeMap = new Map<Id,Attendees__c>([Select Id, Name,Email__c From Attendees__c WHERE  Id IN : attendeesIdsSet]);
    Map<Id, Event__c > eventMap = new Map<Id, Event__c > ( [Select Id,Name, Name__c, Start_Date_Time__c, Event_Organizer__c , Event_Organizer__r.Name,
                                                                Location_Address_Book__c , Location_Address_Book__r.Name
                                                                FROM Event__c  WHERE ID IN: eventIdsSet]
                                                         );
    List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
    for(Event_Attendee__c EventAttendee : newRecordList){
        Attendees__c Attendee = attendeeMap.get(EventAttendee.Attendees__c);
        Event__c evt = eventMap.get(EventAttendee.Event__c);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Pass for the '+evt.Name__c);
        List<String> toAddress = new List<String>();
        toAddress.add(Attendee.Email__c);
        mail.setToAddresses( toAddress );
        mail.setSenderDisplayName(evt.Event_Organizer__r.Name);
        String emailBody = 'Dear '+ Attendee.Name + ',<br/><br/>'+
            'Thank you for registering for '+evt.Name__c+' which will be Organized on '+
            evt.Start_Date_Time__c+' & will be held in '+evt.Location_Address_Book__r.Name
            +'.<br/>We are excited to have you,'+ 
            'see you in the event. <br/>'+
            'Thanks,<br/>'+evt.Event_Organizer__r.Name;
        mail.setHtmlBody(emailBody);
        emailList.add(mail);
    }
    List<Messaging.SendEmailResult> results =  Messaging.sendEmail(emailList, false); 
    for(Messaging.SendEmailResult email : results){
        System.debug(email.isSuccess());
    }   
}

}