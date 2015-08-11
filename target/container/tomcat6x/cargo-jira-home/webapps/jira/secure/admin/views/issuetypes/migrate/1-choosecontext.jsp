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
		<page:param name="title"><webwork:text name="'admin.issuemigration.select.type'"/></page:param>
        <page:param name="description">
        </page:param>
        <page:param name="instructions">
             <webwork:text name="'admin.issuemigration.select.type.instruction'"/>
            <webwork:component name="'issuetype'" template="constanticon.jsp">
              <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
              <webwork:param name="'iconurl'" value="/currentIssueContext/issueType/string('iconurl')" />
              <webwork:param name="'alt'"><webwork:property value="/nameTranslation(/currentIssueContext/issueType)" /></webwork:param>
            </webwork:component>
             <strong><webwork:text name="'admin.issuemigration.issue.in.project'">
                 <webwork:param name="'value0'"><webwork:property value="/nameTranslation(/currentIssueContext/issueType)" /></strong></webwork:param>
                 <webwork:param name="'value1'"><strong><webwork:property value="/currentIssueContext/project/string('name')" /></webwork:param>
             </webwork:text></strong>
        </page:param>
		<page:param name="action">MigrateIssueTypes!chooseContext.jspa</page:param>
		<page:param name="width">100%</page:param>
    	<page:param name="cancelURI">ManageIssueTypeSchemes!default.jspa</page:param>
		<page:param name="wizard">true</page:param>

        <ui:component name="'pid'" template="hidden.jsp" theme="'single'" value="/currentIssueContext/project/long('id')" />
        <webwork:property value="/issueTypeEditHtml" escape="false"/>
    </page:applyDecorator>
</body>
</html>
