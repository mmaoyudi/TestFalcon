public class testToolApi{
  public void run() {
  String json = '{ "Name" : "TestAccountTrigger", "TableEnumOrId" : "Account", "Body" : "trigger TestAccountTrigger on Account (before insert) {System.debug(\'aaa\');}" }'; 

Httprequest req = new HttpRequest();
req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v27.0/sobjects/ApexTrigger');
req.setMethod('POST');
req.setHeader('Content-Type', 'application/json');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
req.setBody(json);

Http httpReq = new Http();
HttpResponse res = httpReq.send(req); 
System.debug(res.getBody());
  }
}