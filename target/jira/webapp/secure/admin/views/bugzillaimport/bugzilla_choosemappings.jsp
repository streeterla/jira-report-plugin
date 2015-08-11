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
    <page:param name="action">BugzillaRun.jspa</page:param>
    <page:param name="cancelURI"><webwork:url value="'/secure/admin/views/ExternalImport.jspa'" /></page:param>
    <page:param name="submitId">import_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.import'"/></page:param>
    <page:param name="autoSelectFirst">false</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.select.keys.for.imported'"/></page:param>
    <page:param name="helpURL">bugzilla</page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <b><webwork:text name="'admin.step3of3'"/>:</b> <webwork:text name="'admin.externalimport.select.keys.for.imported'"/>
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
        <webwork:property value="@stat/index">
          <% request.setAttribute("bugzillaProjectKey", "project_"+CoreActionContext.getValueStack().findValue(".")); %>
          <% request.setAttribute("bugzillaProjectLead", "lead_"+CoreActionContext.getValueStack().findValue(".")); %>
        </webwork:property>

        <tr>
           <td class="fieldLabelArea"><b><webwork:text name="'common.concepts.project'"/>:</b></td>
           <td class="fieldValueArea"><webwork:property /></td>
        </tr>

        <webwork:if test="/projectWithNameExists(.) == true">
            <tr>
               <td class="fieldLabelArea"><b><webwork:text name="'common.concepts.key'"/>:</b></td>
               <td class="fieldValueArea"><webwork:property value="/selectedProjectKeys[.]" /></td>
            </tr>
        </webwork:if>
        <webwork:else>
            <ui:textfield label="text('common.concepts.key')" name="@bugzillaProjectKey" value="/selectedProjectKeys[.]" size="'10'"/>
        </webwork:else>

        <ui:component label="text('common.concepts.projectlead')" name="@bugzillaProjectLead" value="remoteUser" template="userselect.jsp">
            <ui:param name="'formname'" value="'jiraform'" />
            <ui:param name="'size'">50</ui:param>
            <ui:param name="'userMode'" value="'2'"/>
            <ui:param name="'description'" value="text('admin.addproject.project.lead.description')"/>
            <ui:param name="'mandatory'" value="true" />
        </ui:component>

        <ui:component name="'selectedProjects'" value="." template="hidden.jsp" />

        <!-- JRA-12837 -->
        <webwork:if test="/overSizedSummariesCount(.) > 0">
            <tr>
                <td class="fieldLabelArea"><span style="color:red; font-weight:bold;"><webwork:text name="'common.words.note'"/>:</span></td>
                <td class="fieldValueArea">
                    <webwork:text name="'admin.externalimport.warn.summary.overlimit'">
                        <webwork:param name="'value0'" value="/summaryMaxLength" />
                    </webwork:text>
                    <br/>
                    <webwork:text name="'admin.externalimport.warn.summary.number.affected'"/>:
                    <span style="font-weight:bold;" id="sum_count_<webwork:property value="@stat/index" />"><webwork:property value="/overSizedSummariesCount(.)" /></span>
                </td>
            </tr>
        </webwork:if>

    </webwork:iterator>
        <ui:component name="'enableNotifications'" value="enableNotifications" template="hidden.jsp" />
        <ui:component name="'reuseExistingUsers'" value="reuseExistingUsers" template="hidden.jsp" />
        <ui:component name="'reindex'" value="reindex" template="hidden.jsp" />
        <ui:component name="'onlyNew'" value="onlyNew" template="hidden.jsp" />

</page:applyDecorator>
<script language="JavaScript">
function openMonitor() {
  win = window.open('BugzillaImport!monitor.jspa?decorator=none', 'BugzillaLogMonitor', 'status=no,resizable=yes,top=100,left=200,width=650,height=600,scrollbars=yes');
  win.focus();
  return false;
}
</script>
<a href="BugzillaImport!monitor.jspa?decorator=none" onClick="return openMonitor()"><webwork:text name="'admin.externalimport.watch.logs.in.separate.window'"/></a>
</body>
</html>
