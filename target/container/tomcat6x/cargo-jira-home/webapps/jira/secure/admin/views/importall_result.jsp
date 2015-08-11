<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.jira.security.login.LoginManager" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<%
    ComponentManager.getComponentInstanceOfType(LoginManager.class).logout(request, response);
%>

<html>
<head>
	<title><webwork:text name="'admin.import.import.project.data'"/></title>
</head>

<body>


<jsp:include page="/secure/admin/fixes/pathwarnings.jsp"/>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.import.import.jira.data'"/></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="description">
	<webwork:text name="'admin.import.note'">
	    <webwork:param name="'value0'"><font color=#990000></webwork:param>
	    <webwork:param name="'value1'"></font></webwork:param>
	</webwork:text>
	</page:param>

	<tr>
	<td bgcolor=#ffffff colspan=2>
		<p>
		<webwork:text name="'admin.import.successful.import'"/>
		</p>

        <p>
        <webwork:text name="'admin.import.logged.out'"/>
	    </p>

		<p>
		<a id="login" href="<%= request.getContextPath() %>/secure/"><webwork:text name="'admin.common.phrases.log.in.again'"/></a>.
		</p>
	</td>
	</tr>
 </page:applyDecorator>

</body>
</html>
