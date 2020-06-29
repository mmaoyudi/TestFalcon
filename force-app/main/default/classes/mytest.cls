@isTest
private class mytest {

    @isTest
    static void myUnitTest() {
    Account a = [SELECT Id, Date2__c FROM Account Limit 1];
        myclass demo = new myclass();
        System.assertEquals(demo.getAppVersion(), '1.0.0');
        // Uncomment the following line to cause a build failure
        // System.assert(false);
    }
}