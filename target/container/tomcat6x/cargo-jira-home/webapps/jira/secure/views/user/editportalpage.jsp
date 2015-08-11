<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<html>
<head>
    <title><webwork:text name="'portal.edit.and.share.page'"/></title>
    <content tag="section">home_link</content>
</head>

<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td width="200" bgcolor="#f0f0f0" valign="top">
    <jira:formatuser user="/user" type="'fullProfile'" id="'edit_portal'"/>
</td>
<td bgcolor="#ffffff" valign="top">
<table width="100%" cellpadding="10" cellspacing="0" border="0"><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="action">EditPortalPage.jspa</page:param>
        <page:param name="cancelURI">ConfigurePortalPages!default.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="labelWidth">20%</page:param>
        <page:param name="helpURL">portlets.dashboard_pages</page:param>
        <page:param name="helpURLFragment">#editing_dashboards</page:param>
        <page:param name="title"><webwork:text name="'portal.edit.and.share.page'"/></page:param>

        <ui:textfield label="text('common.words.name')" name="'portalPageName'" size="30">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>
        <ui:textarea label="text('common.concepts.description')" name="'portalPageDescription'" cols="40" rows="3" />

        <tr>
            <td class="fieldLabelArea"><webwork:text name="'common.favourites.favourite'"/>:</td>
            <td class="fieldValueArea">
                <webwork:component name="'favourite'" template="favourite-new.jsp">
                    <webwork:param name="'enabled'"><webwork:property value="./favourite" /></webwork:param>
                    <webwork:param name="'fieldId'">favourite</webwork:param>
                    <webwork:param name="'entityType'">PortalPage</webwork:param>
                </webwork:component>
            </td>
        </tr>
        <webwork:if test="/showShares == true">
            <webwork:component name="'shares'" label="text('common.sharing.shares')" template="edit-share-types.jsp">
                <webwork:param name="'shareTypeList'" value="/shareTypes"/>
                <webwork:param name="'noJavaScriptMessage'">
                   <webwork:text name="'common.sharing.no.share.javascript'"/>
                </webwork:param>
                <webwork:param name="'editEnabled'" value="/editEnabled"/>
                <webwork:param name="'dataString'" value="/jsonString"/>
                <webwork:param name="'submitButtonId'">update_submit</webwork:param>
            </webwork:component>
        </webwork:if>
        <ui:component name="'pageId'" template="hidden.jsp" theme="'single'" />
    </page:applyDecorator>
</td></tr></table>
</td></tr></table>
</body>
</html>
