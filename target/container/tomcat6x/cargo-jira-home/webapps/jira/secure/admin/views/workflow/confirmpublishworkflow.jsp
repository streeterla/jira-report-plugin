<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.workflows.publish.title'"/></title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">PublishDraftWorkflow.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.workflows.publish.title'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="submitId">publish_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.words.publish'"/></page:param>
    <page:param name="cancelURI">ListWorkflows.jspa</page:param>
    <page:param name="description">
        <webwork:text name="'admin.workflows.publish.description'">
            <webwork:param name="'value0'"><strong></webwork:param>
            <webwork:param name="'value1'"><webwork:property value="/workflowDisplayName"/></webwork:param>
            <webwork:param name="'value2'"></strong></webwork:param>
            <webwork:param name="'value3'"><webwork:property value="/workflow/name"/></webwork:param>
        </webwork:text>
    </page:param>

    <webwork:if test="/madeDeliberateChoice == false">
        <script language="javascript" type="text/javascript">
           //
           // This will ensure that the user MUST select a check box by choice!
           window.onload = function()
           {
               document.jiraform.enableBackup_false.checked = false;
               document.jiraform.enableBackup_true.checked = false;
               togglebackuppath(false);
           }

           function togglebackuppath(enable)
           {
               var element = document.getElementById('new_workflow_name');
               if (element)
               {
                   if (enable == 'false' || !enable)
                   {
                       element.disabled = true;
                   }
                   else
                   {
                       element.disabled = false;
                   }
               }
           }
       </script>
    </webwork:if>
    <ui:radio label="/text('admin.workflows.publish.save.copy.active', /workflow/name)" name="'enableBackup'" list="booleanList" listKey="'id'" listValue="'name'" value="enableBackup">
        <ui:param name="'inline'">true</ui:param>
        <ui:param name="'onclick'">togglebackuppath(this.value)</ui:param>
    </ui:radio>
    <ui:textfield label="text('admin.workflows.publish.save.backup.name')" name="'newWorkflowName'" size="'30'">
        <ui:param name="'cssId'">new_workflow_name</ui:param>
    </ui:textfield>

    <ui:component name="'workflowName'" value="/workflow/name" template="hidden.jsp" theme="'single'"  />
    <ui:component name="'workflowMode'" value="/workflow/mode" template="hidden.jsp" />
    <ui:component name="'madeDeliberateChoice'" value="/madeDeliberateChoice" template="hidden.jsp" />
</page:applyDecorator>
</body>
</html>
