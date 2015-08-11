<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.import.data.from.mantis'"/></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="action">MantisImport.jspa</page:param>
    <page:param name="cancelURI"><%= request.getContextPath() %>/secure/admin/views/ExternalImport.jspa</page:param>
    <page:param name="submitId">next_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.next'"/> >></page:param>
    <page:param name="autoSelectFirst">false</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.import.data.from.mantis'"/></page:param>
    <page:param name="helpURL">mantis</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <b><webwork:text name="'admin.common.phrases.step.x.of.x'">
            <webwork:param name="'value0'">1</webwork:param>
            <webwork:param name="'value1'">3</webwork:param>
        </webwork:text>:</b> <webwork:text name="'admin.externalimport.enter.mantis.details'"/>
    </page:param>

    <ui:textfield label="text('admin.externalimport.mantis.database.url')" name="'url'" size="60">
    </ui:textfield>

    <ui:textfield label="text('admin.externalimport.database.login.name')" name="'username'" size="60">
    </ui:textfield>

    <ui:textfield label="text('admin.externalimport.database.login.password')" name="'password'" size="60">
    </ui:textfield>

    <ui:textfield label="text('admin.externalimport.driver.name')" name="'driverName'" size="60">
    </ui:textfield>

</page:applyDecorator>

</body>
</html>
