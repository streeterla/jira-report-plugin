<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.csv.import'"/></title>
</head>
<body>
<script language="JavaScript" type="text/javascript">
<!--
    function forwardPage()
    {
        try
        {
            var importLocation = document.jiraform.importLocation.value;
            var configFileLocation = document.jiraform.configFileLocation.value;

            var params = []
            if (importLocation)
            {
                params.push("importLocation=" + encodeURIComponent(importLocation));
            }

            if (configFileLocation)
            {
                params.push("configFileLocation=" + encodeURIComponent(configFileLocation));
            }
            var p = params.join("&")

            location.href = "ConfigureCsvMapping!default.jspa" + (p ? "?" + p : "")
            return false;
        }
        catch(e)
        {
           // Non critical error
           return true;
        }
    }
//-->
</script>


<page:applyDecorator name="jiraform">
    <page:param name="action">CsvImporter!settings.jspa</page:param>
    <page:param name="cancelURI"><webwork:url value="'/secure/admin/views/ExternalImport.jspa'" /></page:param>
    <page:param name="submitId">import_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.import'"/></page:param>
    <page:param name="autoSelectFirst">true</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.csv.import'"/></page:param>
    <page:param name="width">100%</page:param>
	<page:param name="instructions">
        <webwork:text name="'admin.externalimport.csv.import.instruction'">
            <webwork:param name="'value0'"><b></webwork:param>
            <webwork:param name="'value1'"></b></webwork:param>
            <webwork:param name="'value2'"><strong><a id="csv_forward" href="ConfigureCsvMapping!default.jspa" onclick="return forwardPage();"></webwork:param>
            <webwork:param name="'value3'"></a></strong></webwork:param>
        </webwork:text><br />
        <webwork:text name="'admin.externalimport.csv.wizard'"/>
    </page:param>

    <ui:textfield label="text('admin.externalimport.csv.import.file.location')" name="'importLocation'">
		<ui:param name="'size'">50</ui:param>
		<ui:param name="'description'"><webwork:text name="'admin.externalimport.csv.import.file.location.description'"/></ui:param>
		<ui:param name="'mandatory'">true</ui:param>
	</ui:textfield>

    <ui:textfield label="text('admin.externalimport.existing.configuration.file')" name="'configFileLocation'">
		<ui:param name="'size'">50</ui:param>
		<ui:param name="'description'"><webwork:text name="'admin.externalimport.existing.configuration.file.description'">
		    <webwork:param name="'value0'"><b><a href="ConfigureCsvMapping!default.jspa" onclick="return forwardPage();"></webwork:param>
		    <webwork:param name="'value1'"></a></b></webwork:param>
		</webwork:text></ui:param>
		<ui:param name="'mandatory'">true</ui:param>
	</ui:textfield>

</page:applyDecorator>


</body>
</html>
