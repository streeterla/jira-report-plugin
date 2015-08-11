<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.externalimport.fogbugz.title'"/></title></head>
<body>
<style>
    .jiraform SELECT
    {
        width: 100%;
    }
</style>
<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureFogBugzMapping!chooseProjectKeyMappings.jspa</page:param>
    <page:param name="cancelURI">FogBugzImport!default.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.fogbugz.title.prefix'"/> <webwork:text name="'admin.externalimport.fogbugz.mappings.project'"/></page:param>
    <page:param name="wizard">true</page:param>
	<page:param name="instructions">
        <p><webwork:text name="'admin.externalimport.fogbugz.mappings.project.description'"/></p>
	</page:param>

    <tr>
    <td colspan="2">
    <table class="grid centred">
    <tr>
        <th><webwork:text name="'admin.externalimport.fogbugz.mappings.fogbugz.project.name'"/></th>
        <webwork:if test="/enterprise == true">
            <th><webwork:text name="'admin.projects.project.category'"/></th>
        </webwork:if>
        <th><webwork:text name="'admin.externalimport.fogbugz.mappings.target.project.key'"/></th>
    </tr>
    <webwork:iterator value="/bean/fogBugzProjectNames" status="'rowStatus'">
        <tr class="mappingrow">
            <td class="formLabel">
                <span class="mappingname"><webwork:property value="." /></span>
            </td>
            <webwork:if test="/enterprise == true">
                <td>
                <ui:select label="''" name="/bean/projectCategoryFieldName(.)"
                           list="/bean/projectCategories" listKey="'string('name')'" listValue="'string('name')'"
                           template="selectWithTextArea.jsp"
                           theme="'single'"
                           value="/bean/projectCategory(.)">
                    <ui:param name="'headerrow'" value="text('common.words.none')" />
                    <ui:param name="'headervalue'" value="''" />
                </ui:select>
                </td>
            </webwork:if>

            <ui:textfield label="''" theme="'single'"
                          name="."
                          value="/bean/projectKey(.)" >
                <ui:param name="'title'" value="text('admin.externalimport.fogbugz.mappings.project.key.description')" />
            </ui:textfield>
        </tr>
    </webwork:iterator>
    </table>
    </td>
    </tr>

</page:applyDecorator>

</body>
</html>
