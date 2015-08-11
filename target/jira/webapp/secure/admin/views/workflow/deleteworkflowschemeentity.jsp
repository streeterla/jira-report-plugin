
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.workflows.delete.entity'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteWorkflowSchemeEntity.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="EditWorkflowSchemeEntities!default.jspa"><webwork:param name="'schemeId'" value="schemeId"/></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.schemes.workflows.delete.entity'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
	    <page:param name="description">
        <input type="hidden" name="schemeId" value="<webwork:property value="schemeId" />">
        <input type="hidden" name="id" value="<webwork:property value="id" />">
        <input type="hidden" name="confirmed" value="true">
        <webwork:if test="workflowSchemeEntity/string('issuetype') == '0'">
            <webwork:text name="'admin.schemes.workflows.delete.confirmation1'">
                <webwork:param name="'value0'"><b><webwork:property value="workflow/name" /></b></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.schemes.workflows.delete.confirmation2'">
                <webwork:param name="'value0'"><b><webwork:property value="workflow/name" /></b></webwork:param>
                <webwork:param name="'value1'"><b><webwork:property value="/constantsManager/issueType(workflowSchemeEntity/string('issuetype'))/string('name')" /></b></webwork:param>
            </webwork:text>
        </webwork:else>
        </page:param>
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
