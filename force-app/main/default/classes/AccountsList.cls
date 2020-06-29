@RestResource(urlMapping='/AccountsList/*')
global with sharing class AccountsList {

    @HttpGet
    global static List<Account> getAccounts() {
        List<Account> accts = new List<Account>();

        String searchVal = RestContext.request.params.get('namesearch');
        String billingState = RestContext.request.params.get('billingst');
        if (searchVal != null) {
            String searchStr = '%' + searchVal + '%';
            accts = [SELECT Id, Name, Phone, Website, BillingState FROM Account WHERE Name LIKE :searchStr LIMIT 20];
        } else if (billingState != null) {
            accts = [SELECT Id, Name, Phone, Website, BillingState FROM Account WHERE BillingState = :billingState LIMIT 20];
        } else {
            accts = [SELECT Id, Name, Phone, Website, BillingState FROM Account LIMIT 20];
        }
        return accts;
    }

    @HttpPost
    global static String newAccount(String Name, String Phone, String Website, String BillingState) {
        Account account = new Account();
        account.Name = Name;
        account.Phone = Phone;
        account.Website = Website;
        account.BillingState = BillingState;
        insert account;
        return account.Id;
    }
}