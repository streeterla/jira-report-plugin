<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.externalimport.fogbugz.title'"/></title></head>
<body>

<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureFogBugzMapping.jspa</page:param>
    <page:param name="cancelURI">FogBugzImport!default.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.fogbugz.title.prefix'"/> <webwork:text name="'admin.externalimport.mappings.save'"/></page:param>
    <page:param name="wizard">true</page:param>
    <page:param name="finishButton"><webwork:text name="'admin.externalimport.mappings.save'"/></page:param>
	<page:param name="instructions">
        <webwork:text name="'admin.externalimport.mappings.save.description'"/>
	</page:param>
	<page:param name="buttons">
        <input id="saveImportButton"  type="submit" name="submitBtn" value="<webwork:text name="'admin.externalimport.mappings.import.nosave'"/>" accesskey="I" />
	</page:param>

    <ui:component template="multihidden.jsp" >
        <ui:param name="'fields'">connectionBean/url,connectionBean/username,connectionBean/password,connectionBean/driverName</ui:param>
    </ui:component>


    <ui:textfield label="text('admin.externalimport.file.location')" name="'configFileLocation'" value="/bean/configFileLocation" >
		<ui:param name="'size'">50</ui:param>
		<ui:param name="'description'"><webwork:text name="'admin.externalimport.mappings.save.location'"/></ui:param>
	</ui:textfield>

</page:applyDecorator>

<pre class="codearea">
<h4><webwork:text name="'admin.externalimport.mappings.save.preview'"/></h4>
<webwork:property value="/bean/configFileText" />
</pre>

</body>
</html>
