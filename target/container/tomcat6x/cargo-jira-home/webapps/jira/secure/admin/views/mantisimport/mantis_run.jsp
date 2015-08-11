<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.mantis.projects.import'"/></title>
</head>

<body>
<page:applyDecorator name="jiraform">
    <page:param name="width">100%</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.mantis.import.log'"/></page:param>

    <ui:textarea label="text('admin.externalimport.log')" name="'importLog'" cols="100" rows="20" >
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.log.of.events'"/></ui:param>
        <ui:param name="'readonly'" value="true"/>
    </ui:textarea>
</page:applyDecorator>

</body>
</html>
