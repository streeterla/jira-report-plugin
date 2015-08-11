
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.issuesecurity.delete.title'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteIssueSecurity.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="EditIssueSecurities!default.jspa"><webwork:param name="'schemeId'" value="schemeId"/></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.schemes.issuesecurity.delete.title'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
	    <page:param name="description">
        <input type="hidden" name="schemeId" value="<webwork:property value="schemeId" />">
        <input type="hidden" name="id" value="<webwork:property value="id" />">
        <input type="hidden" name="confirmed" value="true">
        <webwork:text name="'admin.schemes.issuesecurity.delete.confirmation'">
            <webwork:param name="'value0'"><b><webwork:property value="issueSecurityDisplayName" /> <webwork:if test="issueSecurityParameter != null"> (<webwork:property value="issueSecurityParameter"/>) </webwork:if> </b></webwork:param>
            <webwork:param name="'value1'"><b><webwork:property value="issueSecurityName" /></b></webwork:param>
        </webwork:text><br>
        </page:param>
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
