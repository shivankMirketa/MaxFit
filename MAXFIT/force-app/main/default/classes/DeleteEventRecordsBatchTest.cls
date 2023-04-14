@isTest
public class DeleteEventRecordsBatchTest {
@isTest
    public static void testSetupData(){
       
        List<Event__c> eventList = new List<Event__c>();
        for(Integer i=0; i<=200; i++){
            Event__c event = new Event__c(
                Name__c = 'MAX FIT Campaign #'+i+1,
            
                Frequency__c  = 'Weekly',
                Max_Seats__c  = 199,
                Recurring__c = true,
                Live__c = true,
                Start_Date_Time__c = System.now().addMonths(-4),
                End_Date_Time__c  = System.now().addDays(3).addMonths(-4)
            );
            eventList.add(event);
        }
        insert eventList;
    }
    
    @isTest
   static void PurgeEventsBatch(){
        //Test.startTest();
      
        String jobId = Database.executeBatch(new DeleteEventRecordsBatch(), 250);
      
           
       
       
        //Test.stopTest();
        
    }
}