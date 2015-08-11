<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.externalimport.csv.configure.csv.importer'"/></title></head>
<body>
<style type="text/css">
<!--
.fieldLabelArea
{
    width: 30%;
}

.projectInput
{
    width: 18em;
}
-->
</style>
<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureCsvMapping.jspa</page:param>
    <page:param name="cancelURI">CsvImporter!default.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.csvimport.wizard'"/>: <webwork:text name="'admin.common.words.misc'"/></page:param>
    <page:param name="wizard">true</page:param>
	<page:param name="instructions">
        <webwork:text name="'admin.csvimport.extra.information'"/>
	</page:param>

    <ui:textfield label="text('admin.csvimport.email.suffix')" name="'user.email.suffix'" value="/bean/value('user.email.suffix')" >
        <ui:param name="'description'"><webwork:text name="'admin.csvimport.email.suffix.description'"/></ui:param>
    </ui:textfield>

    <webwork:if test="/bean/dateFields/size > 0">
    <ui:textfield label="text('admin.csvimport.date.format.import.file')" name="'date.import.format'" value="/bean/value('date.import.format')" >
		<ui:param name="'description'"><webwork:text name="'admin.csvimport.date.formats'">
		    <webwork:param name="'value0'"><br /></webwork:param>
		    <webwork:param name="'value1'"><a href="http://java.sun.com/j2se/1.3/docs/api/java/text/SimpleDateFormat.html" title="<webwork:text name="'admin.csvimport.sun.java.api'"/>" target="_new"></webwork:param>
		    <webwork:param name="'value2'"></a></webwork:param>
		    <webwork:param name="'value3'">dd/MM/yyyy</webwork:param>
		</webwork:text></ui:param>
    </ui:textfield>
    </webwork:if>
</page:applyDecorator>

</body>
</html>
