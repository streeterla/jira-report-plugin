<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'illegal.workflow.title'"/></title>
</head>

<body>

	<table cellpadding=1 cellspacing=0 border=0 align=center width=80% bgcolor=#cc0000><tr><td>
	<table cellpadding="4" cellspacing="0" border="0" width="100%" class="formErrors"><tr><td>
		<font color="#cc0000"><b><webwork:text name="'error'"/></b></font>
		<p>
		<webwork:text name="'illegal.workflow.desc'"/>
		</p>
		<p>
		<webwork:text name="'contact.admin.for.perm'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
		</p>

	<%-- formwide error messages --%>
	<webwork:if test="hasErrorMessages == 'true'">
    <p>
			<font color=#cc0000><b><webwork:text name="'form.errors'"/></b>:</font>
			<webwork:iterator value="errorMessages">
			<li><webwork:property /></li>
			</webwork:iterator>
    </p>
	</webwork:if>

	</td></tr></table>
	</td></tr></table>

</body>
</html>
