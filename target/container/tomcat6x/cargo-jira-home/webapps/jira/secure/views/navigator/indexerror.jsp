<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'navigator.index.errors.title'" /></title>
</head>

<body>
    <table cellpadding=1 cellspacing=0 border=0 align=center width=80% bgcolor=#cc0000><tr><td>
	<table cellpadding=4 cellspacing=0 border=0 width=100% bgcolor=#ffffff><tr><td>
		<font color="#cc0000"><b><webwork:text name="'navigator.index.errors.title'"/></b></font>
		<p>
        <webwork:if test="systemAdministrator == true">
            <webwork:text name="'navigator.index.errors.message.admin'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/admin/jira/IndexAdmin.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>            
            <webwork:text name="'navigator.index.errors.message.user'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </webwork:else>        
		</p>
	</td></tr></table>
	</td></tr></table>


</body>
</html>
