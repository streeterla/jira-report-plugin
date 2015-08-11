<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.adduser.create.new.user'"/></title>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="description">
            <p><webwork:text name="'admin.adduser.enter.details.below'"/></p>
            <p><webwork:text name="'admin.adduser.if.you.do.not.enter.a.password'"/></p>
             <p><webwork:text name="'admin.adduser.user.will.be.notified.via.email'"/></p>
        </page:param>
        <page:param name="instructions">
        <webwork:if test="/hasReachedUserLimit == true">
                <div class="warningBox">
                    <webwork:text name="'admin.adduser.user.limit.warning'">
                        <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/admin/ViewLicense!default.jspa"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text>
                </div>
                <br>
            </webwork:if>

            <div class="infoBox">
            <webwork:text name="'admin.userbrowser.how.many.users'">
                <webwork:param name="'value0'"><webwork:property value="/userUtil/totalUserCount"/></webwork:param>
                <webwork:param name="'value1'"><webwork:property value="/userUtil/activeUserCount"/></webwork:param>
            </webwork:text>
            </div>
            <br>
        </page:param>
        <page:param name="title"><webwork:text name="'admin.adduser.create.new.user'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="action">AddUser.jspa</page:param>
        <page:param name="submitId">create_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.create'"/></page:param>
        <page:param name="cancelURI">UserBrowser.jspa</page:param>

        <ui:textfield label="text('common.words.username')" name="'username'" size="40" maxlength="255"/>
        <ui:password label="text('common.words.password')" name="'password'" size="40">
            <ui:param name="'autocomplete'" value="'off'"/>
        </ui:password>
        <ui:password label="text('common.forms.confirm')" name="'confirm'" size="40">
            <ui:param name="'autocomplete'" value="'off'"/>
        </ui:password>
        <ui:textfield label="text('common.words.fullname')" name="'fullname'" size="40" maxlength="255"/>
        <ui:textfield label="text('common.words.email')" name="'email'" size="40" maxlength="255"/>
        <webwork:if test="/applicationProperties/option('jira.option.user.externalpasswordmanagement') == false">
            <webwork:if test="/applicationProperties/option('jira.option.user.externalmanagement') == false">
                <ui:checkbox label="text('admin.adduser.send.password.email')" name="'sendEmail'" fieldValue="'true'">
                    <ui:param name="'description'">
                        <webwork:text name="'admin.adduser.send.password.email.description'">
                            <webwork:param name="'value0'"><br></webwork:param>
                        </webwork:text>
                    </ui:param>
                </ui:checkbox>
            </webwork:if>
        </webwork:if>

    </page:applyDecorator>
</body>
</html>
