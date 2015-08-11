<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<html>
<head>
	<title><webwork:text name="'admin.projects.edit.project'"/>: <webwork:property value="project/string('name')" /></title>

    <%
        WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
        webResourceManager.requireResource("jira.webresources:autocomplete");
        webResourceManager.requireResource("jira.webresources:avatarpicker");
    %>

</head>
<body>

<fieldset class="hidden parameters">
    <input type="hidden" id="uploadImage" value="<webwork:text name="'avatarpicker.upload.image'"/>">
</fieldset>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.projects.edit.project'"/>: <webwork:property value="project/string('name')" /></page:param>
	<page:param name="width">100%</page:param>
    <page:param name="description"><webwork:text name="'admin.projects.edit.project.caption'"/></page:param>
	<page:param name="action">EditProject.jspa</page:param>
	<page:param name="submitId">update_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
	<page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="project/long('id')" /></webwork:url></page:param>



    <ui:textfield label="/text('common.words.name')" name="'name'" size="'50'" maxlength="255">
        <ui:param name="'mandatory'" value="'true'" />
    </ui:textfield>

	<ui:textfield label="/text('common.concepts.url')" name="'url'" size="'50'" maxlength="255"/>

    <ui:component label="/text('common.concepts.project.avatar')" name="'avatarId'" template="image.jsp">
        <ui:param name="'linkid'">project_avatar_link</ui:param>
        <ui:param name="'id'">project_avatar_image</ui:param>
        <ui:param name="'hiddenid'">project_avatar_id</ui:param>
        <ui:param name="'url'"><%= request.getContextPath() %>/secure/project/AvatarPicker!default.jspa?pid=<webwork:property value="/pid" />&avatarField=project_avatar_id&avatarImage=project_avatar_image&remove=remove</ui:param>
        <ui:param name="'src'"><webwork:property value="/avatarUrl" /></ui:param>
        <ui:param name="'width'">48</ui:param>
        <ui:param name="'height'">48</ui:param>
        <ui:param name="'textid'">remove</ui:param>
        <ui:param name="'title'"><webwork:text name="'admin.projects.edit.avatar.click.to.edit'"/></ui:param>
        <ui:param name="'mandatory'">true</ui:param>
        <ui:param name="'description'"><webwork:text name="'admin.projects.edit.avatar'"/></ui:param>
    </ui:component>

    <ui:component label="/text('common.concepts.projectlead')" name="'lead'" template="userselect.jsp">
        <ui:param name="'formname'" value="'jiraform'" />
        <ui:param name="'projectId'" value="project/long('id')" />
        <ui:param name="'size'">50</ui:param>
        <ui:param name="'userMode'" value="'1'"/>
        <ui:param name="'description'" value="text('admin.addproject.project.lead.description')"/>
        <ui:param name="'mandatory'" value="'true'" />
    </ui:component>

    <jsp:include page="/includes/admin/project/defaultassignee.jsp"/>

	<ui:textarea label="text('common.words.description')" name="'description'" rows="5" cols="40">
		<ui:param name="'description'">
			<webwork:text name="'admin.addproject.description.description'">
			    <webwork:param name="'value0'"><br></webwork:param>
			</webwork:text>
		</ui:param>
	</ui:textarea>

    <ui:component name="'pid'" template="hidden.jsp" />
</page:applyDecorator>
</body>
</html>
