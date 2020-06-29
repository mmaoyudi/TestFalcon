public with sharing class MultiselectExampleController {

    public SelectOption[] selectedContacts { get; set; }
    public SelectOption[] allContacts { get; set; }
    public Map<Object, Object> testDate { get; set; }

    public Contact acc { get; set; }

    
    public String message { get; set; }
    
    public MultiselectExampleController() {
        selectedContacts = new List<SelectOption>();
        acc = new Contact();
        testDate = new Map<Object, Object>();
        testDate.put('testDate', '2017/1/1');
        testDate.put('testnum', '123312');
        List<Contact> contacts = [SELECT Name, Id FROM Contact limit 10];    
        allContacts = new List<SelectOption>();
        for ( Contact c : contacts ) {
            allContacts.add(new SelectOption(c.Id, c.Name));
        }
    }

    public PageReference save() {
        System.debug(testDate);
        message = 'Selected Contacts: ';
        Boolean first = true;
        for ( SelectOption so : selectedContacts ) {
            if (!first) {
                message += ', ';
            }
            message += so.getLabel() + ' (' + so.getValue() + ')';
            first = false;
        }
        
        return null;       
    }
}