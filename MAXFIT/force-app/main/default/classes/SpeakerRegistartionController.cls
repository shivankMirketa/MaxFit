public with sharing class SpeakerRegistartionController {
    public Speaker__c speaker {get;set;}
    public Event__c  evt{get;set;}
    public Event_Speaker__c eventSpeaker {get;set;}
    public SpeakerRegistartionController() {
        
       
        speaker = new Speaker__c() ;
  

     eventSpeaker = new Event_Speaker__c() ;
   
     
   

    }
    public void addEventSpeaker() {
        try {
            insert speaker;
            eventSpeaker.Speaker__c = speaker.Id;
          
            insert eventSpeaker ;
           
            
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
    }
}