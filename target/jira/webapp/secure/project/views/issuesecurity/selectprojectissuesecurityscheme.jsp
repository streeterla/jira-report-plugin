<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.iss.security.scheme'"/></title>
</head>
<body>
    <webwork:if test="schemes == null || schemes/size == 0">
        <page:applyDecorator name="jirapanel">
            <page:param name="title"><webwork:text name="'admin.iss.associate.security.scheme.to.project'"/></page:param>
            <page:param name="width">100%</page:param>
            <p>
            <webwork:text name="'admin.iss.no.schemes.set.up'"/>
            </p>
            <p><webwork:text name="'admin.iss.add.new.issue.security.scheme'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/admin/ViewIssueSecuritySchemes.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
            </p>
        </page:applyDecorator>
    </webwork:if>
    <webwork:else>
        <page:applyDecorator name="jiraform">
            <page:param name="title"><webwork:text name="'admin.iss.associate.security.scheme.to.project'"/></page:param>
            <page:param name="description">
                <p><webwork:text name="'admin.iss.step1'">
                    <webwork:param name="'value0'"><b></webwork:param>
                    <webwork:param name="'value1'"></b></webwork:param>
                </webwork:text></p>
    <%--            page allows you to associate a Issue Security scheme with this project.--%>
            </page:param>
            <page:param name="width">100%</page:param>
            <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="projectId"/></webwork:url></page:param>
            <page:param name="action">SelectProjectSecuritySchemeStep2!default.jspa</page:param>
            <page:param name="submitId">next_submit</page:param>
            <page:param name="submitName">Next >></page:param>

            <ui:select label="'Scheme'" name="'newSchemeId'" value="schemeIds[0]" list="schemes" listKey="'string('id')'" listValue="'string('name')'">
                <ui:param name="'headerrow'" value="'None'" />
                <ui:param name="'headervalue'" value="-1" />
            </ui:select>
            <ui:component name="'projectId'" template="hidden.jsp"/>

            <input type="hidden" name="origSchemeId" value="<webwork:property value="schemeId" />">
        </page:applyDecorator>
    </webwork:else>
</body>
</html>
