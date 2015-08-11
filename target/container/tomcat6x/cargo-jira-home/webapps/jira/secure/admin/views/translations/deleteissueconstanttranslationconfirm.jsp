<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.translations.delete.title'">
	    <webwork:param name="'value0'"><webwork:property value="/issueConstantName" /></webwork:param>
	    <webwork:param name="'value1'"><webwork:property value="/issueConstantTypeName" /></webwork:param>
	</webwork:text></title>
</head>

<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.translations.delete.title'">
	    <webwork:param name="'value0'"><webwork:property value="/issueConstantName" /></webwork:param>
	    <webwork:param name="'value1'"><webwork:property value="/issueConstantTypeName" /></webwork:param>
	</webwork:text></page:param>
	<page:param name="description">
		<p><webwork:text name="'admin.translations.delete.confirmation'"/></p>
	</page:param>

	<page:param name="action"><webwork:property value="/deleteName" />.jspa?typeId=<webwork:property value="typeId" />&selectedLocale=<webwork:property value="/selectedLocale"/></page:param>
	<page:param name="submitId">delete_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="cancelURI"><webwork:property value="/viewName" />!default.jspa?typeId=<webwork:property value="typeId" /></page:param>

    <tr><td bgcolor="#ffffff">
    <table border="0" cellpadding="3" cellspacing="1" width=100% align="center" class="gridBox">
        <tr width="100%" bgcolor="#f0f0f0">
                <td align=absmiddle class="colHeaderLink" width="20%" >
                    <b><webwork:text name="'admin.issuesettings.translations.locale'"/></b>
                </td>
                <td align=absmiddle class="colHeaderLink">
                    <b><webwork:text name="'admin.common.words.translation'"/></b>
                </td>
        </tr>
        <tr bgcolor="#ffffff">
        <td align=lef>
            <b><webwork:property value="./selectedLocale" /></b>
        </td>
        <td align=left>
            <b><webwork:text name="'common.words.name'"/>:</b> <webwork:property value="./nameTranslation" />
            <br>
            <b><webwork:text name="'common.words.description'"/>:</b> <webwork:property value="./descTranslation" />
        </td>
        </tr>
    </table>
    </td></tr>

	<ui:component name="'typeId'" template="hidden.jsp" />
	<ui:component name="'translation'" template="hidden.jsp" />

</page:applyDecorator>

</body>
</html>
