
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.deleteproject.delete.project'"/>: <webwork:property value="project/string('name')" /></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.deleteproject.delete.project'"/>: <webwork:property value="project/string('name')" /></page:param>
	<page:param name="description">
		<p><webwork:text name="'admin.deleteproject.confirmation'"/></p>
		<p><font color=#cc0000>
            <webwork:if test="/systemAdministrator == true">
                <webwork:text name="'admin.deleteproject.warning'">
                    <webwork:param name="'value0'"><a href="XmlBackup!default.jspa"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.deleteproject.warning.admin'">
                    <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </webwork:else>
        </font></p>
	</page:param>

	<page:param name="width">100%</page:param>
	<page:param name="action">DeleteProject.jspa</page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="project/long('id')"/></webwork:url></page:param>
	<page:param name="autoSelectFirst">false</page:param>

	<ui:component name="'pid'" template="hidden.jsp" />
	<input type="hidden" name="confirm" value="true">
</page:applyDecorator>

</body>
</html>
