<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigurations.renderer.edit.field.layout.items.renderer'"/></title>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditFieldLayoutItemRendererConfirmation.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
    	<page:param name="cancelURI"><webwork:property value="/cancelUrl"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigurations.renderer.edit.field.renderer'"/>: <webwork:text name="/fieldName"/></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.issuefields.fieldconfigurations.renderer.description'"/></p>
            <p><webwork:text name="'admin.issuefields.fieldconfigurations.renderer.update.for.field'">
                <webwork:param name="'value0'">'<webwork:text name="/fieldName"/>'</webwork:param>
            </webwork:text></p>
            <webwork:if test="/effectedIssuesCount != 0" >
                <p><div class="warningBox"><webwork:text name="'admin.issuefields.fieldconfigurations.renderer.warning'">
                    <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/IssueNavigator.jspa?reset=true&<webwork:text name="/effectedIssuesQueryString"/>"><webwork:property value="/effectedIssuesCount"/></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
                </div> </p>
            </webwork:if>
        </page:param>
        <page:param name="width">100%</page:param>

        <ui:select label="text('admin.issuefields.fieldconfigurations.renderer.active.renderer')" name="'selectedRendererType'" list="/allActiveRenderers" listKey="'rendererType'" listValue="'descriptor/name'" value="/currentRendererType">
            <ui:param name="'description'">
                <webwork:text name="'admin.issuefields.fieldconfigurations.renderer.description'"/>
            </ui:param>
        </ui:select>

    	<ui:component name="'rendererEdit'" template="hidden.jsp" />
        <ui:component name="'id'" template="hidden.jsp" />
        <input type="hidden" name="fieldName" value="<webwork:text name="/fieldName"/>">
    </page:applyDecorator>
</body>
</html>
