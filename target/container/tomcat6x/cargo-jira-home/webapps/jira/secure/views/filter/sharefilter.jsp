<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'sharefilter.title'"/></title>
    <content tag="section">find_link</content>
</head>

<body>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td class="filterSummaryCell">
    <jsp:include page="/includes/navigator/summary-pane.jsp" />
</td>
<td bgcolor="#ffffff" valign="top">
<table width="100%" cellpadding="10" cellspacing="0" border="0"><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="action">ShareFilter.jspa</page:param>
        <page:param name="cancelURI">ManageFilters.jspa</page:param>
        <page:param name="submitId">share_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.share'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'sharefilter.title'"/></page:param>
        <page:param name="description">
        <webwork:text name="'sharefilter.desc'"/>
        </page:param>

        <tr>
        <td bgcolor="#fffff0" align="right"><webwork:text name="'sharefilter.notshared'"/>:</td>
        <td bgcolor="#ffffff"><input type="radio" name="option" value="<webwork:property value="options[0]"/>" <webwork:if test="option==options[0]">checked</webwork:if>></td>
        </tr>
        <tr>
        <td bgcolor="#fffff0" align="right"><webwork:text name="'sharefilter.shareWithAll'"/>:</td>
        <td bgcolor="#ffffff"><input type="radio" name="option" value="<webwork:property value="options[1]"/>" <webwork:if test="option==options[1]">checked</webwork:if>></td>
        </tr>
        <tr>
        <td bgcolor="#fffff0" align="right"><webwork:text name="'sharefilter.shareWithGroup'"/>:</td>
        <td bgcolor="#ffffff"><input type="radio" name="option" value="<webwork:property value="options[2]"/>" <webwork:if test="option==options[2]">checked</webwork:if>></td>
        </tr>
        <ui:select label="''" name="'group'" list="groups" listKey="'.'" listValue="'.'">
            <ui:param name="'headerrow'"><webwork:text name="'sharefilter.select.group'"/></ui:param>
    		<ui:param name="'headervalue'" value="''" />
    		<ui:param name="'headervalue'" value="''" />
            <ui:param name="'onchange'" value="'document.forms['jiraform'].option[2].checked = true;'" />
    		<ui:param name="'description'" >
            <webwork:if test="hasPermission('admin')==false">
                <webwork:text name="'sharefilter.error.mustBeMember'"/>
            </webwork:if>
            </ui:param>
        </ui:select>
    </page:applyDecorator>

</td></tr></table>
</td></tr></table>

</body>
</html>
