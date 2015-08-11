<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'releasenotes.configure'" /></title>
</head>
<body>
	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'releasenotes.configure'"/></page:param>
		<page:param name="description"><webwork:text name="'releasenotes.configure.desc'"/></page:param>
        <page:param name="cancelURI">BrowseProject.jspa</page:param>
		<page:param name="action">ReleaseNote.jspa</page:param>
		<page:param name="submitId">create_submit</page:param>
		<page:param name="submitName"><webwork:text name="'releasenotes.create'"/></page:param>
        <page:param name="method">get</page:param>

        <ui:select label="text('releasenotes.versions')" name="'version'" list="versions" listKey="'key'" listValue="'value'" >
            <ui:param name="'headerrow'"><webwork:text name="'releasenotes.versions'"/></ui:param>
            <ui:param name="'headervalue'" value="'-1'" />
            <ui:param name="'mandatory'" value="true"/>
        </ui:select>

		<ui:select label="text('releasenotes.styles')" name="'styleName'" list="styleNames" listKey="'.'" listValue="'.'">
            <ui:param name="'headerrow'"><webwork:text name="'releasenotes.styles'"/></ui:param>
            <ui:param name="'headervalue'" value="''" />
            <ui:param name="'mandatory'" value="true"/>
		</ui:select>

        <input type="hidden" name="projectId" value="<webwork:property value="projectId"/>" >
	</page:applyDecorator>
</body>
</html>
