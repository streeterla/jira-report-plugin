<%@ page import="com.atlassian.jira.util.JiraUtils"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<div id="main-content">
    <div class="active-area">
        <h2><webwork:text name="'generic.notloggedin.title'"/></h2>
        <webwork:if test="hasErrorMessages == 'true'">
                <webwork:iterator value="flushedErrorMessages">
                    <p class="notify error"><webwork:property /></p>
                </webwork:iterator>
        </webwork:if>
        <webwork:if test="remoteUser == null">
            <p>
                <webwork:text name="'generic.notloggedin.msg'"/>
            </p>

            <p>
            <webwork:text name="'generic.notloggedin.try.login'">
                <webwork:param name="'value0'"><jira:loginlink><webwork:text name="'common.words.login'"/></jira:loginlink></webwork:param>
                <webwork:param name="'value1'"></webwork:param>
            </webwork:text>
            <webwork:if test="extUserManagement != true">
                <% if (JiraUtils.isPublicMode()) { %>
                    <webwork:text name="'noprojects.signup'">
                        <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Signup!default.jspa"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text>
                <% } %>
            </webwork:if>
            </p>
        </webwork:if>
        <webwork:else>
            <p><webwork:text name="'generic.notloggedin.no.permission'"/></p>
        </webwork:else>
    </div>
</div>