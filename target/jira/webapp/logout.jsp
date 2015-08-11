<%@ page import="com.atlassian.jira.web.exception.InvalidDirectJspCallException" %>
<%@ page import="webwork.action.ActionContext" %>
<%@ taglib uri="webwork" prefix="webwork" %>

<%
    if (ActionContext.getValueStack().findValue("/") == null)
    {
        throw new InvalidDirectJspCallException("Calling logout.jsp directly. This is no longer supported.", "logout.jsp");
    }
%>

<html>
<head>
	<title><webwork:text name="'logout.title'"/></title>
</head>
<body>
    <h2><webwork:text name="'logout.title'"/></h2>
    <p>
        <webwork:text name="'logout.desc.line1'"/>
    </p>
    <p>
        <webwork:text name="'logout.desc.line2'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
    </p>
</body>
</html>
