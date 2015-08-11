<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.externalimport.csv.configure.csv.importer'"/></title></head>
<body>

<style type="text/css">
<!--
.formLabel
{
    width: 30%;
}

.mappingTable .fieldLabelArea
{
    width: 30%;
}

.addConstantLink
{
    vertical-align: middle;
    padding-left: 0.5em;
    font-size: 80%;
}

.addConstantLink img
{
    margin: auto;
    vertical-align: middle;

    padding-right: 1em;
}
-->
</style>

<script language="JavaScript" type="text/javascript">
<!--
    function addJiraConstant(constantType, constantValue, constantField)
    {
        document.jiraform.constantType.value = constantType;
        document.jiraform.constantValue.value = constantValue;
        document.jiraform.constantField.value = constantField;
        document.jiraform.addConstant.value = 'true';
        document.jiraform.submit();
        return false;
    }
//-->
</script>

<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureCsvMapping.jspa</page:param>
    <page:param name="cancelURI">CsvImporter!default.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.csvimport.wizard'"/>: <webwork:text name="'admin.csvimport.value.mappings'"/></page:param>
    <page:param name="wizard">true</page:param>
	<page:param name="instructions">
       <webwork:text name="'admin.externalimport.unique.values.displayed'">
           <webwork:param name="'value0'"><em></webwork:param>
           <webwork:param name="'value1'"></em></webwork:param>
           <webwork:param name="'value2'"><strong><webwork:property value="'<<blank>>'" /></strong></webwork:param>
       </webwork:text> <br/>
        <webwork:text name="'admin.csvimport.can.create.on.the.fly'">
            <webwork:param name="'value0'"><img src='<%= request.getContextPath() %>/images/icons/add_16.gif' alt="<webwork:text name="'admin.csvimport.sample.icon'"/>" /></webwork:param>
        </webwork:text>
	</page:param>

    <ui:component name="'constantType'" template="hidden.jsp" theme="'single'" value="''" />
    <ui:component name="'constantValue'" template="hidden.jsp" theme="'single'" value="''" />
    <ui:component name="'constantField'" template="hidden.jsp" theme="'single'" value="''" />
    <ui:component name="'addConstant'" template="hidden.jsp" theme="'single'" value="'false'" />

    <tr><td colspan="2">
<webwork:if test="/bean/mapValues">
    <table class="grid maxWidth">
    <tr>
        <th><webwork:text name="'admin.csvimport.csv.header.row'"/></th>
        <th><webwork:text name="'admin.externalimport.map.field.value'"/></th>
    </tr>
    <webwork:iterator value="/bean/mapValues" status="'rowStatus'">
    <tr>
        <td class="formLabel">
            <webwork:property value="." />
            <br />
            <span class="subText">(<webwork:text name="'admin.csvimport.imported.as'">
                <webwork:param name="'value0'"><strong><webwork:property value="bean/value(/bean/fieldName(.))" /></strong></webwork:param>
            </webwork:text>)</span>
        </td>
        <td>

            <table class="grid maxWidth mappingTable">
            <tr>
                <th class="fieldLabelArea"><webwork:text name="'admin.externalimport.value.in.importer'"/></th>
                <th class="fieldValueArea"><webwork:text name="'admin.externalimport.target.value'"/></th>
            </tr>
                <webwork:iterator value="/bean/currentValues(.)">

<webwork:if test="bean/value(/bean/fieldName(..)) == 'priority'">
    <ui:select label="." name="/bean/convertedValueMappingName(..,.)"
               list="/priorities" listKey="'id'" listValue="'nameTranslation'"
               template="selectmap.jsp"
               value="/bean/value(/bean/valueMappingName(..,.))">
        <ui:param name="'title'" value="text('admin.csvimport.option.priority')" />
        <ui:param name="'headerrow'" value="text('admin.csvimport.option.no.mapping')" />
        <ui:param name="'headervalue'" value="" />
        <ui:param name="'headerrow2'" value="text('admin.csvimport.option.blank')" />
        <ui:param name="'headervalue2'" value="'<<blank>>'" />
        <ui:param name="'extrahtml'">
            <webwork:if test="/nameInList(/priorities, .) == false">
            <a class="addConstantLink" href="<webwork:url value="'ConfigureCsvMapping!addConstant.jspa'">
              <webwork:param name="'currentStep'" value="/currentStep"/>
              <webwork:param name="'constantType'" value="'Priority'"/>
              <webwork:param name="'constantValue'" value="."/>
              <webwork:param name="'constantField'" value=".."/>
           </webwork:url>"onclick="try { return addJiraConstant('<webwork:property value="'Priority'"/>', '<webwork:property value="."/>', '<webwork:property value=".."/>');} catch(e) {return true;}"><img src='<%= request.getContextPath() %>/images/icons/add_16.gif' alt="<webwork:text name="'admin.csvimport.add.new.priority'">
               <webwork:param name="'value0'">'<webwork:property />'</webwork:param>
           </webwork:text>" title="<webwork:text name="'admin.csvimport.add.new.priority'">
               <webwork:param name="'value0'">'<webwork:property />'</webwork:param>
           </webwork:text>" /><webwork:text name="'admin.csvimport.add.new.priority'">
               <webwork:param name="'value0'">'<webwork:property />'</webwork:param>
           </webwork:text></a>
            </webwork:if>
        </ui:param>
    </ui:select>
