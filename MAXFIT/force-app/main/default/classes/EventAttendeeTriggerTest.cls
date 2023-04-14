@isTest
public class EventAttendeeTriggerTest {
    
    @isTest
     Static void setupData(){
        Event_Organizer__c  org = new Event_Organizer__c (
            Name = 'Mahim Singh',
            Phone__c = '7464072181',
            Email__c = 'mahim.kumar@mirketa.com',
            Alternative_Phone__c  = '7464072181',
            Alternative_Email__c ='mahimsinghchauhan96002@gmail.com'
        );
        insert org;
        
        Event__c event = new Event__c(
            Name__c = 'MAX FIT Campaign',
            Event_Organizer__c  = org.Id,
            Event_Type__c = 'Virtual',
            Frequency__c  = 'Weekly',
            Max_Seats__c  = 199,
            Recurring__c = true,
            Live__c = true,
            Start_Date_Time__c = System.now(),
            End_Date_Time__c  = System.now().addDays(3)
        );
        insert event;
        Attendees__c att = new Attendees__c(
            Name = 'Rudra rana',
            Email__c = 'rudra.rana@gmail.com',
            Phone__c = '9807654321'
        );
        insert att;
        
        Event_Attendee__c evtAtt = new Event_Attendee__c(Event__c = event.Id, Attendees__c = att.Id);
        insert evtAtt;
        //Test.startTest();
        EventAttendeeTriggerHandler.AttendeeEmailSend(trigger.new);
        /*try{
            integer i = 10/0;
        }catch(System.Exception ex ){
         */   
        
        //Test.stopTest();
    
           
    }
    
       
    
}