<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.csvimport.configure.csv.importer'"/></title></head>
<body>

<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureCsvMapping.jspa</page:param>
    <page:param name="cancelURI">CsvImporter!default.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.csvimport.wizard'"/>: <webwork:text name="'admin.csvimport.save.config.file'"/></page:param>
    <page:param name="wizard">true</page:param>
    <page:param name="finishButton"><webwork:text name="'admin.csvimport.save.config.file'"/></page:param>
	<page:param name="instructions">
        <webwork:text name="'admin.csvimport.saved.config.file'"/>
	</page:param>
	<page:param name="buttons">
        <input id="saveImportButton"  type="submit" name="submitBtn" value="<webwork:text name="'admin.csvimport.import.without.saving'"/>" accesskey="I" />
	</page:param>

    <ui:textfield label="text('admin.externalimport.file.location')" name="'configFileLocation'" value="/bean/configFileLocation" >
		<ui:param name="'size'">50</ui:param>
		<ui:param name="'description'"><webwork:text name="'admin.externalimport.file.location.description'"/></ui:param>
	</ui:textfield>

    <ui:component name="'importLocation'" value="/bean/importLocation" template="hidden.jsp" theme="'single'"  />


</page:applyDecorator>

<pre class="codearea">
<h4><webwork:text name="'admin.csvimport.preview'"/></h4>
<webwork:property value="/bean/configFileText" />
</pre>

</body>
</html>
