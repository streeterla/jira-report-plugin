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
		<page:param name="title"><webwork:text name="'admin.issuemigration.overview'"/></page:param>
        <page:param name="instructions">
            <webwork:text name="'admin.issuemigration.overview.instruction'"/>
        </page:param>
		<page:param name="action">MigrateIssueTypes!start.jspa</page:param>
		<page:param name="width">100%</page:param>
    	<page:param name="cancelURI">ManageIssueTypeSchemes!default.jspa</page:param>
		<page:param name="wizard">true</page:param>

        <tr><td>

        <%@include file="/secure/views/bulkedit/includes/bulkmigratepreview.jsp"%>

        </td></tr>
    </page:applyDecorator>
</body>
</html>
