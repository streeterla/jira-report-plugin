<%@ page import="com.atlassian.jira.util.BrowserUtils" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>
<%@ taglib prefix="webwork" uri="webwork" %>

<decorator:usePage id="p" />

<%
    request.setAttribute("modifierKey", BrowserUtils.getModifierKey());
%>

<form id="<decorator:getProperty property="id" default="auiform" />" action="<decorator:getProperty property="action" />" class="aui<% if (p.isPropertySet("theme")) { %> <decorator:getProperty property="theme" /><% } %>" method="<decorator:getProperty property="method" default="post" />" name="<decorator:getProperty property="formName" default="jiraform" />" <% if (p.isPropertySet("multipart")) { %> ENCTYPE="multipart/form-data"<% } %>>

    <% if (p.isPropertySet("title") && StringUtils.isNotBlank(p.getProperty("title"))) { %>
        <h2><decorator:getProperty property="title" /></h2>
    <% } %>

    <% if (StringUtils.isNotBlank(p.getProperty("description"))) { %>
        <div class="auidescription"><decorator:getProperty property="description" /></div>
    <% } %>

    <decorator:body />
    <webwork:component name="'atl_token'" value="/xsrfToken" template="hidden.jsp"/>

    <div class="submit<% if (!p.isPropertySet("submitName")) { %> cancel-only<% } %>">
        <% if (p.isPropertySet("submitName")) { %>
            <input type="submit" class="submit_btn"
                    name="<decorator:getProperty property="submitName" />"
                    accesskey="<webwork:text name="'common.forms.submit.accesskey'"/>"
                    title="<webwork:text name="'common.forms.submit.tooltip'">
                       <webwork:param name="'value0'"><webwork:text name="'common.forms.submit.accesskey'"/></webwork:param>
                       <webwork:param name="'value1'"><webwork:property value="@modifierKey"/></webwork:param>
                    </webwork:text>"
                    value="<decorator:getProperty property="submitName" />" id="<decorator:getProperty property="id" />_submit">
        <% } %>
        <% if (p.isPropertySet("cancelURI")) { %>
            <a id="<decorator:getProperty property="id" default="auiform" />_cancel" class="cancel"
                   accesskey="<webwork:text name="'common.forms.cancel.accesskey'" />"
                   title="<webwork:property value="text('common.forms.cancel')"/> (<webwork:property value="@modifierKey"/> + <webwork:text name="'common.forms.cancel.accesskey'" />)"
                   value="<webwork:property value="text('common.forms.cancel')"/>"
                   href="<webwork:if test="/returnUrl != null"><webwork:if test="/returnUrl/startsWith('/') == true"><%= request.getContextPath() %></webwork:if><webwork:property value="/returnUrl" /></webwork:if><webwork:else><decorator:getProperty property="cancelURI" /></webwork:else>"
            ><webwork:property value="text('common.forms.cancel')"/></a>
        <% } %>
    </div>

</form>
