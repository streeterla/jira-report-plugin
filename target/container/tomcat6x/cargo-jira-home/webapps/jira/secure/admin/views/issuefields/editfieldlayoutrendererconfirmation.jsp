<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuefields.fieldconfigurations.renderer.edit.confirmation'"/></title>
</head>

<body>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditFieldLayoutItemRenderer.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
    	<page:param name="cancelURI"><webwork:property value="/cancelUrl"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuefields.fieldconfigurations.renderer.edit.confirmation2'">
            <webwork:param name="'value0'"><webwork:text name="/fieldName"/></webwork:param>
        </webwork:text></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.issuefields.fieldconfigurations.renderer.description'"/></p>
            <p><webwork:text name="'admin.issuefields.fieldconfigurations.renderer.edit.confirmation.question'">
                <webwork:param name="'value0'"><u><webwork:property value="/fieldName" /></u></webwork:param>
                <webwork:param name="'value1'"><u><webwork:property value="/rendererDisplayName(/selectedRendererType)" /></u></webwork:param>
            </webwork:text><br></p>
        </page:param>
        <page:param name="width">100%</page:param>
    	<ui:component name="'rendererEdit'" template="hidden.jsp" />
    	<ui:component name="'selectedRendererType'" template="hidden.jsp" />
        <ui:component name="'id'" template="hidden.jsp" />
        <input type="hidden" name="confirmed" value="true">
    </page:applyDecorator>
</body>

</html>
