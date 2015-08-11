<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.edit.itss.entry.title'"/></title>
</head>
<body>
<p>
<page:applyDecorator name="jiraform">
    <page:param name="action">EditIssueTypeScreenSchemeEntity.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.edit.itss.entry.title'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">fieldscreenschemes</page:param>
    <page:param name="submitId">update_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
    <page:param name="cancelURI"><webwork:url page="ConfigureIssueTypeScreenScheme.jspa"><webwork:param name="'id'" value="/id" /></webwork:url></page:param>
    <page:param name="description">
        <p>
            <webwork:if test="/issueTypeId">
                <webwork:text name="'admin.edit.itss.entry.instructions1'">
                    <webwork:param name="'value0'"><b><webwork:property value="/issueType/string('name')" /></b></webwork:param>
                    <webwork:param name="'value1'"><b><webwork:property value="/issueTypeScreenScheme/name" /></b></webwork:param>
                    <webwork:param name="'value2'"><b></webwork:param>
                    <webwork:param name="'value3'"><webwork:text name="'common.forms.update'"/></webwork:param>
                    <webwork:param name="'value4'"></b></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.edit.itss.entry.instructions1'">
                    <webwork:param name="'value0'"><b><webwork:text name="'admin.common.words.default'"/></b></webwork:param>
                    <webwork:param name="'value1'"><b><webwork:property value="/issueTypeScreenScheme/name" /></b></webwork:param>
                    <webwork:param name="'value2'"><b></webwork:param>
                    <webwork:param name="'value3'"><webwork:text name="'common.forms.update'"/></webwork:param>
                    <webwork:param name="'value4'"></b></webwork:param>
                </webwork:text>
            </webwork:else>
        </p>
    </page:param>

    <ui:select label="text('admin.menu.issuefields.screen.scheme')" name="'fieldScreenSchemeId'" list="/fieldScreenSchemes" listKey="'./id'" listValue="'./name'">
        <ui:param name="'mandatory'">true</ui:param>
        <ui:param name="'description'"><webwork:text name="'admin.edit.itss.entry.description'"/></ui:param>
    </ui:select>

    <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>

    <webwork:if test="/issueTypeId">
        <ui:component name="'issueTypeId'" template="hidden.jsp" theme="'single'"/>
    </webwork:if>

    <ui:component name="'edited'" value="'true'" template="hidden.jsp" theme="'single'"/>

</page:applyDecorator>
</p>
</body>
</html>