</webwork:if>

<webwork:elseIf test="bean/value(/bean/fieldName(..)) == 'resolution'">
    <ui:select label="." name="/bean/convertedValueMappingName(..,.)"
               list="/resolutions" listKey="'id'" listValue="'nameTranslation'"
               template="selectmap.jsp"
               value="/bean/value(/bean/valueMappingName(..,.))">
        <ui:param name="'title'" value="text('admin.csvimport.option.resolution')" />
        <ui:param name="'headerrow'" value="text('admin.csvimport.option.no.mapping')" />
        <ui:param name="'headervalue'" value="" />
        <ui:param name="'headerrow2'" value="text('admin.csvimport.option.blank')" />
        <ui:param name="'headervalue2'" value="'<<blank>>'" />
        <ui:param name="'extrahtml'">
            <webwork:if test="/nameInList(/resolutions, .) == false">
            <a class="addConstantLink" href="<webwork:url value="'ConfigureCsvMapping!addConstant.jspa'">
              <webwork:param name="'currentStep'" value="/currentStep"/>
              <webwork:param name="'constantType'" value="'Resolution'"/>
              <webwork:param name="'constantValue'" value="."/>
              <webwork:param name="'constantField'" value=".."/>
           </webwork:url>"onclick="try { return addJiraConstant('<webwork:property value="'Resolution'"/>', '<webwork:property value="."/>', '<webwork:property value=".."/>');} catch(e) {return true;}"><img src='<%= request.getContextPath() %>/images/icons/add_16.gif' alt="<webwork:text name="'admin.csvimport.add.new.resolution'">
               <webwork:param name="'value0'">'<webwork:property />'</webwork:param>
           </webwork:text>" title="<webwork:text name="'admin.csvimport.add.new.resolution'">
               <webwork:param name="'value0'">'<webwork:property />'</webwork:param>
           </webwork:text>" /><webwork:text name="'admin.csvimport.add.new.resolution'">
               <webwork:param name="'value0'">'<webwork:property />'</webwork:param>
           </webwork:text></a>
            </webwork:if>
        </ui:param>
    </ui:select>
</webwork:elseIf>

<webwork:elseIf test="bean/value(/bean/fieldName(..)) == 'type'">
    <ui:select label="." name="/bean/convertedValueMappingName(..,.)"
               list="/issueTypes" listKey="'id'" listValue="'nameTranslation'"
               template="selectmap.jsp"
               value="/bean/value(/bean/valueMappingName(..,.))">
        <ui:param name="'title'" value="text('admin.csvimport.option.issue.type')" />
        <ui:param name="'headerrow'" value="text('admin.csvimport.option.no.mapping')" />
        <ui:param name="'headervalue'" value="" />
        <ui:param name="'headerrow2'" value="text('admin.csvimport.option.blank')" />
        <ui:param name="'headervalue2'" value="'<<blank>>'" />
        <ui:param name="'extrahtml'">
            <webwork:if test="/nameInList(/issueTypes, .) == false">
            <a class="addConstantLink" href="<webwork:url value="'ConfigureCsvMapping!addConstant.jspa'">
              <webwork:param name="'currentStep'" value="/currentStep"/>
              <webwork:param name="'constantType'" value="'IssueType'"/>
              <webwork:param name="'constantValue'" value="."/>
              <webwork:param name="'constantField'" value=".."/>
           </webwork:url>" onclick="try { return addJiraConstant('<webwork:property value="'IssueType'"/>', '<webwork:property value="."/>', '<webwork:property value=".."/>');} catch(e) {return true;}"><img src='<%= request.getContextPath() %>/images/icons/add_16.gif' alt="<webwork:text name="'admin.csvimport.add.new.issue.type'">
               <webwork:param name="'value0'">'<webwork:property />'</webwork:param>
           </webwork:text>" title="<webwork:text name="'admin.csvimport.add.new.issue.type'">
               <webwork:param name="'value0'">'<webwork:property />'</webwork:param>
           </webwork:text>" /><webwork:text name="'admin.csvimport.add.new.issue.type'">
               <webwork:param name="'value0'">'<webwork:property />'</webwork:param>
           </webwork:text></a>
            </webwork:if>
        </ui:param>
    </ui:select>
</webwork:elseIf>

<webwork:elseIf test="bean/value(/bean/fieldName(..)) == 'status'">
    <ui:select label="." name="/bean/convertedValueMappingName(..,.)"
               list="/statuses" listKey="'id'" listValue="'nameTranslation'"
               template="selectmap.jsp"
               value="/bean/value(/bean/valueMappingName(..,.))">
        <ui:param name="'title'" value="text('admin.csvimport.option.status')" />
        <ui:param name="'headerrow'" value="text('admin.csvimport.option.no.mapping')" />
        <ui:param name="'headervalue'" value="" />
        <ui:param name="'headerrow2'" value="text('admin.csvimport.option.blank')" />
        <ui:param name="'headervalue2'" value="'<<blank>>'" />
    </ui:select>
</webwork:elseIf>
<webwork:else>
    <ui:textfield label="." name="/bean/convertedValueMappingName(..,.)"
                  value="/bean/value(/bean/valueMappingName(..,.))" >
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
    <webwork:text name="'admin.csvimport.no.fields.selected'"/>
</webwork:else>

    </td></tr>
</page:applyDecorator>

</body>
</html>
