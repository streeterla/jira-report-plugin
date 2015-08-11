
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.issuesecurity.edit.issue.security.scheme'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditIssueSecurityScheme.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
    	<page:param name="cancelURI">ViewIssueSecuritySchemes.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.schemes.issuesecurity.edit.issue.security.scheme'"/>: <webwork:property value="scheme/string('name')" /></page:param>
        <page:param name="width">100%</page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" />
        <ui:textarea label="text('common.words.description')" name="'description'" cols="'30'" rows="'3'" />

        <webwork:property value="securityLevels" >
            <ui:select label="text('admin.schemes.issuesecurity.default.security.level')" name="'defaultLevel'" list="keySet"
                listKey="'.'" listValue="'../(.)'">
                <ui:param name="'headerrow'" value="'None'" />
                <ui:param name="'headervalue'" value="'-1'" />
            </ui:select>
                <tr>
                    <td class="fieldLabelArea"></td>
                    <td class="fieldValueArea">
                        <font size=1><webwork:text name="'admin.schemes.issuesecurity.settings.the.default.level'"/></font> <br>
                        <font color = cc00000 size=1><webwork:text name="'admin.schemes.issuesecurity.note'"/></font>
                    </td>
                </tr>
        </webwork:property>

        <ui:component name="'schemeId'" template="hidden.jsp" />
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
