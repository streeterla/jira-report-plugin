<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigurations.edit.item'"/></title>
</head>
<body>
<style>
.fieldLabelArea
{
    width: 10%;
}
</style>

    <page:applyDecorator name="jiraform">
        <page:param name="action">EditFieldLayoutItem.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ConfigureFieldLayout.jspa"><webwork:param name="'id'" value="/id"/></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigurations.edit.field.description2'">
            <webwork:param name="'value0'"><webwork:text name="/fieldNameKey"/></webwork:param>
        </webwork:text></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.issuefields.fieldconfigurations.edit.description'"/></p>
            <p><webwork:text name="'admin.issuefields.fieldconfigurations.edit.update.the.description'">
                <webwork:param name="'value0'">'<webwork:text name="/fieldNameKey"/>'</webwork:param>
            </webwork:text></p>
        </page:param>
        <page:param name="width">100%</page:param>

        <ui:textarea rows="3" label="text('common.words.description')" name="'description'">
            <ui:param name="'style'" value="'width: 95%;'" />
        </ui:textarea>
    	<ui:component name="'position'" template="hidden.jsp" />
    	<ui:component name="'id'" template="hidden.jsp" />
    </page:applyDecorator>
</body>
</html>
