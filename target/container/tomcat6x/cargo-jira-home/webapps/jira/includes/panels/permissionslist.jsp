<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ include file="/includes/errormessages.jsp" %>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="90%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%" id="global_perms">
	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan=2>
        <webwork:component name="'permissions'" template="help.jsp"/>
<%--        <a href="http://www.atlassian.com/software/jira/docs/latest/permissions.html" target="_jirahelp"><img src="<%= request.getContextPath() %>/images/icons/help_blue.gif" width=16 height=16 align=right border=0 alt="Get help!" title="Get online help about Permissions"></a>--%>
			<h3 class="formtitle"><webwork:text name="'admin.globalpermissions.jira.permissions'"/></h3>
		</td>
	</tr>
	<%/*counter used to alternate background row colors*/%>
	<webwork:bean name="'webwork.util.Counter'" id="rowCount">
		<webwork:param name="'wrap'" value="true"/>
		<webwork:param name="'last'" value="2"/>
	</webwork:bean>
	<jsp:include page="permission/list_table.jsp"/>
</table>
</td></tr></table>
<p>
<page:applyDecorator name="jiraform">
	<page:param name="action">GlobalPermissions.jspa</page:param>
	<page:param name="submitId">addpermission_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="title"><webwork:text name="'admin.globalpermissions.add.permission'"/></page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="description"><webwork:text name="'admin.globalpermissions.add.a.new.permission'"/></page:param>

    <ui:select label="text('admin.common.words.permission')" name="'permType'" list="permTypes" listKey="'key'" listValue="'text(value)'">
        <ui:param name="'headerrow'" value="text('admin.globalpermissions.please.select.a.permission')" />
        <ui:param name="'headervalue'" value="'-1'" />
    </ui:select>
    <ui:select label="text('admin.common.words.group')" name="'groupName'" list="groups" listKey="'name'" listValue="'name'">
        <ui:param name="'headerrow'" value="text('admin.common.words.anyone')" />
        <ui:param name="'headervalue'" value="''" />
    </ui:select>

    <ui:component name="'action'" value="'add'" template="hidden.jsp" theme="'single'" />
</page:applyDecorator>
</p>
<br>
