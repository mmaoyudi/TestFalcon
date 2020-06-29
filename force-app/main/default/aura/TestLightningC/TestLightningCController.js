({
	doInit : function(component, event, helper) {
        // alert(component.get("v.pageReference").state.entityApiName);
        
        var workspaceAPI = component.find("workspace");
        var a = component.find("aaaaa");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            alert(focusedTabId);
            var createRecordEvent = $A.get("e.force:createRecord");
            var map = {};
            var map1 = {};
            var state = component.get("v.pageReference").state;
            var entityApiName = state.entityApiName;
            map["entityApiName"] = entityApiName;
            // {"Name":"123"}
            if (state.par != null
                    && state.par != '') {
                map1 = JSON.parse(decodeURIComponent(state.par));
            }
            map["defaultFieldValues"] = map1;
            createRecordEvent.setParams(map);
            createRecordEvent.fire();
            workspaceAPI.closeTab({tabId: focusedTabId});
        })
    }
})