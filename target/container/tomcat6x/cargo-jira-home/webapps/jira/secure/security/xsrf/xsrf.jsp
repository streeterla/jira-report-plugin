<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.jira.security.JiraAuthenticationContext" %>
<%@ page import="com.atlassian.jira.web.util.HelpUtil" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.atlassian.jira.security.xsrf.XsrfTokenGenerator" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><ww:text name="'xsrf.error.title'"/></title>
</head>
<body>
<%--here so func tests work --%>
<!-- SecurityTokenMissing -->

<div class="module xsrf">
    <div class="mod-header">
        <h3><ww:text name="'xsrf.error.long.title'"/></h3>
    </div>
    <div class="mod-content">

        <ww:if test="/noRequestParameters == true">
            <div class="notify error">
                <p>
                    <ww:text name="'xsrf.retry.noparameters'"/>
                </p>
            </div>
        </ww:if>

        <div class="notify warn">
            <p>
                <ww:text name="'xsrf.info.line.1'"/>
            </p>

            <p>
                <ww:text name="'xsrf.info.line.2'"/>
            </p>

            <p>
                <strong><ww:text name="'xsrf.info.admin.1'"/></strong>
                <ww:text name="'xsrf.info.admin.2'">
                    <ww:param name="'value0'"><a href="<ww:property value="@helpUtil/helpPath('xsrf')/url"/>"></ww:param>
                    <ww:param name="'value1'"></a></ww:param>
                </ww:text>
            </p>
            <p>
                <ww:text name="'xsrf.error.offending.action'"/> :
                <ww:property value="/action/actionName"/><ww:if test="/action/commandName != null">!<ww:property value="/action/commandName"/></ww:if>.jspa
            </p>
        </div>

        <ww:if test="@loggedin == true">
            <ww:if test="/noRequestParameters == false">
                <p>
                    <ww:text name="'xsrf.retry.note1'"/>
                </p>

                <p>
                    <em><ww:text name="'xsrf.retry.note2'"/></em>
                </p>

                <form action="<ww:property value="/requestURL"/>" method="<ww:property value="/requestMethod"/>">
                    <ww:iterator value="/requestParameters">
                        <ww:iterator value="./value">
                            <%--dont use the original atl_token--%>
                            <ww:if test="../key != 'atl_token'">
                                <ww:component name="../key" value="." template="hidden.jsp"/>
                            </ww:if>
                        </ww:iterator>
                    </ww:iterator>
                    <ww:component name="'atl_token'" value="@xsrfToken" template="hidden.jsp"/>
                    <input type="submit" name="atl_token_retry_button" value="<ww:text name="'xsrf.retry.button'"/>"/>
                </form>
            </ww:if>
        </ww:if>
        <ww:else>
            <p>
                <ww:text name="'xsrf.login.text'">
                    <ww:param name="'value0'"><a href="<ww:property value="@contextpath"/>/login.jsp"></ww:param>
                    <ww:param name="'value1'"></a></ww:param>
                </ww:text>
            </p>

            <h4><ww:text name="'xsrf.notlogin.captured.params'"/></h4>

            <p>
            <ul class="item-details">
                <ww:iterator value="/requestParameters">
                    <ww:iterator value="./value">
                        <%--dont use the original atl_token--%>
                        <ww:if test="../key != 'atl_token'">
                            <li>
                                <dl>
                                    <dt><ww:property value="../key"/></dt>
                                    <dd><ww:property value="."/></dd>
                                </dl>
                            </li>
                        </ww:if>
                    </ww:iterator>
                </ww:iterator>
            </ul>
            </p>
        </ww:else>
    </div>
</div>
</body>
</html>
