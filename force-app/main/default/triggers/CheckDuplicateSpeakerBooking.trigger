trigger EventSpeakerTrigger on Event_Speaker__c (before insert,before update) {
        EventSpeakerTriggerHandler.insertEventSpeaker(trigger.new);       
}