trigger emailsend on Event_Attendee__c (after insert) {
   EventAttendeeTriggerHandler.AttendeeEmailSend(Trigger.new);

}