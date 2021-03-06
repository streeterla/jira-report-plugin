<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.issuesecurity.issue.security.schemes'"/></title>
</head>

<body>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.schemes.issuesecurity.issue.security.schemes'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">security_schemes</page:param>
        <p>
        <webwork:text name="'admin.schemes.issuesecurity.description1'"/>
        <p>
        <webwork:text name="'admin.schemes.issuesecurity.description2'"/>


        <p>
        <webwork:text name="'admin.schemes.issuesecurity.table.below'"/>
    </page:applyDecorator>

        <p>

        <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
        <table border="0" cellpadding="3" cellspacing="1" width=100%>
            <tr bgcolor=#f0f0f0>
                <td class="colHeaderLink">
                    <b><webwork:text name="'common.words.name'"/></b>
                </td>
                <td class="colHeaderLink">
                    <b><webwork:text name="'common.concepts.projects'"/></b>
                </td>
                <td class="colHeaderLink">
                    <b><webwork:text name="'common.words.operations'"/></b>
                </td>
            </tr>

            <webwork:iterator value="schemes" status="'status'">
            <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                <td valign=top>
                    <b><a href="<webwork:url page="EditIssueSecurities!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>"><webwork:property value="string('name')"/></a></b><br>
                    <webwork:property value="string('description')"/></td>
                <td valign=top nowrap>
                <webwork:iterator value="projects(.)">
                    <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height=8 width=8 border=0 align=absmiddle>
                    <a href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" />"><webwork:property value="string('name')" /></a><br>
                </webwork:iterator>
                </td>
                <td valign=top align=left nowrap>
                    <a href="<webwork:url page="EditIssueSecurities!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>" title="<webwork:text name="'admin.schemes.issuesecurity.change.the.security.levels'"/>"><webwork:text name="'admin.schemes.issuesecurity.security.levels'"/></a>
                    |
                    <a href="<webwork:url page="CopyIssueSecurityScheme.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>" title="<webwork:text name="'admin.schemes.issuesecurity.create.a.copy'"/>"><webwork:text name="'common.words.copy'"/></a>
                    |
                    <a href="<webwork:url page="EditIssueSecurityScheme!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>" title="<webwork:text name="'admin.schemes.issuesecurity.edit.the.name.description.and.default.security.level'"/>"><webwork:text name="'common.words.edit'"/></a>
                    <%-- You cannot delete the default scheme (0) --%>
                    <webwork:if test="long('id') != 0 && canDelete(.) == true">
                        |
                        <a id="del_<webwork:property value="string('name')"/>" href="<webwork:url page="DeleteIssueSecurityScheme!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>" title="<webwork:text name="'admin.schemes.issuesecurity.delete.this.scheme'"/>"><webwork:text name="'common.words.delete'"/></a>
                    </webwork:if>
                </td>
            </tr>
            </webwork:iterator>
            <webwork:if test="schemes/size == 0">
            <tr bgcolor=#ffffff>
                <td colspan=3><webwork:text name="'admin.schemes.issuesecurity.no.schemes.configure'"/></td>
            </tr>
            </webwork:if>
        </table>
        </td></tr></table>

        <p>
        <table align=center border="0" cellpadding="0" cellspacing="0" width=90%>
        <tr>
        <td align="center">
        <table border="0" cellpadding="3" cellspacing="1">
        <tr>
            <td><a id="add_securityscheme" href="<webwork:url page="AddIssueSecurityScheme!default.jspa"/>"><webwork:text name="'admin.schemes.issuesecurity.add.issue.security.scheme'"/></a>
        </tr>
        </table>
        </td>
        </tr>
        </table>
        </p>
</body>
</html>
