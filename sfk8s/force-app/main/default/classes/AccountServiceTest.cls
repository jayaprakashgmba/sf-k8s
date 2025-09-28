@isTest
private class AccountServiceTest {
@isTest static void testUpsertGetDelete() {
// positive upsert
Account a = new Account(Name='Test Account');
Test.startTest();
Id accId = AccountService.upsertAccount(a);
Test.stopTest();
System.assertNotEquals(null, accId);


// get
Account fetched = AccountService.getAccount(accId);
System.assertEquals('Test Account', fetched.Name);


// delete
Boolean deleted = AccountService.deleteAccount(accId);
System.assert(deleted);
}


@isTest static void testUpsertNullAndBlankName() {
// null argument
try {
AccountService.upsertAccount(null);
System.assert(false, 'Expected exception for null account');
} catch (Exception e) {
System.assert(e instanceof IllegalArgumentException);
}


// blank name
Account a2 = new Account(Name=' ');
try {
AccountService.upsertAccount(a2);
System.assert(false, 'Expected exception for blank name');
} catch (Exception e) {
System.assert(e instanceof IllegalArgumentException);
}
}


@isTest static void testGetAccountNullAndDeleteNull() {
// get with null id
Account got = AccountService.getAccount(null);
System.assertEquals(null, got);


// delete with null id
Boolean result = AccountService.deleteAccount(null);
System.assertEquals(false, result);
}
}