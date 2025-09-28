public with sharing class ContactService {
public ContactService() {}


public static Id createContactForAccount(Id accountId, String lastName) {
if (accountId == null) throw new IllegalArgumentException('AccountId required');
if (String.isBlank(lastName)) throw new IllegalArgumentException('LastName required');
Contact c = new Contact(LastName = lastName, AccountId = accountId);
insert c;
return c.Id;
}


public static List<Contact> getContactsByAccount(Id accountId) {
if (accountId == null) return new List<Contact>();
return [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE AccountId = :accountId];
}
}