<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title>Import issues from a FogBugz installation</title>
</head>
<body>
<style type="text/css">
    .fieldLabelArea
    {
        width: 30%;
    }

    .fieldValueArea input
    {
        width: 85%;
    }
</style>
<script language="JavaScript" type="text/javascript">
<!--
    function forwardPage()
    {
        try
        {
            var wizardFlag = document.getElementById("runWizard");
            wizardFlag.value = "true";
            wizardFlag.form.submit();
            return false;
        }
        catch(e)
        {
            return true;
        }
    }
//-->
</script>


<page:applyDecorator name="jiraform">
    <page:param name="jiraformId">importForm</page:param>
    <page:param name="action">FogBugzImport!settings.jspa</page:param>
    <page:param name="cancelURI"><webwork:url value="'/secure/admin/views/ExternalImport.jspa'" /></page:param>
    <page:param name="submitId">import_submit</page:param>
    <page:param name="submitName">Import</page:param>
    <page:param name="autoSelectFirst">true</page:param>
    <page:param name="title"><webwork:text name="'admin.fogbugzimport.description'"/></page:param>
    <page:param name="width">100%</page:param>
	<page:param name="instructions">
        <p><webwork:text name="'admin.fogbugzimport.instruction'"/>
            <webwork:text name="'admin.fogbugzimport.wizard.prefix'">
                <webwork:param name="'value0'"><strong><a accesskey="W" href="ConfigureFogBugzMapping!default.jspa" onclick="return forwardPage();"></webwork:param>
                <webwork:param name="'value1'"></a></strong></webwork:param>
            </webwork:text>
        </p>
        <p><webwork:text name="'admin.fogbugzimport.wizard.description'"/></p>
	</page:param>

    <ui:textfield label="text('admin.fogbugzimport.database.url')" name="'connectionBean/url'" >
        <ui:param name="'mandatory'">true</ui:param>
    </ui:textfield>

    <ui:textfield label="text('admin.externalimport.database.login.name')" name="'connectionBean/username'">
    </ui:textfield>

    <ui:textfield label="text('admin.externalimport.database.login.password')" name="'connectionBean/password'">
    </ui:textfield>

    <ui:textfield label="text('admin.externalimport.driver.name')" name="'connectionBean/driverName'">
        <ui:param name="'mandatory'">true</ui:param>
    </ui:textfield>


    <ui:textfield label="text('admin.externalimport.existing.configuration.file')" name="'configFileLocation'">
        <ui:param name="'mandatory'">true</ui:param>
        <ui:param name="'description'">
            <webwork:text name="'admin.externalimport.existing.configuration.file.description'">
                <webwork:param name="'value0'"><strong><a href="ConfigureFogBugzMapping!default.jspa" onclick="return forwardPage();"></webwork:param>
                <webwork:param name="'value1'"></a></strong></webwork:param>
            </webwork:text>
        </ui:param>
    </ui:textfield>

    <ui:component name="'runWizard'" template="hidden.jsp" theme="'single'"  >
        <ui:param name="'defaultValue'">false</ui:param>
    </ui:component>


</page:applyDecorator>


</body>
</html>
