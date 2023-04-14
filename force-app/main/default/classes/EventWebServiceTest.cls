@isTest
private class EventWebServiceTest{
    @isTest
public static void testEventWebService() {

    Event_Organizer__c eventOrganizer = new Event_Organizer__c();
    eventOrganizer.Name = 'New Organizer';
    eventOrganizer.Email__c = 'shivank@mirketa.com';
    insert eventOrganizer;

    Event__c event = new Event__c();
    event.Name__c = 'Event Name';
    event.Max_Seats__c = 5;
    event.Start_Date_Time__c = System.now();
    insert event;

    Test.startTest();

    List<Event__c> eveGet = EventWebService.getEvent();
    System.assert(eveGet != null);
    System.assert(eveGet.size() == 1);
    System.assertEquals('Event Name', eveGet[0].Name__c);
    Test.stopTest();
}
}