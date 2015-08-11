<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.mantis.log.watcher'"/></title>
    <meta http-equiv="Refresh" content="1200">
    <meta http-equiv="Pragma" content="no-cache">
</head>

<body>
<page:applyDecorator name="jiraform">
    <page:param name="action"><webwork:text name="'admin.common.words.refresh'"/></page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.mantis.import.progress'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
      <webwork:text name="'admin.externalimport.mantis.import.description'"/>
      <form><input type="button" onClick="window.location.reload(true);" value="refresh"></form>
    </page:param>
    <ui:textarea label="text('admin.externalimport.log')" name="'importLog'" cols="80" rows="30">
        <ui:param name="'readonly'" value="true"/>
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.log.of.events'"/></ui:param>
    </ui:textarea>
    
</page:applyDecorator>

</body>
</html>
