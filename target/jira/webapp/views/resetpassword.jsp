<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'resetpassword.title'"/></title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'resetpassword.title'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="action">ResetPassword.jspa</page:param>
    <webwork:if test="/tokenInvalid == false && /tokenTimedOut == false">
        <page:param name="submitId">reset_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.common.words.reset'"/></page:param>
    </webwork:if>
    <page:param name="instructions">
        <webwork:if test="/tokenInvalid == true || /tokenTimedOut == true">
            <webwork:if test="/tokenTimedOut == true">
                <div class="errorBox">
                    <p><webwork:text name="'resetpassword.error.token.timedout'"/></p>

                    <p>
                        <a href="ForgotLoginDetails!default.jspa"><webwork:text name="'resetpassword.error.get.new.token'"/></a>
                    </p>
                </div>
            </webwork:if>
            <webwork:if test="/tokenInvalid == true">
                <div class="errorBox">
                    <p><webwork:text name="'resetpassword.error.invalid.token'"/></p>

                    <p>
                        <a href="ForgotLoginDetails!default.jspa"><webwork:text name="'resetpassword.error.get.new.token'"/></a>
                    </p>
                </div>
            </webwork:if>
        </webwork:if>
        <webwork:else>
            <p><webwork:text name="'resetpassword.instructions.line1'">
                <webwork:param name="'value0'"><webwork:property value="/os_username"/></webwork:param>
            </webwork:text>

            </p>
        </webwork:else>
    </page:param>


    <webwork:if test="/tokenInvalid == false && /tokenTimedOut == false">
        <ui:component name="'os_username'" value="/os_username" template="hidden.jsp" theme="'single'"/>
        <ui:component name="'token'" value="/token" template="hidden.jsp" theme="'single'"/>

        <ui:password label="text('resetpassword.password')" name="'password'" size="40"/>
        <ui:password label="text('resetpassword.confirm')" name="'confirm'" size="40"/>
    </webwork:if>
</page:applyDecorator>
</body>
</html>
