<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigschemes.edit.config.scheme.entry'"/></title>
</head>
<body>
<p>
<page:applyDecorator name="jiraform">
    <page:param name="action">EditFieldLayoutSchemeEntity.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigschemes.edit.config.scheme.entry'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">fieldscreenschemes</page:param>
    <page:param name="submitId">update_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.words.update'"/></page:param>
    <page:param name="cancelURI"><webwork:url page="ConfigureFieldLayoutScheme.jspa"><webwork:param name="'id'" value="/id" /></webwork:url></page:param>
    <page:param name="description">
        <p>
            <webwork:if test="/issueTypeId">
                <webwork:text name="'admin.issuefields.fieldconfigschemes.edit.instruction.a'">
                    <webwork:param name="'value0'"><b><webwork:property value="/issueType/string('name')" /></b></webwork:param>
                    <webwork:param name="'value1'"><b><webwork:property value="/fieldLayoutScheme/name" /></b></webwork:param>
                    <webwork:param name="'value2'"><b></webwork:param>
                    <webwork:param name="'value3'"></b></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.issuefields.fieldconfigschemes.edit.instruction.b'">
                    <webwork:param name="'value0'"><b></webwork:param>
                    <webwork:param name="'value1'"></b></webwork:param>
                    <webwork:param name="'value2'"><b><webwork:property value="/fieldLayoutScheme/name" /></b></webwork:param>
                    <webwork:param name="'value3'"><b></webwork:param>
                    <webwork:param name="'value3'"></b></webwork:param>
                </webwork:text>
            </webwork:else>
        </p>
    </page:param>

    <ui:select label="text('admin.issuefields.fieldconfigschemes.field.configuration')" name="'fieldConfigurationId'" list="/fieldLayouts" listKey="'/fieldLayoutId(.)'" listValue="'./name'">
        <ui:param name="'description'"><webwork:text name="'admin.issuefields.fieldconfigschemes.field.configuration.description'"/></ui:param>
    </ui:select>

    <webwork:if test="/issueTypeId">
        <ui:component name="'issueTypeId'" template="hidden.jsp" theme="'single'"/>
    </webwork:if>

    <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>

    <ui:component name="'edited'" value="'true'" template="hidden.jsp" theme="'single'"/>

</page:applyDecorator>
</p>
</body>
</html>
