<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.externalimport.fogbugz.title'"/></title></head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureFogBugzMapping!chooseFieldForValueMappings.jspa</page:param>
    <page:param name="cancelURI">FogBugzImport!default.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.fogbugz.title.prefix'"/> <webwork:text name="'admin.externalimport.mappings.value'"/></page:param>
    <page:param name="wizard">true</page:param>
	<page:param name="instructions">
        <p><webwork:text name="'admin.externalimport.fogbugz.mappings.value.description'"/></p>
	</page:param>

    <tr>
    <td colspan="2">
    <table class="grid centred">
    <tr>
        <th><webwork:text name="'admin.externalimport.fogbugz.mappings.field.import.field'"/></th>
        <th class="fullyCentered"><webwork:text name="'admin.externalimport.fogbugz.mappings.value.field.count'"/></th>
        <th class="fullyCentered"><webwork:text name="'admin.externalimport.map.field.value'"/></th>
    </tr>
    <webwork:iterator value="/bean/valueMappingHelper/availableFields" status="'rowStatus'">
    <tr class="mappingrow">
        <td class="formLabel">
            <span class="mappingname"><webwork:property value="./name" /></span>
            <br/>
            <span class="subText"><webwork:property value="./description" /></span>
        </td>
        <td class="fullyCentered">
            <webwork:property value="/bean/valueMappingHelper/valueCountForField(./name)" >
                <webwork:if test=".">
                    <webwork:property value="." />
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'common.words.unknown'" />
                </webwork:else>
            </webwork:property>
        </td>
        <td class="fullyCentered">
            <ui:checkbox label="''" theme="'single'"
                         name="./name" fieldValue="'true'">
                <webwork:if test="/bean/valueMappingHelper/mapValueForField(./name) == true">
                    <ui:param name="'checked'">true</ui:param>
                </webwork:if>
            </ui:checkbox>
        </td>
    </tr>

    </webwork:iterator>
    </table>
    </td>
    </tr>

</page:applyDecorator>

</body>
</html>
