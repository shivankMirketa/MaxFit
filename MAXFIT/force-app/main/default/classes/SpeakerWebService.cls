@RestResource(urlMapping='/Speakers/*')
global with sharing class SpeakerWebService {

    @HttpPost
    global static Id createSpeakers( String name,String phone,String company,String url,String email ) {
      Speaker__c s= new Speaker__c(
        Name=name,
        Phone__c=phone,
        Email__c=email,
        Company__c=company,
        Profile_URL__c=url
        );
        insert s;
        return s.id;
    }

}