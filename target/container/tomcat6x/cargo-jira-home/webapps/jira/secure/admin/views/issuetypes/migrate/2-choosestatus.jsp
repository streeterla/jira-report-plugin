<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuemigration.title'"/></title>
</head>

<body>
	<page:applyDecorator name="jiraform">
        <%--<page:param name="helpURL">configcustomfield</page:param>--%>
        <%--<page:param name="helpURLFragment">#Managing+multiple+configuration+schemes</page:param>--%>
		<page:param name="title"><webwork:text name="'admin.issuemigration.map.status'"/></page:param>

        <page:param name="instructions">
            <webwork:text name="'admin.issuemigration.issue.type'"/>
           <webwork:component name="'issuetype'" template="constanticon.jsp">
             <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
             <webwork:param name="'iconurl'" value="/currentIssueContext/issueType/string('iconurl')" />
             <webwork:param name="'alt'"><webwork:property value="/currentIssueContext/issueType/string('name')" /></webwork:param>
           </webwork:component>
            <webwork:text name="'admin.issuemigration.issue.type.not.valid'">
                <webwork:param name="'value0'"><strong><webwork:property value="/currentIssueContext/issueType/string('name')" /></strong></webwork:param>
                <webwork:param name="'value1'"><strong><webwork:property value="/currentIssueContext/project/string('name')" /></strong></webwork:param>
                <webwork:param name="'value2'"><webwork:component name="'issuetype'" template="constanticon.jsp">
             <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
             <webwork:param name="'iconurl'" value="/bulkEditBean/targetIssueTypeGV/string('iconurl')" />
             <webwork:param name="'alt'"><webwork:property value="/bulkEditBean/targetIssueTypeGV/string('name')" /></webwork:param>
           </webwork:component>
            <strong><webwork:property value="/bulkEditBean/targetIssueTypeGV/string('name')" /></strong></webwork:param>
            </webwork:text>
            <webwork:text name="'bulk.move.statusmapping'" />.

        </page:param>
		<page:param name="action">MigrateIssueTypes!chooseStatus.jspa</page:param>
		<page:param name="width">100%</page:param>
    	<page:param name="cancelURI">ManageIssueTypeSchemes!default.jspa</page:param>
		<page:param name="wizard">true</page:param>

        <tr><td colspan="2">
            <%@include file="/secure/views/bulkedit/includes/statusmapping.jsp"%>

            <%@include file="/secure/views/bulkedit/subtaskstatusmapping.jsp"%>
        </td></tr>
    </page:applyDecorator>

</body>
</html>
