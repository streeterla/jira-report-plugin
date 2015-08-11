<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.subtasks.manage.sub.tasks'"/></title>
</head>
<body>
<script language="JavaScript">
    function openWindow()
    {
        var vWinUsers = window.open('<%= request.getContextPath() %>/secure/popups/IconPicker.jspa?fieldType=subtasks&formName=jiraform','IconPicker', 'status=no,resizable=yes,top=100,left=200,width=580,height=650,scrollbars=yes');
        vWinUsers.opener = self;
	    vWinUsers.focus();
    }
</script>

        <page:applyDecorator name="jirapanel">
            <page:param name="width">100%</page:param>
            <page:param name="title"><webwork:text name="'admin.menu.globalsettings.sub.tasks'"/></page:param>
                <webwork:if test="/subTasksEnabled == true">
                    <p>
                    <webwork:text name="'admin.subtasks.status'">
                        <webwork:param name="'value0'"><b><font color="#009900"></webwork:param>
                        <webwork:param name="'value1'"><webwork:text name="'admin.common.words.on'"/></webwork:param>
                        <webwork:param name="'value2'"></font></b></webwork:param>
                    </webwork:text> <webwork:text name="'admin.subtasks.manage.subtasks.here'">
                        <webwork:param name="'value0'"><a href="<webwork:url page="/secure/admin/ViewIssueTypes.jspa" />"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text>
                    </p>

                    <ul class="square">
                    <li><webwork:text name="'admin.subtasks.disable.sub.tasks'">
                        <webwork:param name="'value0'"><a href="<webwork:url page="DisableSubTasks!default.jspa"/>"></webwork:param>
                        <webwork:param name="'value1'"></a>
                        </webwork:param>
                    </webwork:text></li>
                    <br>
                    <webwork:if test="/translatable == true">
                        <li><webwork:text name="'admin.subtasks.translate.sub.tasks'">
                            <webwork:param name="'value0'"><a id="translate_sub_tasks" href="<webwork:url page="ViewTranslations!default.jspa"><webwork:param name="'issueConstantType'" value="'subTask'"/></webwork:url>"></webwork:param>
                            <webwork:param name="'value1'"></a></webwork:param>
                        </webwork:text></li>
                    </webwork:if>
                    <li><webwork:text name="'admin.subtasks.manage.sub.tasks.2'">
                        <webwork:param name="'value0'"><a href="<webwork:url page="/secure/admin/ViewIssueTypes.jspa" />"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text></li>
                    </ul>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.subtasks.status'">
                        <webwork:param name="'value0'"><b><font color="#990000"></webwork:param>
                        <webwork:param name="'value1'"><webwork:text name="'admin.common.words.off'"/></webwork:param>
                        <webwork:param name="'value2'"></font></b></webwork:param>
                    </webwork:text>
                    <br><br>
                    <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle>
                    <webwork:text name="'admin.subtasks.enable.sub.tasks'">
                        <webwork:param name="'value0'"><a id="enable_subtasks" href="<webwork:url page="EnableSubTasks.jspa"/>"><b></webwork:param>
                        <webwork:param name="'value1'"></b></a></webwork:param>
                    </webwork:text>
                </webwork:else>

        </page:applyDecorator>

        <webwork:if test="/subTasksIssueTypes != null && /subTasksIssueTypes/empty == false">
        <p>
            <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
                <table border="0" cellpadding="3" cellspacing="1" width=100%>
                    <tr bgcolor=#f0f0f0>
                        <td class="colHeaderLink">
                            <b><webwork:text name="'common.words.name'"/></b>
                        </td>
                        <td class="colHeaderLink">
                            <b><webwork:text name="'common.words.description'"/></b>
                        </td>
                        <td class="colHeaderLink">
                            <b><webwork:text name="'admin.common.words.icon'"/></b>
                        </td>
                        <webwork:if test="/subTasksEnabled == true">
                            <td class="colHeaderLink">
                                <b><webwork:text name="'admin.common.words.operation'"/></b>
                            </td>
                        </webwork:if>
                    </tr>

                    <webwork:property value="/subTasksIssueTypes">
                    <webwork:iterator value="." status="'status'">
                    <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                        <td valign=top><b><webwork:property value="string('name')"/></b><webwork:if test="../default(.) == true"> (<webwork:text name="'admin.common.words.default.small'"/>)</webwork:if></td>
                        <td valign=top><webwork:property value="string('description')"/></td>
                        <td valign=top align=center>
                        <webwork:component name="'issuetype'" template="constanticon.jsp">
                          <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                          <webwork:param name="'iconurl'" value="./string('iconurl')" />
                          <webwork:param name="'alt'"><webwork:property value="./string('name')" /></webwork:param>
                        </webwork:component>
                        </td>
                        <webwork:if test="/subTasksEnabled == true">
                            <td valign=top nowrap>
                                <a href="<webwork:url page="EditSubTaskIssueTypes!default.jspa"><webwork:param name="'id'" value="string('id')"/></webwork:url>"><webwork:text name="'common.words.edit'"/></a>

                                <%-- At least one sub-task issue type must exists - users can turn sub-tasks off if they do not want to
                                use them. Check that there is more tahn one sub-task issue type --%>
                                <webwork:if test="../size > 1">
                                    |
                                    <a id="del_<webwork:property value="string('name')"/>" href="<webwork:url page="DeleteSubTaskIssueType!default.jspa"><webwork:param name="'id'" value="string('id')"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
                                </webwork:if>

                                <webwork:if test="../default(.) == false">
                                |
                                <a href="<webwork:url page="MakeDefaultSubTask.jspa"><webwork:param name="'make'" value="string('id')" /></webwork:url>"><webwork:text name="'admin.common.words.default'"/></a>
                                </webwork:if>
                            </td>
                        </webwork:if>
                    </tr>
                    </webwork:iterator>
                    </webwork:property>
                </table>
            </td></tr></table>
        </p>
        </webwork:if>
        <webwork:if test="/subTasksEnabled == true">
            <p>
                <page:applyDecorator name="jiraform">
                    <page:param name="action">AddSubTaskIssueType.jspa</page:param>
                    <page:param name="submitId">add_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
                    <page:param name="title"><webwork:text name="'admin.subtasks.add.new.issue.type'"/></page:param>
                    <page:param name="width">100%</page:param>

                    <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" />

                    <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />

        <ui:component label="text('admin.globalsettings.lookandfeel.logo.url')" name="'iconurl'" template="textimagedisabling.jsp">
    	    <ui:param name="'imagefunction'">openWindow()</ui:param>
    	    <ui:param name="'size'">60</ui:param>
    	    <ui:param name="'description'"><webwork:text name="'admin.common.phrases.relative.to.jira'"/></ui:param>
        </ui:component>
                </page:applyDecorator>
            </p>
        </webwork:if>
   </p>
</body>
</html>
