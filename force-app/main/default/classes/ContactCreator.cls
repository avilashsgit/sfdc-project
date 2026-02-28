public class ContactCreator {

    /**
     * @Description: Creates contacts based on Account that has been published
     * Some other changes
     * @Author : Avilash Basu
     */
    @future
    public static void createContactForAccount(List<String> accountIds) {
        List<Contact> contacts =  new List<Contact>();
        Map<Id,Account> accountMap = new Map<Id,Account>([Select id, Name from Account where id in :accountIds]);
        for(String accountId : accountIds) {
            Contact con = new Contact();
            con.AccountId=accountId;
            con.FirstName = 'Contact For';
            con.LastName = accountMap.get(accountId)?.Name;
            
            contacts.add(con);
        }
        
        insert contacts;
    }
}