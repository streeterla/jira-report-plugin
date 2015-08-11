<%@ page import="com.atlassian.jira.ComponentManager,
                 com.atlassian.jira.bc.security.login.LoginInfo,
                 com.atlassian.jira.bc.security.login.LoginReason,
                 com.atlassian.jira.bc.security.login.LoginResult,
                 com.atlassian.jira.bc.security.login.LoginService" %>
<%@ page import="com.atlassian.jira.config.properties.APKeys" %>
<%@ page import="com.atlassian.jira.config.properties.ApplicationProperties" %>
<%@ page import="com.atlassian.jira.util.JiraUtils" %>
<%@ page import="com.atlassian.seraph.filter.LoginFilter" %>
<%@ page import="com.opensymphony.util.TextUtils" %>
<%@ page import="com.atlassian.jira.bc.security.login.LoginLoggers" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib prefix="ui" uri="webwork" %>

<%
    final LoginService loginService = (LoginService) ComponentManager.getComponentInstanceOfType(LoginService.class);
    final ApplicationProperties applicationProperties = (ApplicationProperties) ComponentManager.getComponentInstanceOfType(ApplicationProperties.class);

    final boolean allowCookies = applicationProperties.getOption(APKeys.JIRA_OPTION_ALLOW_COOKIES);
    final boolean externalUsermanagerment = applicationProperties.getOption(APKeys.JIRA_OPTION_USER_EXTERNALMGT);
    final boolean externalPasswordManagement = applicationProperties.getOption(APKeys.JIRA_OPTION_USER_PASSWORD_EXTERNALMGT);
    final boolean publicSignUpAllowed = JiraUtils.isPublicMode();

    final Object authStatusKey = request.getAttribute(LoginFilter.OS_AUTHSTATUS_KEY);
    final LoginResult lastLoginResult = (LoginResult) request.getAttribute(LoginService.LOGIN_RESULT);

    
    final LoginInfo loginInfo = lastLoginResult == null ? null : lastLoginResult.getLoginInfo();
    final boolean isElevatedSecurityCheckShown = loginService.isElevatedSecurityCheckAlwaysShown() ||
            (loginInfo != null && loginInfo.isElevatedSecurityCheckRequired());

    final boolean failedAuthorisation = lastLoginResult != null && lastLoginResult.getReason() == LoginReason.AUTHORISATION_FAILED;
    final boolean failedElevatedSecurityCheck = lastLoginResult != null && lastLoginResult.getReason() == LoginReason.AUTHENTICATION_DENIED;

    if (LoginLoggers.LOGIN_PAGE_LOG.isDebugEnabled())
    {
        LoginLoggers.LOGIN_PAGE_LOG.debug("login.jsp called with lastLoginResult : " + String.valueOf(lastLoginResult));        
    }

%>
<form class="aui" name="loginform" method="POST" action="<%= request.getContextPath() %>/login.jsp">
    <fieldset>
        <div>
            <label accesskey="<webwork:text name="'alt.text.username.accessKey'"/>" for="usernameinput" id="usernamelabel"><webwork:text name="'alt.text.username'"/></label>
            <input type="text" tabindex="1" name="os_username" id="usernameinput" class="text medium-field" value="<webwork:property value="$os_username" />">
            <%
                if (publicSignUpAllowed)
                {
            %>
            <span class="description">
            <webwork:text name="'login.signup'">
                <webwork:param name="'value0'"><a id="signup" tabindex="6" href="<%= request.getContextPath() %>/secure/Signup!default.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
            </span>
            <% }
            else
            { %>
            <span class="description">
            <webwork:text name="'login.requestaccount'">
                <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
            </span>
            <% } %>
        </div>
        <div>
            <label accesskey="<webwork:text name="'alt.text.password.accessKey'"/>" for="os_password" id="passwordlabel"><webwork:text name="'alt.text.password'"/></label>
            <input type="password" tabindex="2" id="os_password" name="os_password" class="text medium-field">
        </div>
        <% if (isElevatedSecurityCheckShown)
        {%>
        <div id="captcha">
            <webwork:text name="'signup.captcha.text'"/>
            <p><input type="text" tabindex="4" id="os_captcha" name="os_captcha" class="text medium-field"/></p>
            <p><img src="<%=request.getContextPath() %>/captcha?ts=<%=System.currentTimeMillis()%>"/></p>
        </div>
        <% } %>

        <% if (allowCookies)
        { %>
        <div id="rememberme" class="checkbox">
            <input type="checkbox" tabindex="4" name="os_cookie" id="os_cookie_id" value="true">
            <label for="os_cookie_id" accesskey="<webwork:text name="'alt.text.rememberlogin.accessKey'"/>"><webwork:text name="'alt.text.rememberlogin'"/></label>
        </div>
        <% } %>
        <div class="submit">
            <%
            if (authStatusKey != null)
            {
                if (authStatusKey.equals(LoginFilter.LOGIN_FAILED))
                {
                    if (failedAuthorisation)
                    {
            %>
                <span class="error"><webwork:text name="'login.error.permission'">
                    <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text></span>
            <%
            }
            else
            {
            %>
                <span class="error">
                    <% if (failedElevatedSecurityCheck) { %>
                        <webwork:text name="'login.error.captcha.incorrect'"/>
                    <% } else { %>
                        <webwork:text name="'login.error.lpincorrect'"/>
                    <% } %>
                </span>
            <%
            }
            }
            else if (authStatusKey.equals(LoginFilter.LOGIN_ERROR))
            {
            %>
                <span class="error">Sorry, an error occurred trying to log you in - please try again.</span>
            <%
                }
            }
            %>
            <input type="submit" tabindex="5" value="<webwork:text name="'common.concepts.login'"/>" class="button" id="login">
            <% if (!externalUsermanagerment && !externalPasswordManagement)
            { %>
            <a  tabindex="7" href="<%= request.getContextPath() %>/secure/ForgotLoginDetails!default.jspa"><webwork:text name="'common.concepts.forgotpassword'"/></a>
            <% } %>
        </div>
    <input type="hidden" name="os_destination" value="<%= (request.getParameter("os_destination") == null ? "/secure/" : TextUtils.htmlEncode(request.getParameter("os_destination"))) %>">
    </fieldset>
</form>
<script language="javascript" type="text/javascript">
    jQuery(function() {
        jQuery('#usernameinput').focus();        
    })
</script>
