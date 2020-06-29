public with sharing class DateConController {
    public String keyValue {get; set;}
    public Map<Object, Object> valueMap {get; set{
            if (valueMap == null) {
                if (value.containsKey(keyValue))
                valueMap = value;
                dateValueStr = (String)value.get(keyValue);
            }
            else {
                valueMap = value;
            }
        }
    }
    public Contact con {get; set;}
    public String dateValueStr {get; set {
        System.debug(value);
            dateValueStr = value;
            if (String.isNotBlank(dateValueStr)) {
                valueMap.put(keyValue, dateValueStr.replace('/', '-'));
            }
            else {
                valueMap.put(keyValue, '');
            }
        }
    }

    public DateConController() {
        con = new Contact();
    }
}