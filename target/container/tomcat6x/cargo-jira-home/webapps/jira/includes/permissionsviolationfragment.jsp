<%@ page import="com.atlassian.jira.util.JiraUtils" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<div id="main-content">
    <div class="active-area">
        <webwork:if test="remoteUser == null">
        <h2><webwork:text name="'login.required.title'"/></h2>
        <p class="notify warn"><webwork:text name="'login.required.desc1'"/></p>
        <p>
            <webwork:text name="'login.required.desc2'">
                <webwork:param name="'value0'"><jira:loginlink><webwork:text name="'login.required.login'"/></jira:loginlink></webwork:param>
            </webwork:text>
            <webwork:if test="/applicationProperties/option('jira.option.user.externalpasswordmanagement') == false">
            <webwork:if test="extUserManagement != true">
                <% if (JiraUtils.isPublicMode()) { %>
                <webwork:text name="'login.required.desc3'">
                    <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Signup!default.jspa"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
                <% } %>
            </webwork:if></webwork:if>.
        </p>
        <p>
        <webwork:text name="'contact.admin.for.perm'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
        </p>

        </webwork:if>
        <webwork:else>
        <h2><webwork:text name="'perm.violation.title'"/></h2>
        <p class="notify warn"><webwork:text name="'perm.violation.desc'"/></p>
        <p>
        <webwork:text name="'contact.admin.for.perm'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
        </p>
        </webwork:else>
        <webwork:if test="issueObjectNoSecurityCheck">
            <webwork:property value="issueObjectNoSecurityCheck">
            <%@ include file="/includes/trackback_rdf_min.jsp"%>
            </webwork:property>
        </webwork:if>
    </div>
</div>