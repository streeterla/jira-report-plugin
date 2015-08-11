<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.mantis.select.projects.to.import'"/></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="action">MantisSetProjectDefaults.jspa</page:param>
    <page:param name="cancelURI"><webwork:url value="'/secure/admin/views/ExternalImport.jspa'" /></page:param>
    <page:param name="submitId">next_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.next'"/></page:param>
    <page:param name="autoSelectFirst">false</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.mantis.select.projects.to.import'"/></page:param>
    <page:param name="helpURL">mantis</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
    <b><webwork:text name="'admin.externalimport.mantis.step2'"/>:</b> <webwork:text name="'admin.externalimport.mantis.select.projects.to.import'"/>

    </page:param>
    <ui:select label="text('admin.externalimport.projects.to.import')" name="'selectedProjects'" template="selectmultiple.jsp" list="availableProjects" listKey="'toString'" listValue="'toString'">
        <ui:param name="'size'" value="@mathBean.min(20, availableProjects/size))" />
    </ui:select>

    <ui:checkbox label="text('admin.externalimport.send.email.notifications')" name="'enablenotifications'" fieldValue="'true'">
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.send.email.notifications.description'"/></ui:param>
    </ui:checkbox>
    <ui:checkbox label="text('admin.externalimport.reuse.existing.accounts')" name="'reuseExistingUsers'" fieldValue="'true'">
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.reuse.existing.accounts.description.mantis'"/></ui:param>
    </ui:checkbox>
    <ui:checkbox label="text('admin.externalimport.mantis.reindex.afterwards')" name="'reindex'" fieldValue="'true'">
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.mantis.reindex.afterwards.description'"/></ui:param>
    </ui:checkbox>
    <ui:checkbox label="text('admin.externalimport.mantis.add.users.to.developer.group')" name="'addToDevelopersGroup'" fieldValue="'true'">
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.mantis.developer.group.description'">
            <webwork:param name="'value0'"><a href="EditPermissions!default.jspa?schemeId=0"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text></ui:param>
    </ui:checkbox>


    <ui:textfield label="text('admin.externalimport.mantis.attachment.path')" name="'attachmentPath'" size="60">
      <ui:param name="'description'"><webwork:text name="'admin.externalimport.mantis.attachment.path.description'"/></ui:param>
    </ui:textfield>


</page:applyDecorator>
<%--<script language="JavaScript">--%>
<%--function openMonitor() {--%>
<%--  win = window.open('MantisImport!monitor.jspa?decorator=none', 'MantisLogMonitor', 'status=no,resizable=yes,top=100,left=200,width=650,height=600,scrollbars=yes');--%>
<%--  win.focus();--%>
<%--  return false;--%>
<%--}--%>
<%--</script>--%>
<%--<a href="MantisImport!monitor.jspa?decorator=none" onClick="return openMonitor()">watch logs in a separate window</a>--%>
</body>
</html>
