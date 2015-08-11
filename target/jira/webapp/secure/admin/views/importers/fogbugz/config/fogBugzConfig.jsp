<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.fogbugz.title'"/></title>
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
<page:applyDecorator name="jiraform">
    <page:param name="jiraformId">importForm</page:param>
    <page:param name="action">ConfigureFogBugzMapping!start.jspa</page:param>
    <page:param name="cancelURI"><webwork:url value="'FogBugzImport!default.jspa'" /></page:param>
    <page:param name="submitId">externalimport_submit</page:param>
    <page:param name="submitName"><webwork:text name="'admin.externalimport.start.wizard'"/></page:param>
    <page:param name="autoSelectFirst">true</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.fogbugz.title.prefix'"/> <webwork:text name="'admin.externalimport.mappings.setup'"/></page:param>
    <page:param name="width">100%</page:param>
	<page:param name="instructions">
        <p><webwork:text name="'admin.externalimport.fogbugz.setup.description'"/></p>
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
       <ui:param name="'description'">
            <webwork:text name="'admin.externalimport.existing.configuration.file.description2'" />
       </ui:param>

    </ui:textfield>

</page:applyDecorator>


</body>
</html>
