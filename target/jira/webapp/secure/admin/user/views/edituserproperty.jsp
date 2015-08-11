<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.edituserproperties.edit.property'"><webwork:param name="'value0'" value="/key"/></webwork:text></title>
</head>
<body>

<p>
<page:applyDecorator name="jiraform">
    <page:param name="action">EditUserProperty!update.jspa</page:param>
    <page:param name="submitId">update_submit</page:param>
    <page:param name="submitName"> <webwork:text name="'common.forms.update'"/> </page:param>
    <page:param name="title"><webwork:text name="'admin.edituserproperties.edit.property'"><webwork:param name="'value0'" value="/key"/></webwork:text></page:param>
    <page:param name="cancelURI"><webwork:url page="EditUserProperties.jspa"><webwork:param name="'name'" value="name"/></webwork:url></page:param>
    <page:param name="width">90%</page:param>
    <page:param name="autoSelectFirst">true</page:param>
    <page:param name="description">
        <webwork:text name="'admin.edituserproperty.description'">
            <webwork:param name="'value0'"><b><webwork:property value="/key"/></b></webwork:param>
            <webwork:param name="'value0'"><b><webwork:property value="/user/fullName"/></b></webwork:param>
        </webwork:text>
    </page:param>

    <ui:textfield label="text('common.words.value')" name="'value'" size="20" />

    <ui:component name="'name'" template="hidden.jsp" theme="'single'" />
    <ui:component name="'key'" template="hidden.jsp" theme="'single'" />

</page:applyDecorator>
</p>

</body>
</html>
