trigger testTrigger on Test1__c (before Insert, before Update) {
    for (Test1__c n : Trigger.new) {
        n.Test1__c += '1';
    }
}