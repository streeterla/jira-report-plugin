
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.permissions.delete.permission.scheme'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeletePermissionScheme.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI">ViewPermissionSchemes.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.schemes.permissions.delete.permission.scheme'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
	    <page:param name="description">
        <input type="hidden" name="schemeId" value="<webwork:property value="schemeId" />">
        <input type="hidden" name="confirmed" value="true">
        <webwork:if test="errorMessages/size == 0" >
            <p>
            <webwork:text name="'admin.schemes.delete.confirmation'">
                <webwork:param name="'value0'"><u><webwork:property value="name" /></u></webwork:param>
            </webwork:text><br>
            <webwork:if test="description" >
                "<webwork:property value="description" />"
            </webwork:if>
            </p>

            <webwork:if test="projects(scheme)/size > 0" >
                <p><webwork:text name="'admin.schemes.permissions.note'">
                    <webwork:param name="'value0'"><webwork:property value="name" /></webwork:param>
                </webwork:text>
                <webwork:iterator value="projects(scheme)" status="'liststatus'">
                    <a href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" />">
                <webwork:property value="string('name')" /></a><webwork:if test="@liststatus/last == false">, </webwork:if><webwork:else>.</webwork:else>
                </webwork:iterator><br> <br>
                <webwork:text name="'admin.schemes.permissions.if.you.delete.this.scheme'"/></p>
            </webwork:if>
        </webwork:if>
        </page:param>
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
