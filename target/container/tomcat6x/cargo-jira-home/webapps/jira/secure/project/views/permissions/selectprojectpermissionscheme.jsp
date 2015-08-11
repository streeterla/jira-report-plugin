
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title>Select Permission Scheme</title>
</head>

<body>

<webwork:if test="schemes == null || schemes/size == 0">
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.projects.permissionschemes.shortheading'"/></page:param>
        <page:param name="width">100%</page:param>

        <p>
        <webwork:text name="'admin.projects.permissionschemes.noschemes'"/>
        </p>
        <p>
            <webwork:text name="'admin.projects.permissionschemes.add.new.scheme'">
                <webwork:param name="value0"><a href="<%= request.getContextPath() %>/secure/admin/ViewPermissionSchemes.jspa"></webwork:param>
                <webwork:param name="value1"></a></webwork:param>
            </webwork:text>
        </p>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'admin.projects.permissionschemes.shortheading'"/></page:param>
        <page:param name="description">
            <webwork:text name="'admin.projects.permissionschemes.longheading'"/>
        </page:param>
        <page:param name="width">100%</page:param>
        <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="projectId"/></webwork:url></page:param>
        <page:param name="action">SelectProjectPermissionScheme.jspa</page:param>
        <page:param name="submitId">associate_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.projects.schemes.associate'"/></page:param>

        <ui:select label="/text('admin.projects.schemes.scheme')" name="'schemeIds'" value="schemeIds[0]" list="schemes" listKey="'string('id')'" listValue="'string('name')'" template="selectmap.jsp">
        </ui:select>
        <ui:component name="'projectId'" template="hidden.jsp"/>
	</page:applyDecorator>
</webwork:else>

</body>
</html>
