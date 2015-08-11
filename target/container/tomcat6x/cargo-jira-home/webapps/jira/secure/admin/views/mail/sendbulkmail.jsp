<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.email.send.email'"/></title>
    <script type="text/javascript">
        function showGroups()
        {
            var rolesTable = document.getElementById("rolesTable");
            var groupsTable = document.getElementById("groupsTable");
            rolesTable.style.display = 'none';
            groupsTable.style.display = '';
        }
        function showProjectRoles()
        {
            var rolesTable = document.getElementById("rolesTable");
            var groupsTable = document.getElementById("groupsTable");
            rolesTable.style.display = '';
            groupsTable.style.display = 'none';
        }
    </script>
</head>
<body>
<table width="100%" cellpadding="10" cellspacing="0" border="0">
    <tr>
        <td>
            <webwork:if test="/hasMailServer == true">
                <page:applyDecorator name="jiraform">
                    <page:param name="action">SendBulkMail.jspa</page:param>
                    <page:param name="cancelURI">ViewProjects.jspa</page:param>
                    <page:param name="submitId">send_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'admin.email.send'"/></page:param>
                    <page:param name="autoSelectFirst">false</page:param>
                    <page:param name="title"><webwork:text name="'admin.email.send.email'"/></page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="description">
                        <p><webwork:text name="'admin.email.description'"/></p>
                        <p>
                            <webwork:text name="'admin.email.select.recipients'"/><br>
                            <webwork:text name="'admin.email.note'"/>
                        </p>
                    </page:param>
                    <webwork:component template="textlabel.jsp" label="text('admin.email.from')" value="remoteUser/email" />
                    <ui:component label="'To'" name="'sendToRoles'" value="'sendToRoles'" template="radiotruefalse.jsp">
                        <ui:param name="'mandatory'" value="'true'"/>
                        <ui:param name="'checkRadio'" value="sendToRoles"/>
                        <ui:param name="'trueLabel'" value="text('common.words.project.roles')"/>
                        <ui:param name="'onclickTrue'">showProjectRoles(); return true;</ui:param>
                        <ui:param name="'falseLabel'" value="text('common.words.groups')"/>
                        <ui:param name="'onclickFalse'">showGroups(); return true;</ui:param>
                        <ui:param name="'fieldBody'">
                            <table id="rolesTable" <webwork:if test="sendToRoles == false">style="display: none;"</webwork:if>>
                            <tr>
                                <td>
                                    <ui:select label="text('admin.email.send.to.projects')" name="'projects'" list="allProjects" listKey="'string('id')'" listValue="'string('name')'" template="selectmultiple.jsp" theme="'single'">
                                        <ui:param name="'headeroptgroup'" value="text('admin.email.send.to.projects')"/>
                                        <ui:param name="'id'" value="'projects'"/>
                                        <ui:param name="'mandatory'" value="'true'"/>
                                        <ui:param name="'size'"><webwork:property value="/projectsRolesFieldSize"/></ui:param>
                                    </ui:select>
                                </td>
                                <td>
                                    <ui:select label="text('common.words.project.roles')" name="'roles'" list="allRoles" listKey="'id'" listValue="'name'" template="selectmultiple.jsp" theme="'single'">
                                        <ui:param name="'headeroptgroup'" value="text('admin.email.send.to.project.roles')"/>
                                        <ui:param name="'id'" value="'roles'"/>
                                        <ui:param name="'mandatory'" value="'true'"/>
                                        <ui:param name="'size'"><webwork:property value="/projectsRolesFieldSize"/></ui:param>
                                    </ui:select>
                                </td>
                            </tr>
                            </table>
                            <table id="groupsTable" <webwork:if test="sendToRoles == true">style="display: none;"</webwork:if>>
                            <tr>
                                <td>
                                    <ui:select label="text('common.words.groups')" name="'groups'" list="allGroups" listKey="'name'" listValue="'name'" template="selectmultiple.jsp" theme="'single'">
                                        <ui:param name="'headeroptgroup'" value="text('admin.email.send.to.groups')"/>
                                        <ui:param name="'id'" value="'groups'"/>
                                        <ui:param name="'mandatory'" value="'true'"/>
                                        <ui:param name="'size'"><webwork:property value="/groupsFieldSize"/></ui:param>
                                    </ui:select>
                                </td>
                            </tr>
                            </table>
                        </ui:param>
                    </ui:component>

                    <ui:textfield label="text('admin.email.reply.to')" name="'replyTo'" size="60">
                        <ui:param name="'mandatory'" value="'false'"/>
                        <ui:param name="'description'"><webwork:text name="'admin.email.reply.to.description'"/></ui:param>
                    </ui:textfield>
                    <ui:textfield label="text('admin.email.subject')" name="'subject'" size="60">
                        <ui:param name="'mandatory'" value="'true'"/>
                    </ui:textfield>
                    <ui:textarea label="text('admin.email.body')" name="'message'" cols="70" rows="8" >
                        <ui:param name="'mandatory'" value="'true'"/>
                        <ui:param name="'description'"><webwork:text name="'admin.email.body.description'"/></ui:param>
                    </ui:textarea>
                    <ui:select label="text('admin.email.message.type')" name="'messageType'" list="mimeTypes" listKey="'key'" listValue="'value'" value="applicationProperties/defaultBackedString('user.notifications.mimetype')">
                        <ui:param name="'description'"><webwork:text name="'admin.email.message.type.description'"/></ui:param>
                    </ui:select>
                    <ui:checkbox label="text('admin.email.bcc')" name="'sendBlind'" fieldValue="'true'">
                        <ui:param name="'description'"><webwork:text name="'admin.email.bcc.description'"/></ui:param>
                    </ui:checkbox>
                </page:applyDecorator>
            </webwork:if>
            <webwork:else>
                <page:applyDecorator name="jiraform">
                    <page:param name="action">ViewProjects.jspa</page:param>
                    <page:param name="submitId">ok_submit</page:param>
                    <page:param name="submitName"><webwork:text name="'admin.common.words.ok'"/></page:param>
                    <page:param name="autoSelectFirst">false</page:param>
                    <page:param name="title"><webwork:text name="'admin.email.send.email'"/></page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="description">
                        <p><webwork:text name="'admin.email.you.can.send'"/></p>
                        <p>
                            <webwork:if test="/systemAdministrator == true">
                                <webwork:text name="'admin.email.to.configure.mail.server'">
                                    <webwork:param name="'value0'"><a id="configure_mail_server" href="ViewMailServers.jspa"></webwork:param>
                                    <webwork:param name="'value1'"></a></webwork:param>
                                </webwork:text>
                            </webwork:if>
                            <webwork:else>
                                <webwork:text name="'admin.email.to.configure.mail.server.admin'">
                                    <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                                    <webwork:param name="'value1'"></a></webwork:param>
                                </webwork:text>
                            </webwork:else>
                        </p>
                    </page:param>
                </page:applyDecorator>
            </webwork:else>
        </td>
    </tr>
</table>
</body>
</html>
