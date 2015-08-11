<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.externalimport.fogbugz.title'"/></title></head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureFogBugzMapping!chooseFieldMappings.jspa</page:param>
    <page:param name="cancelURI">FogBugzImport!default.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.fogbugz.title.prefix'"/> <webwork:text name="'admin.externalimport.mappings.field'"/></page:param>
    <page:param name="wizard">true</page:param>
	<page:param name="instructions">
        <p><webwork:text name="'admin.externalimport.fogbugz.mappings.field.description'"/></p>
	</page:param>

    <tr>
    <td colspan="2">
    <table class="grid centred">
    <tr>
        <th><webwork:text name="'admin.externalimport.fogbugz.mappings.field.import.field'"/></th>
        <th><webwork:text name="'admin.externalimport.fogbugz.mappings.field.jira.field'"/></th>
    </tr>
    <webwork:iterator value="/bean/fogBugzFieldNames" status="'rowStatus'">
    <tr class="mappingrow">
        <td class="formLabel">
            <span class="mappingname"><webwork:property value="." /></span>
        </td>
        <td>
            <select id="<webwork:property value="." />"
                    name="<webwork:property value="." />"
                    class="importField"
                    >
                <option value="">None</option>
                <webwork:iterator value="/bean/availableFieldMappings" status="'rowStatus'">
                <optgroup label="<webwork:property value="./key" />" >
                <webwork:iterator value="./value" >
                    <option value="<webwork:property value="./id" />" <webwork:if test="/bean/selectedFieldMapping(../.., ./id) == true">selected="selected"</webwork:if>>
                        <webwork:property value="./name" />
                    </option>
                </webwork:iterator>
                </optgroup>
                </webwork:iterator>
            </select>
        </td>
    </tr>

    </webwork:iterator>
    </table>
    </td>
    </tr>

</page:applyDecorator>

</body>
</html>
