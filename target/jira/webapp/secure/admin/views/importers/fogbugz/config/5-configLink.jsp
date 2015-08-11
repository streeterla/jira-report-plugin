<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head><title><webwork:text name="'admin.externalimport.fogbugz.title'"/></title></head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">ConfigureFogBugzMapping!chooseLinkMappings.jspa</page:param>
    <page:param name="cancelURI">FogBugzImport!default.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.fogbugz.title.prefix'"/> <webwork:text name="'admin.externalimport.mappings.link'"/></page:param>
    <page:param name="wizard">true</page:param>
	<page:param name="instructions">
        <p><webwork:text name="'admin.externalimport.fogbugz.mappings.link.description'"/></p>
	</page:param>

    <tr>
    <td colspan="2">
    <table class="grid centred">
    <tr>
        <th><webwork:text name="'admin.externalimport.fogbugz.mappings.link.import.field'"/></th>
        <th><webwork:text name="'admin.externalimport.fogbugz.mappings.link.jira.field'"/></th>
    </tr>
    <webwork:iterator value="/bean/fogBugzLinkNames" status="'rowStatus'">
        <ui:select label="." name="."
                   list="/bean/availableLinkMappings" listKey="'./name'" listValue="'./name'"
                   template="selectmap.jsp"
                   value="/bean/linkMapping(.)">
            <ui:param name="'headerrow'" value="'None'" />
            <ui:param name="'headervalue'" value="''" />
        </ui:select>
    </webwork:iterator>
    </table>
    </td>
    </tr>

</page:applyDecorator>

</body>
</html>
