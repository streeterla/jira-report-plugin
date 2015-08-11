<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:iterator value="permTypes">
	<webwork:if test="key == 23">
		<webwork:if test="allowGlobalPerms == true">
		<tr bgcolor=#ffffff>
			<td class="colHeaderLink" colspan=2>
				&nbsp;
			</td>
		</tr>
		<tr bgcolor=#f0f0f0>
			<td class="colHeaderLink" colspan=2>
				<webwork:component name="'permissions'" template="help.jsp"/>
<%--                    <a href="http://www.atlassian.com/software/jira/docs/latest/permissions.html" target="_jirahelp"><img src="<%= request.getContextPath() %>/images/icons/help_blue.gif" width=16 height=16 align=right border=0 alt="Get help!" title="Get online help about Permissions"></a>--%>
				<h3 class="formtitle"><webwork:text name="'admin.globalpermissions.title'"/></h3>
			</td>
		</tr>
		</webwork:if>
		<webwork:else>
		<tr bgcolor=#f0f0f0>
			<td class="colHeaderLink" colspan=2>
				<webwork:component name="'permissions'" template="help.jsp"/>
<%--                    <a href="http://www.atlassian.com/software/jira/docs/latest/permissions.html" target="_jirahelp"><img src="<%= request.getContextPath() %>/images/icons/help_blue.gif" width=16 height=16 align=right border=0 alt="Get help!" title="Get online help about Permissions"></a>--%>
				<h3 class="formtitle"><webwork:property value="project/string('name')" /> Permissions</h3>
			</td>
		</tr>
		</webwork:else>
	</webwork:if>
<tr
	<webwork:if test="@rowCount/next == 1">
		bgcolor="#ffffff"
	</webwork:if>
	<webwork:if test = "@rowCount/next == 0"/>
	<webwork:if test = "@rowCount/next == 2">
		bgcolor="#fffff0"
	</webwork:if>
>
	<td valign=top width=70%>
		<b><webwork:property value="text(value)"/></b><br>
		<font size=1><webwork:property value="/description(key)" escape="false"/>
        <%-- special case for 'USE' pemission --%>
            <webwork:if test="key == 1"><br><webwork:text name="'admin.globalpermissions.use.note'">
                <webwork:param name="'value0'"><span class="bolded, redText"></webwork:param>
                <webwork:param name="'value3'"></span></webwork:param>
            </webwork:text></webwork:if>
            <%-- special case for 'ADMIN' or 'SYS_ADMIN' permissions --%>
            <webwork:if test="key == 0 || key == 44"><br><webwork:text name="'admin.globalpermissions.admins.note'">
               <webwork:param name="'value0'"><span class="bolded, redText"></webwork:param>
               <webwork:param name="'value3'"></span></webwork:param>
            </webwork:text></webwork:if>
        </font>
	</td>
	<td valign=top width=30%>
		<webwork:property value="/permissionGroups(key)">
			<webwork:if test=". != null && size > 0">
				<webwork:iterator value=".">
						<webwork:if test="group">
							<webwork:property value="group" />
						</webwork:if>
						<webwork:else>
							Anyone
						</webwork:else>

						<font size=1>(<a href="<%= request.getContextPath() %>/secure/admin/user/UserBrowser.jspa?group=<webwork:property value="group" />"><webwork:text name="'admin.globalpermissions.view.users'"/></a>
						|
						<a id="del_<webwork:property value="../key" />_<webwork:property value="group" />" href="<webwork:url page="GlobalPermissions.jspa">
							<webwork:param name="'action'">confirm</webwork:param>
							<webwork:param name="'permType'" value="../key" />
							<webwork:param name="'groupName'" value="group"/><%-- if no group - then don't show it --%>
							<webwork:param name="'pid'" value="pid"/>
						</webwork:url>"><webwork:text name="'common.words.delete'"/></a>)</font><br>
				</webwork:iterator>
			</webwork:if>
			<webwork:else>
			&nbsp; <%-- non breaking space for netscape 4.x's benefit --%>
			</webwork:else>
		</webwork:property>
	</td>
</tr>
</webwork:iterator>
