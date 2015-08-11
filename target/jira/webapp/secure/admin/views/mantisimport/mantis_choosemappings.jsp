<%@ page import="webwork.action.CoreActionContext"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.map.keys.to.projects'"/></title>
</head>

<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">MantisRun.jspa</page:param>
    <page:param name="cancelURI"><webwork:url value="'/secure/admin/views/ExternalImport.jspa'" /></page:param>
    <page:param name="submitId">import_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.import'"/></page:param>
    <page:param name="autoSelectFirst">false</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.select.keys.for.imported'"/></page:param>
    <page:param name="helpURL">mantis</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <webwork:text name="'admin.externalimport.mantis.step3'">
            <webwork:param name="'value0'"><b></webwork:param>
            <webwork:param name="'value1'"></b></webwork:param>
        </webwork:text>
        <webwork:if test="/doesImportExceedUserLimit == true">
            <p/>
            <div class="warningBox">
                <webwork:text name="'admin.externalimport.warn.user.limit.exceeded'">
                    <webwork:param name="'value0'"><webwork:property value="/unknownUsers/size"/></webwork:param>
                </webwork:text>
            </div>
        </webwork:if>
    </page:param>

    <webwork:iterator value="selectedProjects" status="'stat'">
        <%-- JRA-4043 - we need to build the dynamic input name with the project id not the name which can really make webwork angry --%>
        <webwork:property value="/mantisProjectId(.)">
          <% request.setAttribute("mantisProjectKey", "project_"+CoreActionContext.getValueStack().findValue(".")); %>
          <% request.setAttribute("mantisProjectLead", "lead_"+CoreActionContext.getValueStack().findValue(".")); %>
          <% request.setAttribute("mantisProjectName", "name_"+CoreActionContext.getValueStack().findValue(".")); %>
        </webwork:property>

        <ui:textfield label="text('common.concepts.project')" name="@mantisProjectName" value="." size="'10'"/>
        <ui:textfield label="text('common.concepts.key')" name="@mantisProjectKey" value="/selectedProjectKeys[.]" size="'10'"/>

        <ui:component label="text('common.concepts.projectlead')" name="@mantisProjectLead" value="remoteUser" template="userselect.jsp">
            <ui:param name="'formname'" value="'jiraform'" />
            <ui:param name="'size'">50</ui:param>
            <ui:param name="'userMode'" value="'2'"/>
            <ui:param name="'description'" value="text('admin.externalimport.mantis.project.lead.description')"/>
            <ui:param name="'mandatory'" value="true" />
        </ui:component>

        <ui:component name="'selectedProjects'" value="." template="hidden.jsp" />

    </webwork:iterator>
        <ui:component name="'attachmentPath'" value="attachmentPath" template="hidden.jsp" />
        <ui:component name="'mantisURL'" value="mantisURL" template="hidden.jsp" />
        <ui:component name="'addToDevelopersGroup'" value="addToDevelopersGroup" template="hidden.jsp" />
        <ui:component name="'reuseExistingUsers'" value="reuseExistingUsers" template="hidden.jsp" />
        <ui:component name="'reindex'" value="reindex" template="hidden.jsp" />

</page:applyDecorator>
<script language="JavaScript">
function openMonitor() {
  win = window.open('MantisImport!monitor.jspa?decorator=none', 'MantisLogMonitor', 'status=no,resizable=yes,top=100,left=200,width=650,height=600,scrollbars=yes');
  win.focus();
  return false;
}
</script>
<a href="MantisImport!monitor.jspa?decorator=none" onClick="return openMonitor()"><webwork:text name="'admin.externalimport.mantis.watch.log'"/></a>
</body>
</html>
