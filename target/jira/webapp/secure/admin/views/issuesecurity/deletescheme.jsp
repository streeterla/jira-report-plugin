
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.issuesecurity.delete.issue.security.scheme'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
        <webwork:if test="projects(scheme)/size > 0" >
            <page:applyDecorator name="jiraform">
                <page:param name="action">ViewIssueSecuritySchemes.jspa</page:param>
                <page:param name="submitId">cancel_submit</page:param>
                <page:param name="submitName"><webwork:text name="'common.forms.cancel'"/></page:param>
                <page:param name="autoSelectFirst">false</page:param>
                <page:param name="title"><webwork:text name="'admin.schemes.issuesecurity.delete.issue.security.scheme'"/></page:param>
                <page:param name="width">100%</page:param>
                <page:param name="description">
                    <p><font color=#cc0000><webwork:text name="'admin.schemes.issuesecurity.error.scheme.associated.with.projects'"/>
                    <webwork:iterator value="projects(scheme)" status="'liststatus'">
                        <a href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" />">
                    <webwork:property value="string('name')" /></a><webwork:if test="@liststatus/last == false">, </webwork:if><webwork:else>.</webwork:else>
                    </webwork:iterator><br> <br>
                    <webwork:text name="'admin.schemes.issuesecurity.cannot.delete.scheme'"/></font></p>
                </page:param>
            </page:applyDecorator>
        </webwork:if>
        <webwork:else>
            <page:applyDecorator name="jiraform">
                <page:param name="action">DeleteIssueSecurityScheme.jspa</page:param>
                <page:param name="submitId">delete_submit</page:param>
                <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
                <page:param name="cancelURI">ViewIssueSecuritySchemes.jspa</page:param>
                <page:param name="title"><webwork:text name="'admin.schemes.issuesecurity.delete.issue.security.scheme'"/></page:param>
                <page:param name="width">100%</page:param>
                <page:param name="autoSelectFirst">false</page:param>
                <page:param name="description">
                <input type="hidden" name="schemeId" value="<webwork:property value="schemeId" />">
                <input type="hidden" name="confirmed" value="true">
                <webwork:if test="errorMessages/size == 0" >
                    <webwork:text name="'admin.schemes.issuesecurity.are.you.sure'"/><br>
                    <p>
                    <webwork:text name="'admin.common.words.scheme'"/>: <webwork:property value="name" /><p>
                    <webwork:if test="description" >
                        <webwork:text name="'common.words.description'"/>: "<webwork:property value="description" />"
                    </webwork:if>
                    <p>
                </webwork:if>
                </page:param>
            </page:applyDecorator>
        </webwork:else>
    </table>
    </p>

</body>
</html>
