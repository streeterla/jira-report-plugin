<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'portal.addpage'"/></title>
    <content tag="section">home_link</content>
</head>

<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td width="200" bgcolor="#f0f0f0" valign="top">
    <jira:formatuser user="/user" type="'fullProfile'" id="'add_portal'"/>
</td>

<td bgcolor="#ffffff" valign="top">

<table width="100%" cellpadding="10" cellspacing="0" border="0"><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="action">AddPortalPage.jspa</page:param>
        <page:param name="cancelURI">ConfigurePortalPages!default.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="labelWidth">20%</page:param>
        <page:param name="helpURL">portlets.dashboard_pages</page:param>
        <page:param name="helpURLFragment">#creating_dashboards</page:param>
        <page:param name="title"><webwork:text name="'portal.addpage'"/></page:param>

        <ui:textfield label="text('common.words.name')" name="'portalPageName'" size="30">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>
        <ui:textarea label="text('common.concepts.description')" name="'portalPageDescription'" cols="40" rows="3" />

        <ui:select label="text('portal.startfrom')" name="'clonePageId'" list="cloneTargetDashboardPages" listKey="'id'" listValue="'name'">
            <ui:param name="'headerrow'"><webwork:text name="'portal.blankpage'" /></ui:param>
            <ui:param name="'description'"><webwork:text name="'portal.blankpage.description'" /></ui:param>
        </ui:select>
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
                <webwork:param name="'submitButtonId'">add_submit</webwork:param>
            </webwork:component>
        </webwork:if>
    </page:applyDecorator>

</td></tr></table>
</td></tr></table>

</body>
</html>
