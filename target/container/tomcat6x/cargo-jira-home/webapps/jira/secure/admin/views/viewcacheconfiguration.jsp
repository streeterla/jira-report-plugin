<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuecaching.cache.configuration'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuecaching.cache.configuration'"/></page:param>
    <page:param name="width">100%</page:param>

    <webwork:text name="'admin.issuecaching.description'"/>
    <p>
    <webwork:text name="'admin.issuecaching.instruction'"/>
    <p>
    <webwork:text name="'admin.issuecaching.instruction2'"/>
</page:applyDecorator>

<p>
<table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=95%><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width=100%>

	<tr bgcolor="#ffffff">
		<td valign=top width=40% bgcolor=#f0f0f0><b><webwork:text name="'admin.issuecaching.current.cache.size'"/></b></td>
		<td valign=top width=30%><webwork:property value="size"/></td>
		<td valign=top width=30%><a href="<%= request.getContextPath() %>/secure/admin/jira/FlushIssueCache.jspa"><webwork:text name="'admin.issuecaching.flush.cache'"/></a></td>
	</tr>

	<tr bgcolor="#ffffff">
		<td valign=top width=40% bgcolor=#f0f0f0><b><webwork:text name="'admin.issuecaching.cache.capacity'"/></b></td>
		<td valign=top width=40%><webwork:property value="capacity"/></td>
		<td valign=top width=30%><a href="<%= request.getContextPath() %>/secure/admin/jira/ChooseCacheCapacity.jspa"><webwork:text name="'admin.issuecaching.set.capacity'"/></a></td>
	</tr>

	<tr bgcolor="#ffffff">
		<td valign=top width=40% bgcolor=#f0f0f0><b><webwork:text name="'admin.issuecaching.hits.count'"/></b></td>
		<td valign=top width=30%><webwork:property value="hitsCount"/></td>
		<td valign=top width=30%><a href="<%= request.getContextPath() %>/secure/admin/jira/ResetCacheStats.jspa"><webwork:text name="'admin.issuecaching.reset.stats'"/></a></td>
	</tr>

	<tr bgcolor="#ffffff">
		<td valign=top width=40% bgcolor=#f0f0f0><b><webwork:text name="'admin.issuecaching.miss.count'"/></b></td>
		<td valign=top width=30%><webwork:property value="missCount"/></td>
		<td valign=top width=30%>&nbsp;</td>
	</tr>

</table>
</td></tr></table>
</p>

</body>
</html>
