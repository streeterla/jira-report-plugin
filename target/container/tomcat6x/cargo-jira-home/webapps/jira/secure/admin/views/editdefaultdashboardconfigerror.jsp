<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<html>
	<head>
		<title><webwork:property value="applicationTitle" /></title>
	</head>
	<body>

    <table cellpadding=1 cellspacing=0 border=0 align=center width=80% bgcolor=#cc0000><tr><td>
	<table cellpadding="4" cellspacing="0" border="0" width="100%" class="formErrors"><tr><td>
		<font color="#cc0000"><b><webwork:text name="'error'"/></b><br/></font>
        <webwork:if test="/errorMessages && /errorMessages/empty == false">
            <webwork:iterator value="/errorMessages">
                <p><webwork:property value="."/></p>
            </webwork:iterator>
        </webwork:if>
        <webwork:if test="remoteUser == null">
            <webwork:text name="'dashboard.page.login'">
                <webwork:param name="'value0'"><jira:loginlink><webwork:text name="'login.required.login'"/></jira:loginlink></webwork:param>
            </webwork:text>
        </webwork:if>

        <p>
		<webwork:text name="'contact.admin.for.perm'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
		</p>
	</td></tr></table>
	</td></tr></table>

	</body>
</html>
