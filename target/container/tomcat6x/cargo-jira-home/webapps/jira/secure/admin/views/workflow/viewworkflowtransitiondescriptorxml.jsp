<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.workflowtransitions.xml.view.descriptor.xml'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.workflowtransitions.xml.conditional.result.xml'"/></page:param>
    <page:param name="width">100%</page:param>
    <p>
    <%--This shows the raw XML for Conditional Result <webwork:if test="/step">from <b><webwork:property value="/step/name"/></b></webwork:if> to <b><webwork:property value="/destinationStepDescriptor/name"/></b>.--%>
    <webwork:if test="/step">
        <webwork:text name="'admin.workflowtransitions.xml.page.description.from'">
            <webwork:param name="'value0'"><b><webwork:property value="/step/name"/></b></webwork:param>
            <webwork:param name="'value1'"><b><webwork:property value="/destinationStepDescriptor/name"/></b></webwork:param>
        </webwork:text>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'admin.workflowtransitions.xml.page.description.to'">
            <webwork:param name="'value0'"><b><webwork:property value="/destinationStepDescriptor/name"/></b></webwork:param>
        </webwork:text>
    </webwork:else>

    <p>
    <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle>
    <webwork:text name="'admin.workflowtransitions.xml.view.transition'">
        <webwork:param name="'value0'"><a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="/transition/id" /></webwork:url>"><b></webwork:param>
        <webwork:param name="'value1'"></b></a></webwork:param>
    </webwork:text>
    </p>
</page:applyDecorator>

<style>
.xml { font-size: 11px; background: #fffffc; border: 1px solid #bbb; padding: 4px; }
</style>
<pre class="xml"><webwork:property value="/resultXML" escape="true" /></pre>
</body>
</html>
