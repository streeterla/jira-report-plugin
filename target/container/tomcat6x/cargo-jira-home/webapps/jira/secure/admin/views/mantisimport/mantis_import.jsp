
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
    <page:param name="submitId">import_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.import'"/></page:param>
    <page:param name="autoSelectFirst">false</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.import.data.from.mantis'"/></page:param>
    <page:param name="helpURL">mantis</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <webwork:text name="'admin.externalimport.import.data.description'"/>
        <p>
        <webwork:text name="'admin.externalimport.mantis.import.instruction'">
            <webwork:param name="'value0'"><br><b></webwork:param>
            <webwork:param name="'value1'"><u></webwork:param>
            <webwork:param name="'value2'"></u></webwork:param>
        </webwork:text></b>
    </page:param>

    <ui:textfield label="text('admin.externalimport.mantis.database.url')" name="'url'" size="60">
    </ui:textfield>

    <ui:textfield label="text('admin.externalimport.database.login.name')" name="'name'" size="60">
    </ui:textfield>

    <ui:textfield label="text('admin.externalimport.database.login.password')" name="'password'" size="60">
    </ui:textfield>

    <ui:textfield label="text('admin.externalimport.driver.name')" name="'driverName'" size="60">
    </ui:textfield>

    <ui:checkbox label="text('admin.externalimport.send.email.notifications')" name="'enablenotifications'" fieldValue="'true'">
    <ui:param name="'description'"><webwork:text name="'admin.externalimport.send.email.notifications.description'"/></ui:param>
    </ui:checkbox>

</page:applyDecorator>

<page:applyDecorator name="jiraform">
    <page:param name="width">100%</page:param>

    <ui:textarea label="text('admin.externalimport.log')" name="'importLog'" cols="100" rows="20" >
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.log.of.events'"/></ui:param>
        <ui:param name="'readonly'" value="true"/>
    </ui:textarea>
</page:applyDecorator>
  <script language="JavaScript">
  function openMonitor() {
    win = window.open('MantisImport!monitor.jspa?decorator=none', 'MantisLogMonitor', 'status=no,resizable=yes,top=100,left=200,width=650,height=600,scrollbars=yes');
    win.focus();
    return false;
  }
  </script>
  <a href="MantisImport!monitor.jspa?decorator=none" onClick="return openMonitor()"><webwork:text name="'admin.externalimport.watch.logs'"/></a>


</body>
</html>
