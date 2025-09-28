@isTest
private class ContactServiceTest {
@isTest static void testCreateAndGet() {
Account a = new Account(Name='Acct for Contact');
insert a;


Test.startTest();
Id cId = ContactService.createContactForAccount(a.Id, 'Smith');
Test.stopTest();


System.assertNotEquals(null, cId);


List<Contact> contacts = ContactService.getContactsByAccount(a.Id);
System.assertEquals(1, contacts.size());
System.assertEquals('Smith', contacts[0].LastName);
}


@isTest static void testCreateBadArgsAndGetNull() {
// null accountId
try {
ContactService.createContactForAccount(null, 'X');
System.assert(false, 'expected exception for null accountId');
} catch (Exception e) {
System.assert(e instanceof IllegalArgumentException);
}


// blank last name
Account a2 = new Account(Name='Temp');
insert a2;
try {
ContactService.createContactForAccount(a2.Id, ' ');
System.assert(false, 'expected exception for blank lastName');
} catch (Exception e) {
System.assert(e instanceof IllegalArgumentException);
}


// get contacts for null
List<Contact> empty = ContactService.getContactsByAccount(null);
System.assertEquals(0, empty.size());
}
}