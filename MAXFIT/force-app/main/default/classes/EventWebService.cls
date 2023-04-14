@RestResource(urlMapping='/Events/*')
global with sharing class EventWebService {

    @HttpGet
    global static List<Event__c> getEvent() {
        List<Event__c> result = [SELECT Name__c, Max_Seats__c, Start_Date_Time__c, Event_Organizer__r.Name, Event_Organizer__r.Email__c FROM Event__c];
        System.debug(result.size());
        return result;
    }

}