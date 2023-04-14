trigger CheckDuplicateSpeakerBooking on Event_Speaker__c (before insert) {
        DuplicateSpeaker.insertEventSpeaker(trigger.new);       
}