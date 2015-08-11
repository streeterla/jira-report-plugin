<%@ page import="com.opensymphony.user.User" %>
<%@ page import="com.atlassian.seraph.auth.DefaultAuthenticator" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<%
    boolean showLogin = true;
    HttpSession httpSession = request.getSession(false);
    if (httpSession != null)
    {
        User remoteUser = (User) httpSession.getAttribute(DefaultAuthenticator.LOGGED_IN_KEY);
        showLogin = remoteUser == null;
    }
    request.setAttribute("showLogin", showLogin);
%>

<html>
<head>
	<title><webwork:text name="'access.denied.title'"/></title>
</head>

<body class="lp">

<div class="module xsrf">
    <div class="mod-header">
        <h3><webwork:text name="'access.denied.title'"/></h3>
    </div>
    <div class="mod-content">
        <div class="notify warn">
            <%--<span style="color:#cc0000;font-weight:bold;"><webwork:text name="'access.denied.title'"/></span>--%>
            <p>
            <webwork:text name="'perm.violation.desc'"/>
            </p>
            <webwork:if test="@showLogin == true">
                <p>
                    <webwork:text name="'login.required.desc2'">
                        <webwork:param name="'value0'"><jira:loginlink><webwork:text name="'login.required.login'"/></jira:loginlink></webwork:param>
                    </webwork:text>.
                </p>
            </webwork:if>
            <p>
            <webwork:text name="'contact.admin.for.perm'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
            </p>
        </div>
    </div>
</div>

</body>
</html>
