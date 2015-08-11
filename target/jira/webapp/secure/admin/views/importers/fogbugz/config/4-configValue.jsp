<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.externalimport.fogbugz.title'"/></title></head>
<body>
<style type="text/css">
<!--
.formLabel
{
    width: 30%;
}

.fieldValueArea INPUT, .fieldValueArea SELECT
{
    width: 95%;
}
-->
</style>
<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureFogBugzMapping!chooseValueMappings.jspa</page:param>
    <page:param name="cancelURI">FogBugzImport!default.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.fogbugz.title.prefix'"/> <webwork:text name="'admin.externalimport.mappings.value'"/></page:param>
    <page:param name="wizard">true</page:param>
	<page:param name="instructions">
        <p>
       <webwork:text name="'admin.externalimport.unique.values.displayed'">
           <webwork:param name="'value0'"><em></webwork:param>
           <webwork:param name="'value1'"></em></webwork:param>
           <webwork:param name="'value2'"><strong><webwork:property value="'<<blank>>'" /></strong></webwork:param>
       </webwork:text>
        </p>
	</page:param>

    <tr>
    <td colspan="2">
    <webwork:if test="/bean/valueMappingHelper/fieldsForValueMapping && /bean/valueMappingHelper/fieldsForValueMapping/empty == false">
    <table class="grid centred maxWidth">
    <tr>
        <th><webwork:text name="'admin.externalimport.fogbugz.mappings.field.import.field'"/></th>
        <th><webwork:text name="'admin.externalimport.map.field.value'"/></th>
    </tr>
    <webwork:iterator value="/bean/valueMappingHelper/fieldsForValueMapping" status="'rowStatus'">
    <tr>
        <td class="formLabel">
            <webwork:property value="." />
        </td>
        <td>
            <table class="grid maxWidth mappingTable">
            <tr>
                <th class="fieldLabelArea"><webwork:text name="'admin.externalimport.value.in.importer'"/></th>
                <th class="fieldValueArea"><webwork:text name="'admin.externalimport.target.value'"/></th>
            </tr>
            <webwork:iterator value="/bean/valueMappingHelper/distinctValuesForField(.)">
                <webwork:if test="/bean/valueMappingHelper/jiraField(..)/issueConstants">
                    <ui:select label="." name="/bean/valueMappingHelper/valueMappingFieldName(..,.)"
                               list="/bean/valueMappingHelper/jiraField(..)/issueConstants" listKey="'name'" listValue="'name'"
                               template="selectWithTextArea.jsp"
                               value="/bean/valueMappingHelper/valueMapping(..,.)">
                        <ui:param name="'headerrow'" value="text('admin.externalimport.values.nomapping')" />
                        <ui:param name="'headervalue'" value="''" />
                        <ui:param name="'headerrow2'" value="text('admin.externalimport.values.importasblank')" />
                        <ui:param name="'headervalue2'" value="'<<blank>>'" />
                        <ui:param name="'optionIcon'">iconUrl</ui:param>
                    </ui:select>
                </webwork:if>
                <webwork:else>
                    <ui:textfield label="." name="/bean/valueMappingHelper/valueMappingFieldName(..,.)"
                                  value="/bean/valueMappingHelper/valueMapping(..,.)" >
                        <ui:param name="'extrahtml'"><webwork:property value="/bean/valueMappingHelper/jiraField(..)/id" /></ui:param>
                    </ui:textfield>
                </webwork:else>
            </webwork:iterator>
            </table>
        </td>
    </tr>

    </webwork:iterator>
    </table>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'admin.externalimport.value.no.fields'" />            
    </webwork:else>
    </td>
    </tr>

</page:applyDecorator>

</body>
</html>
