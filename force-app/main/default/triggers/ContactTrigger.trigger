trigger ContactTrigger on Contact (before insert, before update, after insert, after update) {
    Set<ID> aSet = new Set<ID>();
    for (contact c : trigger.new) {
        //aSet.add(c.AccountId);
        if (Trigger.isAfter) {
          //ttt.updateAccount(c.AccountId);
        }
    }
    List<Account> alist = new List<Account>();
    for (Id acc : aSet) {
        //alist.add(new Account(Id = acc, Site = 'Site' + acc));
    }
    //update alist;
}