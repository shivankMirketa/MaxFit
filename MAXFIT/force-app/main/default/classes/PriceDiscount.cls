public class PriceDiscount {
    public static void ApplyDiscount(List<Book__c>books){
        for(Book__c b:books){
            b.Book_Price__c *=0.9;
        }
    }
}