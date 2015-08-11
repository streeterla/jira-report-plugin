<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<webwork:if test="config/id != null">
<webwork:property id="command" value="text('admin.common.words.modify')" />
</webwork:if>
<webwork:else>
<webwork:property id="command" value="text('common.forms.add')" />
</webwork:else>

<html>
<head>
	<title><webwork:text name="'admin.issuefields.customfields.perform.action.on.configuration.scheme.context'">
	    <webwork:param name="'value0'"><webwork:property value="@command" /></webwork:param>
	</webwork:text></title>
</head>

<body>

	<page:applyDecorator name="jiraform">
        <page:param name="helpURL">configcustomfield</page:param>
        <page:param name="helpURLFragment">#Managing+multiple+configuration+schemes</page:param>
		<page:param name="title"><webwork:text name="'admin.issuefields.customfields.perform.action.on.configuration.scheme.context'">
	    <webwork:param name="'value0'"><webwork:property value="@command" /></webwork:param>
	</webwork:text></page:param>
		<page:param name="instructions">
            <webwork:text name="'admin.issuefields.configuration.contexts.description'"/>
        </page:param>
		<page:param name="action">ManageConfigurationScheme.jspa</page:param>
		<page:param name="width">100%</page:param>
    	<page:param name="cancelURI">ViewCustomFields.jspa</page:param>
		<page:param name="submitId">view_custom_fields_submit</page:param>
		<page:param name="submitName"><webwork:property value="@command" /></page:param>

        <ui:component template="multihidden.jsp" >
            <ui:param name="'fields'">fieldConfigSchemeId,customFieldId,basicMode</ui:param>
            <ui:param name="'multifields'">fieldConfigIds</ui:param>
        </ui:component>

<%--        <ui:component label="'Basic Mode'" value="/basicMode" template="textlabel.jsp" />--%>

        <ui:component label="text('common.concepts.customfield')" value="customField/name" template="textlabel.jsp" />

        <ui:textfield label="text('admin.issuefields.configuration.scheme.label')" name="'name'" >
            <ui:param name="'description'">
                <webwork:text name="'admin.issuefields.customfields.label.for.this.context'"/>
            </ui:param>
            <ui:param name="'mandatory'" value="'true'" />
            <ui:param name="'style'" value="'width: 90%;'" />
        </ui:textfield>
        <ui:textarea label="text('common.words.description')" name="'description'" rows="5">
            <ui:param name="'description'">
                <webwork:text name="'admin.issuefields.customfields.optional.description'"/>
            </ui:param>
        </ui:textarea>


        <jsp:include page="addcontext.jsp" />

	</page:applyDecorator>

</body>
</html>
