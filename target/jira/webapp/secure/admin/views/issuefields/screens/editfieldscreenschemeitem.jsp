<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuefields.screenschemes.edit.screen.scheme.item'"/></title>
</head>
<body>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditFieldScreenSchemeItem.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ConfigureFieldScreenScheme.jspa"><webwork:param name="'id'" value="/id" /></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.screenschemes.edit.screen.scheme.item'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <p>
                <webwork:text name="'admin.issuefields.screenschemes.edit.instruction'">
                    <webwork:param name="'value0'"><b><webwork:if test="/issueOperation"><webwork:property value="/issueOperation/name" /></webwork:if><webwork:else><webwork:text name="'admin.common.words.default'"/></webwork:else></b></webwork:param>
                </webwork:text>
            </p>
        </page:param>

        <ui:select label="text('admin.common.words.screen')" name="'fieldScreenId'" list="/fieldScreens" listKey="'./id'" listValue="'./name'">
            <ui:param name="'description'"><webwork:text name="'admin.issuefields.screenschemes.edit.the.screen.to.show.for.this.issue.operation'"/></ui:param>
        </ui:select>

        <ui:component name="'issueOperationId'" template="hidden.jsp" theme="'single'" />

        <ui:component name="'id'" template="hidden.jsp" theme="'single'" />
    </page:applyDecorator>
    </p>
</body>
</html>
