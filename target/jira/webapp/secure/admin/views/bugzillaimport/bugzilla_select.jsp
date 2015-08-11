<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.bugzilla.import'"/></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="action">BugzillaSetProjectDefaults.jspa</page:param>
    <page:param name="cancelURI"><webwork:url value="'/secure/admin/views/ExternalImport.jspa'" /></page:param>
    <page:param name="submitId">next_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.next'"/></page:param>
    <page:param name="autoSelectFirst">false</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.bugzilla.select.projects'"/></page:param>
    <page:param name="helpURL">bugzilla</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
    <b><webwork:text name="'admin.common.phrases.step.x.of.x'">
        <webwork:param name="'value0'">2</webwork:param>
        <webwork:param name="'value1'">3</webwork:param>
    </webwork:text>:</b> <webwork:text name="'admin.externalimport.bugzilla.select.projects'"/>

        <webwork:if test="/attachmentsEnabled == false">
            <p/>
            <div class="infoBox">
                <webwork:text name="'admin.externalimport.bugzilla.attachments.disabled'">
                   <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/admin/jira/ViewAttachmentSettings.jspa"></webwork:param>
                   <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </div>
        </webwork:if>
        <webwork:if test="/issueLinkingEnabled == false">
            <p/>
            <div class="infoBox">
                <webwork:text name="'admin.externalimport.bugzilla.issue.linking.disabled'">
                   <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/admin/jira/ViewLinkTypes!default.jspa"></webwork:param>
                   <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </div>
        </webwork:if>
    </page:param>
    <ui:select label="text('admin.externalimport.projects.to.import')" name="'selectedProjects'" template="selectmultiple.jsp" list="availableProjects" listKey="'toString'" listValue="'toString'">
        <ui:param name="'size'" value="@mathBean.min(20, availableProjects/size))" />
    </ui:select>

    <ui:checkbox label="text('admin.externalimport.send.email.notifications')" name="'enableNotifications'" fieldValue="'true'">
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.send.email.notifications.description'"/></ui:param>
    </ui:checkbox>
    <ui:checkbox label="text('admin.externalimport.reuse.existing.accounts')" name="'reuseExistingUsers'" fieldValue="'true'">
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.reuse.existing.accounts.description'"/></ui:param>
    </ui:checkbox>
    <ui:checkbox label="text('admin.externalimport.import.only.new.issues')" name="'onlyNew'" fieldValue="'true'">
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.import.only.new.issues.description'"/></ui:param>
    </ui:checkbox>

    <ui:checkbox label="text('admin.externalimport.reindex.afterwards')" name="'reindex'" fieldValue="'true'">
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.reindex.afterwards.description'"/></ui:param>
    </ui:checkbox>

    <ui:checkbox label="text('admin.externalimport.import.work.history')" name="'workHistory'" fieldValue="'true'">
        <ui:param name="'description'"><webwork:text name="'admin.externalimport.import.work.history.description'"/></ui:param>
    </ui:checkbox>

</page:applyDecorator>
<script language="JavaScript">
function openMonitor() {
  win = window.open('BugzillaImport!monitor.jspa?decorator=none', 'BugzillaLogMonitor', 'status=no,resizable=yes,top=100,left=200,width=650,height=600,scrollbars=yes');
  win.focus();
  return false;
}
</script>
<a href="BugzillaImport!monitor.jspa?decorator=none" onClick="return openMonitor()"><webwork:text name="'admin.externalimport.watch.logs'"/></a>
</body>
</html>
