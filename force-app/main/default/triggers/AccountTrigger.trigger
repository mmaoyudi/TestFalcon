trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
 if(Trigger.isUpdate && Trigger.isAfter) {
     List<Account> al = new List<Account>();
     Map<Id, Account> raesdMap = new Map<Id, Account>();
      for(Account a : Trigger.new) {
        Account oa = Trigger.oldMap.get(a.Id);
        System.debug(oa.Name);
        System.debug(a.Name);
             Account na = [Select Id From Account Where Id = :a.Id];
             if (a.Name == '1') {
                 na.Name = '2';
                  al.add(na);
             }
             else if (a.Name == '2') {
               
                 al.add(na);
             }
         }
      if (al.size() > 0) {
          update al;
      }
    }
}