<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.csvimport.configure.csv.importer'"/></title></head>
<body>
<script language="JavaScript" src="<%= request.getContextPath() %>/includes/js/import.js"></script>
<style type="text/css">
<!--
.selectDescription
{
    display: block;
}

.grid
{
}
-->
</style>
<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureCsvMapping.jspa</page:param>
    <page:param name="cancelURI">CsvImporter!default.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.csvimport.wizard'"/>: <webwork:text name="'admin.csvimport.issue.field.mappings'"/></page:param>
    <page:param name="wizard">true</page:param>
	<page:param name="instructions">
        <p>
        <webwork:text name="'admin.csvimport.below.are.the.columns'">
            <webwork:param name="'value0'"><em></webwork:param>
            <webwork:param name="'value1'"></em></webwork:param>
        </webwork:text>
        </p>
        <p>
        <webwork:text name="'admin.csvimport.check.the.map.field.value.box'">
            <webwork:param name="'value0'"><strong></webwork:param>
            <webwork:param name="'value1'"></strong></webwork:param>
            <webwork:param name="'value2'"><strong></webwork:param>
            <webwork:param name="'value3'"></strong></webwork:param>
        </webwork:text>
        </p>
        <p><webwork:text name="'admin.csvimport.note.on.validations'">
            <webwork:param name="'value0'"><strong></webwork:param>
            <webwork:param name="'value1'"></strong></webwork:param>
            <webwork:param name="'value2'"><strong></webwork:param>
            <webwork:param name="'value3'"></strong></webwork:param>
        </webwork:text></p>
	</page:param>

    <tr>
    <td colspan="2">
    <table class="grid">
    <tr>
        <th><webwork:text name="'admin.csvimport.csv.header.row'"/></th>
        <th><webwork:text name="'admin.csvimport.sample.data'"/></th>
        <th><webwork:text name="'admin.csvimport.corresponding.jira.field'"/></th>
        <th><webwork:text name="'admin.externalimport.map.field.value'"/></th>
    </tr>
    <webwork:iterator value="/bean/headerRow" status="'rowStatus'">
    <tr class="mappingrow">
        <td class="formLabel">
            <span class="mappingname"><webwork:property value="." /></span>
<%--            <a onclick="duplicateRow(this);" href="#" >Duplicate</a> --%>
        </td>
        <td width="40%"><webwork:property value="/bean/sampleData[@rowStatus/index]" /></td>
        <td>
        <table class="grid maxWidth">
        <tr>
        <td colspan="2" style="border: 0px;">
            <select id="<webwork:property value="/bean/fieldName(.)" />"
                    name="<webwork:property value="/bean/fieldName(.)" />"
                    class="importField"
                    onchange="handleCustomFieldDisplay('<webwork:property value="/bean/fieldName(.)" />');">
                <option value=""><webwork:text name="'common.words.none'"/></option>
                <webwork:iterator value="/bean/fieldMappings" status="'rowStatus'">
                <optgroup label="<webwork:property value="./key" />" >
                <webwork:iterator value="./value" >
                    <option value="<webwork:property value="./key" />" <webwork:if test="/bean/selectedValue(../.., ./key) == true">selected="selected"</webwork:if>>
                        <webwork:property value="./value" />
                    </option>
                </webwork:iterator>
                </optgroup>
                </webwork:iterator>
            </select>
        </td>
        </tr>

            <ui:select label="text('admin.notifications.choose.a.custom.field')" name="/bean/existingCfName(.)"
                       list="/customFields" listKey="'id'" listValue="'name'"
                       template="selectmap.jsp"
                       value="/bean/value(/bean/existingCfName(.))">
                <ui:param name="'summary'" value="'description'" />
                <ui:param name="'headerrow'" value="'None'" />
                <ui:param name="'headervalue'" value="" />
                <ui:param name="'rowClass'"><webwork:property value="/bean/existingCfName(.)" /></ui:param>
<webwork:if test="/bean/value(/bean/fieldName(.)) != 'existingCustomField'">
                 <ui:param name="'rowStyle'" value="'display:none;'" />
</webwork:if>
            </ui:select>

            <webwork:property value="/bean/value(/bean/newCfName(.))" id="newCustomFieldName" />
            <webwork:if test="@newCustomFieldName/ == null || @newCustomFieldName/length == 0" >
                <webwork:property value="." id="newCustomFieldName" /><%-- this will default a new custom field to be the same as the title of the column --%>
            </webwork:if>
            <ui:textfield label="text('admin.csvimport.custom.field.name')" name="/bean/newCfName(.)" value="@newCustomFieldName" >
                <ui:param name="'rowClass'" value="/bean/newCfName(.)" />
                <ui:param name="'title'" value="text('admin.csvimport.custom.field.name.desc')" />
<webwork:if test="/bean/value(/bean/fieldName(.)) != 'newCustomField'">
                <ui:param name="'rowStyle'" value="'display:none;'" />
</webwork:if>
                </ui:textfield>

            <ui:select label="text('admin.csvimport.custom.field.type')" name="/bean/newCfType(.)"
                       list="/bean/validCustomFieldTypes" value="/bean/value(/bean/newCfType(.))"
                       listKey="'key'" listValue="'value'"
                       template="selectmap.jsp">
                <ui:param name="'rowClass'" value="/bean/newCfName(.)" />
                <ui:param name="'title'" value="text('admin.csvimport.custom.field.type.desc')" />
<webwork:if test="/bean/value(/bean/fieldName(.)) != 'newCustomField'">
                <ui:param name="'rowStyle'" value="'display:none;'" />
</webwork:if>
            </ui:select>
        </table>


        </td>
        <td class="fullyCentered">
            <ui:checkbox label="''" theme="'single'"
                         name="'bean/mapValues'" fieldValue=".">
                <webwork:if test="/bean/inMapValues(.) == true">
                    <ui:param name="'checked'">true</ui:param>
                </webwork:if>
            </ui:checkbox>
        </td>
    </tr>

    </webwork:iterator>
    </table>

    <webwork:property value="/bean/unmappedFields">
        <webwork:if test=". != null && ./size > 0">
            <p/>
            <div class="noteBox"><webwork:text name="'admin.csvimport.unmapped.field.warn.message'"/></div>
            <table class="grid" id="unmappedFields">
            <tr>
                <th><webwork:text name="'admin.csvimport.unmapped.field.key.header'"/></th>
                <th><webwork:text name="'admin.csvimport.unmapped.field.value.header'"/></th>
            </tr>
            <webwork:iterator value="." status="'rowStatus'">
            <tr>
                <td class="formLabel">
                    <webwork:property value="./key"/>
                </td>
                <td>
                    <webwork:property value="./value"/>
                </td>
            </tr>
            </webwork:iterator>
            </table>
        </webwork:if>
    </webwork:property>

    <ui:component name="'mapValues'" template="hidden.jsp" value="''" />
    </td>
    </tr>

</page:applyDecorator>

</body>
</html>
