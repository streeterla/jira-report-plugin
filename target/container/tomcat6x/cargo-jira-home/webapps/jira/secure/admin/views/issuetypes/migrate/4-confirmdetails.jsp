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
		<page:param name="title"><webwork:text name="'admin.issuemigration.confirmation'"/></page:param>

        <page:param name="instructions">
            <p><webwork:text name="'admin.issuemigration.confirmation.instruction'"/></p>
            <ul class="square">
            <webwork:iterator value="/multiBulkMoveBean/issuesInContext" status="'status'">
               <li>
                <a href="#<webwork:property value="./key/project/string('id')" /><webwork:property value="./key/issueTypeObject/id" />"><webwork:property value="./key/project/string('name')" /> - <webwork:property value="./key/issueTypeObject/nameTranslation" /></a>
                </li>
            </webwork:iterator>
            </ul>
        </page:param>
		<page:param name="action">MigrateIssueTypes!perform.jspa</page:param>
		<page:param name="width">100%</page:param>
    	<page:param name="cancelURI">ManageIssueTypeSchemes!default.jspa</page:param>
		<page:param name="wizard">true</page:param>

        <tr><td>
            <webwork:iterator value="./multiBulkMoveBean/bulkEditBeans" status="'status'">
                <page:applyDecorator name="jirapanel">
                    <page:param name="title">
                        <strong><webwork:property value="./key/project/string('name')" /></strong> -
                        <webwork:component name="'issuetype'" template="constanticon.jsp">
                          <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                          <webwork:param name="'iconurl'" value="./key/issueType/string('iconurl')" />
                          <webwork:param name="'alt'"><webwork:property value="/nameTranslation(./key/issueType)" /></webwork:param>
                        </webwork:component>
                        <strong><webwork:property value="/nameTranslation(./key/issueType)" /></strong>
                        <a name="<webwork:property value="./key/project/string('id')" /><webwork:property value="./key/issueTypeObject/id" />" />
                    </page:param>
                    <page:param name="instructions">
                        <webwork:text name="'admin.issuemigration.confirmation.summary.of.changes'">
                            <webwork:param name="'value0'"><strong><webwork:property value="./value/selectedIssues/size()" /></strong></webwork:param>
                            <webwork:param name="'value1'"><strong><webwork:property value="./key/project/string('name')" /></strong></webwork:param>
                            <webwork:param name="'value2'"><strong><webwork:property value="/nameTranslation(./key/issueType)" /></strong></webwork:param>
                        </webwork:text>
                    </page:param>

                    <webwork:property value="./value" >
                        <%@include file="/secure/views/bulkedit/confirmationdetails.jsp"%>
                    </webwork:property>
                    <a href="#top" class="backToTop"><webwork:text name="'admin.issuemigration.confirmation.back.to.top'"/></a>
                </page:applyDecorator>
            </webwork:iterator>
        </td></tr>
    </page:applyDecorator>
</body>
</html>
