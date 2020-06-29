({
	doInit : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");

        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
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