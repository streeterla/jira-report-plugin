
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'setup.title'"/></title>
</head>

<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'setup.complete'"/></page:param>

	<tr>
		<td bgcolor=#ffffff>&nbsp;</td>
		<td bgcolor=#ffffff>
			<p>
			<webwork:text name="'setup.complete.msg'"/>
			</p>

			<p>
            <webwork:text name="'setup.complete.youcanlogin'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
			</p>
		</td>
	</tr>

</page:applyDecorator>

</body>
</html>
