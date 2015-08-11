<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.csv.configure.csv.importer'"/></title>
</head>
<body>

<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureCsvMapping!start.jspa</page:param>
    <page:param name="cancelURI">CsvImporter!default.jspa</page:param>
    <page:param name="submitId">externalimport_submit</page:param>
    <page:param name="submitName"><webwork:text name="'admin.externalimport.start.wizard'"/></page:param>
    <page:param name="autoSelectFirst">true</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.csv.import.wizard.setup'"/></page:param>
    <page:param name="width">100%</page:param>
	<page:param name="instructions">
        <webwork:text name="'admin.externalimport.csv.import.wizard.instruction'">
            <webwork:param name="'value0'"><strong></webwork:param>
            <webwork:param name="'value1'"></strong></webwork:param>
        </webwork:text>
    </page:param>

    <ui:textfield label="text('admin.externalimport.csv.import.file.location')" name="'importLocation'">
		<ui:param name="'size'">50</ui:param>
		<ui:param name="'description'"><webwork:text name="'admin.externalimport.csv.import.file.location.description'"/></ui:param>
		<ui:param name="'mandatory'">true</ui:param>
	</ui:textfield>

    <ui:textfield label="text('admin.externalimport.existing.configuration.file')" name="'configFileLocation'">
		<ui:param name="'size'">50</ui:param>
		<ui:param name="'description'"><webwork:text name="'admin.externalimport.existing.configuration.file.description2'"/></ui:param>
	</ui:textfield>

    <ui:textfield label="text('admin.externalimport.csv.delimiter')" name="'delimiter'">
		<ui:param name="'size'">3</ui:param>
		<ui:param name="'maxlength'">2</ui:param>
		<ui:param name="'description'"><webwork:text name="'admin.externalimport.csv.delimiter.description'"/></ui:param>
	</ui:textfield>

</page:applyDecorator>


</body>
</html>
