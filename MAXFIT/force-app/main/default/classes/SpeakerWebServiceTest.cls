@isTest
private class SpeakerWebServiceTest {
    @isTest
    public static void testSpeakerWebService(){
        id speakerId=SpeakerWebService.createSpeakers('test1','0987654321','mirketa','www.google.com','test1@gmail.com');
        System.assert(speakerId!= null);
        Speaker__c thisCase = [SELECT Id,Name,Email__c,Phone__c,Company__c,Profile_URL__c FROM Speaker__c WHERE Id=:speakerId];
        Test.startTest();
        System.assert(thisCase != null);
        System.assertEquals(thisCase.Name, 'test1');
        System.assertEquals(thisCase.Company__c, 'mirketa');
        Test.stopTest();

    }
}