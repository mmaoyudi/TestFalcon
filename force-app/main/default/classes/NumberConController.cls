public with sharing class NumberConController {
    public String keyValue {get; set;}
    public Map<Object, Object> valueMap {get; set{
            if (valueMap == null) {
                valueMap = value;
                if (value.containsKey(keyValue))
              System.debug(keyValue);
              System.debug(value);
              System.debug(valueMap);
                valueStr = (String)value.get(keyValue);
            }
            else {
                valueMap = value;
            }
        }
    }
    public Contact con {get; set;}
    public String valueStr {get; set {
        System.debug(value);
            valueStr = value;
            if (String.isNotBlank(valueStr)) {
                valueMap.put(keyValue, valueStr.replaceAll(',', ''));
            }
            else {
                valueMap.put(keyValue, '');
            }
        }
    }

    public NumberConController() {
    }
}