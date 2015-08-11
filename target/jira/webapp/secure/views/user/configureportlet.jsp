<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<html>
<head>
	<title><webwork:text name="'portlet.edit'"/></title>
</head>

<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<webwork:if test="/displayUserSummary == true">
    <td width="200" bgcolor="#f0f0f0" valign="top">
        <jira:formatuser user="/user" type="'fullProfile'" id="'configure_portlet'"/>
    </td>
</webwork:if>
<td bgcolor="#ffffff" valign="top">
<table width="100%" cellpadding="10" cellspacing="0" border="0"><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'portlet.edit'"/>: <webwork:text name="portlet/name" /></page:param>
        <page:param name="description">
            <webwork:text name="portlet/description" />
        </page:param>
        <page:param name="action">SavePortlet.jspa</page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="cancelURI"><webwork:property value="/cancelUrl" /></page:param>
        <webwork:iterator value="objectConfiguration/fieldKeys">
            <%@ include file="/includes/panels/objectconfiguration_form.jsp"  %>
        </webwork:iterator>
        <% if (! Boolean.FALSE.equals(request.getAttribute("jira.portletform.showsavebutton")))
           { // if there is a problem with one of the parameters not being satisfied above, then we should not show the save button
        %>
            <page:param name="submitId">save_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.words.save'"/></page:param>
        <% } else
           { // reset the submit button to empty since in tomcat the state seems to be cached and we run into JRA-5042
        %>
            <page:param name="submitName"><webwork:text name="''"/></page:param>
        <% } %>
        <ui:component name="'portalPageId'" template="hidden.jsp"/>
        <ui:component name="'portletIdStr'" template="hidden.jsp"/>
        <ui:component name="'portletConfigId'" template="hidden.jsp"/>
        <ui:component name="'destination'" template="hidden.jsp"/>
    </page:applyDecorator>

</td></tr></table>
</td></tr></table>
</body>
</html>
