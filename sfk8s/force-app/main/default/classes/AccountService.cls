public with sharing class AccountService {
public AccountService() {}


public static Id upsertAccount(Account acc) {
if (acc == null) throw new IllegalArgumentException('Account cannot be null');
if (String.isBlank(acc.Name)) throw new IllegalArgumentException('Account Name required');
upsert acc;
return acc.Id;
}


public static Account getAccount(Id accountId) {
if (accountId == null) return null;
return [SELECT Id, Name, Phone FROM Account WHERE Id = :accountId LIMIT 1];
}


public static Boolean deleteAccount(Id accountId) {
if (accountId == null) return false;
Account a = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
delete a;
return true;
}
}