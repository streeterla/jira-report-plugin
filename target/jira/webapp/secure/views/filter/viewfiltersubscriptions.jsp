<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'common.concepts.managefilters'"/></title>
    <content tag="section">find_link</content>
</head>

<body>

<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
<td class="filterSummaryCell">
    <jsp:include page="/includes/navigator/summary-pane.jsp" />
</td>
<td bgcolor="#ffffff" valign="top">

<table width="100%" cellpadding="10" cellspacing="0" border=0><tr><td>

<page:applyDecorator name="jirapanel">
    <page:param name="title">
        <webwork:text name="'subscriptions.title'"><webwork:param name="'value0'"><webwork:property value="filterName"/></webwork:param></webwork:text>
    </page:param>
    <page:param name="description">
        <webwork:text name="'subscriptions.list'"/>.<br>
        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle">
        <a href="<webwork:url value="'FilterSubscription!default.jspa'"><webwork:param name="'filterId'" value="filterId" /></webwork:url>"><b><webwork:text name="'subscriptions.add'"/></b></a><br>
        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle">
        <webwork:text name="'subscriptions.viewAllFilters'">
            <webwork:param name="'value0'"><a href="<webwork:url page="ManageFilters.jspa"/>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text>
        <webwork:if test="mailConfigured == false && subscriptionCount > 0">
            <p/>
            <div class="notify warn">
                <webwork:text name="'filters.no.mail.configured'">
                    <webwork:param name="'value0'"><span class="warning"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                </webwork:text>                
            </div>
        </webwork:if>
    </page:param>
    <page:param name="width">100%</page:param>
</page:applyDecorator>

<p>

<table width="100%" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">
	<tr bgcolor=#f0f0f0>
        <td class="colHeaderLink" nowrap>
            <b><webwork:text name="'subscriptions.subscriber'"/></b>
        </td>
        <td class="colHeaderLink" nowrap>
            <b><webwork:text name="'subscriptions.subscribed'"/></b>
        </td>
		<td class="colHeaderLink" nowrap>
            <table>
                <tr>
                    <td>
                        <b><webwork:text name="'filtersubscription.field.schedule'"/></b>
                    </td>
                    <td>
                        <webwork:component name="'issue_filters_subscribing'" template="help.jsp"/>
                    </td>
                </tr>
            </table>
		</td>
		<td class="colHeaderLink" nowrap>
			<b><webwork:text name="'subscriptions.lastSent'"/></b>
		</td>
		<td class="colHeaderLink" nowrap>
			<b><webwork:text name="'subscriptions.nextSend'"/></b>
		</td>
        <td class="colHeaderLink" nowrap>
			<b><webwork:text name="'common.words.operations'"/></b>
		</td>
	</tr>
    <webwork:if test="subscriptions != null && subscriptions/size > 0">
        <webwork:iterator value="subscriptions" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td width=25%>
                <webwork:property value="string('username')"/>
            </td>
            <td width=25%>
                <webwork:if test="string('group') != null && string('group')/length > 0">
                        <webwork:if test="/groupValid(.) == false"><span class="warning" title="<webwork:text name="'admin.projects.group.invalid'"/>"></webwork:if>
                        <webwork:property value="string('group')"/>
                        <webwork:if test="/groupValid(.) == false"></span></webwork:if>
                </webwork:if>
                <webwork:else>
                        <webwork:property value="string('username')"/>
                </webwork:else>
            </td>
            <td nowrap><span title="<webwork:property value="/cronTooltip(.)"/>"><webwork:property value="prettySchedule(.)" /></span></td>
            <td nowrap><webwork:property value="lastSent(.)" /></td>
            <td nowrap><webwork:property value="nextSend(.)" /></td>
            <td width=1% nowrap>
            <webwork:if test="remoteUser/name == string('username')" >
                <a id="edit_subscription" href="<webwork:url value="'FilterSubscription!default.jspa'"><webwork:param name="'subId'" value="long('id')" /><webwork:param name="'filterId'" value="filterId" /></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
                | <a href="<webwork:url value="'DeleteSubscription.jspa'"><webwork:param name="'subId'" value="long('id')" /><webwork:param name="'filterId'" value="filterId" /></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
                <webwork:if test="mailConfigured == true">
                | <a href="<webwork:url value="'RunSubscription.jspa'"><webwork:param name="'subId'" value="long('id')" /><webwork:param name="'filterId'" value="filterId" /></webwork:url>"><webwork:text name="'common.forms.run.now'"/></a>
                </webwork:if>
            </webwork:if>
            </td>
        </tr>
        </webwork:iterator>
    </webwork:if>
    <webwork:else>
        <tr>
            <td colspan=6 bgcolor=#ffffff>
                <webwork:text name="'subscriptions.nosubs'"/>
            </td>
        </tr>
    </webwork:else>
    </table>
</td></tr></table>

</td></tr></table>
</td></tr></table>

</body>
</html>

