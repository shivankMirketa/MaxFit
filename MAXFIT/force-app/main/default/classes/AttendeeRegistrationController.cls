public with sharing class AttendeeRegistrationController {
    public String MstrId;
    public Attendees__c att {get;set;}
    public Event_Attendee__c  evtAttendee{get;set;}
    public Location_Address_Book__c loc {get;set;}
    public AttendeeRegistrationController() {
    MstrId = ApexPages.currentPage().getParameters().get('param1');
     att= new Attendees__c();
     evtAttendee = new Event_Attendee__c();
     loc=  new Location_Address_Book__c ();
     evtAttendee.Event__c=MstrId;

    }
    public void addAttendeeRegistration() {
       
        
        try {
            insert loc;
            att.Address__c=loc.Id;
            insert att;
            evtAttendee.Attendees__c= att.Id;
            
            insert evtAttendee;
           
           
            
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
    }
}