<%@ page import="com.atlassian.jira.ComponentManager,
                 com.atlassian.plugin.webresource.WebResourceManager"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.addproject.create.new.project'"/></title>
    <%
        WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
        webResourceManager.requireResource("jira.webresources:avatarpicker");
    %>
</head>
<body>

<fieldset class="hidden parameters">
    <input type="hidden" id="uploadImage" value="<webwork:text name="'avatarpicker.upload.image'"/>">
</fieldset>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.addproject.add.a.new.project'"/></page:param>
	<page:param name="width">100%</page:param>
    <page:param name="description"><webwork:text name="'admin.addproject.enter.your.new.project.details'"/></page:param>
	<page:param name="action">AddProject.jspa</page:param>
	<page:param name="submitId">add_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
	<page:param name="cancelURI">default.jsp</page:param>
    <page:param name="helpURL">project_management</page:param>

	<ui:textfield label="text('common.words.name')" name="'name'" maxlength="255">
        <ui:param name="'mandatory'" value="true" />
    </ui:textfield>

	<ui:textfield label="text('common.concepts.key')" name="'key'" maxlength="255">
		<ui:param name="'description'">
			<webwork:text name="'admin.addproject.key.description'">
                <webwork:param name="'value0'"><br></webwork:param>
            </webwork:text><br>
            <webwork:property value="projectKeyDescription" escape="false" />
		</ui:param>
        <ui:param name="'mandatory'" value="true" />
	</ui:textfield>

	<ui:textfield label="text('common.concepts.url')" name="'url'" maxlength="255">
        <ui:param name="'description'">
			<webwork:text name="'admin.addproject.url.description'"/>
		</ui:param>
    </ui:textfield>

    <ui:component label="/text('common.concepts.project.avatar')" name="'avatarId'" template="image.jsp">
        <ui:param name="'linkid'">project_avatar_link</ui:param>
        <ui:param name="'id'">project_avatar_image</ui:param>
        <ui:param name="'hiddenid'">project_avatar_id</ui:param>
        <ui:param name="'url'"><%= request.getContextPath() %>/secure/project/AvatarPicker!default.jspa?avatarField=project_avatar_id&avatarImage=project_avatar_image&remove=remove</ui:param>
        <ui:param name="'src'"><webwork:property value="/avatarUrl" /></ui:param>
        <ui:param name="'width'">48</ui:param>
        <ui:param name="'height'">48</ui:param>
        <ui:param name="'textid'">remove</ui:param>
        <ui:param name="'title'"><webwork:text name="'admin.projects.edit.avatar.click.to.edit'"/></ui:param>
        <ui:param name="'mandatory'">true</ui:param>
        <ui:param name="'description'"><webwork:text name="'admin.projects.edit.avatar'"/></ui:param>
    </ui:component>

    <ui:component label="text('common.concepts.projectlead')" name="'lead'" template="userselect.jsp">
        <ui:param name="'formname'" value="'jiraform'" />
        <ui:param name="'description'"><webwork:text name="'admin.addproject.project.lead.description'"/></ui:param>
        <ui:param name="'mandatory'" value="true" />
    </ui:component>

    <jsp:include page="/includes/admin/project/defaultassignee.jsp"/>

	<ui:textarea label="text('common.words.description')" name="'description'" rows="5" cols="40">
		<ui:param name="'description'">
			<webwork:text name="'admin.addproject.description.description'">
			    <webwork:param name="'value0'"><br></webwork:param>
			</webwork:text>
        </ui:param>
	</ui:textarea>

	<ui:select label="text('admin.projects.notification.scheme')" name="'notificationScheme'" list="notificationSchemes" listKey="'string('id')'" listValue="'string('name')'">
		<ui:param name="'headerrow'" value="text('common.words.none')" />
		<ui:param name="'headervalue'" value="-1" />
		<ui:param name="'description'">
			<webwork:text name="'admin.addproject.notification.scheme.description'"/><br>
		</ui:param>
	</ui:select>

	<ui:select label="text('admin.projects.permission.scheme')" name="'permissionScheme'" list="permissionSchemes" listKey="'string('id')'" listValue="'string('name')'" value="0">
		<ui:param name="'description'">
	        <webwork:text name="'admin.addproject.permission.scheme.description'"/>
		</ui:param>
        <ui:param name="'mandatory'" value="true" />
 	</ui:select>

    <ui:select label="text('admin.projects.issue.security.scheme')" name="'issueSecurityScheme'" list="issueSecuritySchemes" listKey="'string('id')'" listValue="'string('name')'">
        <ui:param name="'headerrow'" value="text('common.words.none')" />
        <ui:param name="'headervalue'" value="-1" />
        <ui:param name="'description'">
             <webwork:text name="'admin.addproject.issue.security.scheme.description'"/>
        </ui:param>
    </ui:select>
</page:applyDecorator>
</body>
</html>
