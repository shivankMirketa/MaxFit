public with sharing class EventRegistrationController {

    public Event_Organizer__c evtOrganizer {get;set;}
	public Event__c evt {get;set;}
	public Location_Address_Book__c	 loc {get;set;}

	public EventRegistrationController ()

	{
        
       
        evtOrganizer =  new Event_Organizer__c() ;
        evt = new Event__c() ;
        loc = new Location_Address_Book__c () ;
    

		
	}
	public  void addEventOrganizer() {
        
          
           if(evt.Event_Type__c!='Virtual'){
            insert loc;
            evtOrganizer.Address__c = loc.Id;
            insert evtOrganizer ;
            evt.Event_Organizer__c = evtOrganizer.Id;
           
            insert evt;
           }
           else{
            insert loc;
            evtOrganizer.Address__c = loc.Id;
            insert evtOrganizer ;
            evt.Event_Organizer__c = evtOrganizer.Id;
            evt.Location_Address_Book__c  = loc.Id;
            insert evt;
           }
            
            
        
    }
   
}