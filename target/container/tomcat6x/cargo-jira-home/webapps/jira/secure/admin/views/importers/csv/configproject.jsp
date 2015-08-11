<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.csvimport.configure.csv.importer'"/></title></head>
<body>
<script language="JavaScript" src="<%= request.getContextPath() %>/includes/js/import.js"></script>
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
    <page:param name="title"><webwork:text name="'admin.csvimport.wizard'"/>: <webwork:text name="'admin.csvimport.project.configuration'"/></page:param>
    <page:param name="wizard">true</page:param>
	<page:param name="instructions">
        <webwork:text name="'admin.csvimport.choose.project'"/>
	</page:param>

    <ui:radio label="text('admin.csvimport.select.how')"
              name="'/bean/selectedProjectOption'"
              list="/projectOptions">
        <ui:param name="'onclick'" value="'return handleProjectDisplay();'" />
    </ui:radio>

    <ui:select label="text('admin.csvimport.select.existing.project')" name="'existingprojectkey'"
               list="/projects" value="/bean/value('existingprojectkey')"
               listKey="'string('key')'" listValue="'string('name')'"
               template="selectmap.jsp">
        <ui:param name="'rowClass'" value="'importexistingproject'" />
        <ui:param name="'summary'" value="'string('description')'" />
        <ui:param name="'class'" value="'projectInput'" />
    </ui:select>

    <ui:textfield label="text('admin.csvimport.project.name')" name="'project.name'" value="/bean/value('project.name')" >
        <ui:param name="'rowClass'" value="'importsingleproject'" />
        <ui:param name="'class'" value="'projectInput'" />
        <ui:param name="'mandatory'" value="'true'" />
    </ui:textfield>

    <ui:textfield label="text('admin.csvimport.project.key')" name="'project.key'" value="/bean/value('project.key')" >
        <ui:param name="'rowClass'" value="'importsingleproject'" />
        <ui:param name="'class'" value="'projectInput'" />
        <ui:param name="'mandatory'" value="'true'" />
    </ui:textfield>

    <ui:component label="text('common.concepts.projectlead')" name="'project.lead'" template="userselect.jsp"
                  value="/bean/value('project.lead')">
        <ui:param name="'formname'" value="'jiraform'" />
        <ui:param name="'rowClass'" value="'importsingleproject'" />
        <ui:param name="'userMode'" value="'1'"/>
        <ui:param name="'mandatory'" value="'true'" />
        <ui:param name="'class'" value="'projectInput'" />
    </ui:component>

    <ui:textfield label="text('admin.csvimport.project.description')" name="'project.description'" value="/bean/value('project.description')"  >
        <ui:param name="'rowClass'" value="'importsingleproject'" />
        <ui:param name="'class'" value="'projectInput'" />
    </ui:textfield>

    <ui:textfield label="text('admin.csvimport.project.url')" name="'project.url'" value="/bean/value('project.url')"  >
        <ui:param name="'rowClass'" value="'importsingleproject'" />
        <ui:param name="'class'" value="'projectInput'" />
    </ui:textfield>

</page:applyDecorator>

    <script language="JavaScript">
    <!--
        handleProjectDisplay();
    //-->
    </script>

</body>
</html>
