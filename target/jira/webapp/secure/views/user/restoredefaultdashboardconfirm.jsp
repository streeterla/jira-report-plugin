<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<html>
<head>
	<title><webwork:text name="'restoredefaultdashboard.title'"/></title>
    <content tag="section">home_link</content>
</head>

<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td width="200" bgcolor="#f0f0f0" valign="top">
    <jira:formatuser user="/user" type="'fullProfile'" id="'restore_default_dash'"/>
</td>
<td bgcolor="#ffffff" valign="top">
<table width="100%" cellpadding="10" cellspacing="0" border="0"><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'restoredefaultdashboard.title'"/></page:param>
        <page:param name="description"><webwork:text name="'restoredefaultdashboard.desc'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="action">RestoreDefaultDashboard.jspa</page:param>
        <page:param name="submitId">restore_submit</page:param>
        <page:param name="submitName"><webwork:text name="'restoredefaultdashboard.submit.restore'"/></page:param>
        <page:param name="cancelURI"><webwork:property value="/cancelUrl"/></page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <input type="hidden" name="confirm" value="true" />
        <webwork:if test="/standard == false">
            <webwork:if test="/portalPagesFavouritedByOthersWithUserCount/empty == false">
                <ui:component label="text('restoredefaultdashboard.others.favourites')" template="textlabel.jsp">
                    <webwork:param name="'texthtml'"><span id="othersFavouritedPortalPages">
                        <webwork:iterator value="/portalPagesFavouritedByOthersWithUserCount" status="'status'">
                            <webwork:property escape="true" value="key/name"/>
                            <webwork:property value="value">
                                <span class="small">(<webwork:property value="."/> <webwork:if test=". == 1"><webwork:text name="'common.words.user'"/>)</webwork:if><webwork:else><webwork:text name="'admin.common.words.users'"/>)</webwork:else></span><webwork:if test="@status/last == false">,</webwork:if>
                            </webwork:property>
                        </webwork:iterator>
                    </span></webwork:param>
                </ui:component>
            </webwork:if>
        </webwork:if>
    </page:applyDecorator>

</td></tr></table>
</td></tr></table>
</body>
</html>
