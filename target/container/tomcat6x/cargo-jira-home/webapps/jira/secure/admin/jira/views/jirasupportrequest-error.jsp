<%@ page import="com.atlassian.jira.web.util.ExternalLinkUtilImpl" %>
<%@ page import="com.atlassian.jira.web.util.ExternalLinkUtil" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.supportrequest.error.title'"/></title>
</head>

<body>
<%
    ExternalLinkUtil externalLinkUtil = new ExternalLinkUtilImpl();
%>
<table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.supportrequest.error.title'"/></page:param>
        <webwork:if test="/invalidAddresses">
            <p>
                <webwork:text name="'admin.supportrequest.bad.addresses'">
                    <webwork:param name="'value0'"><webwork:property value="/invalidAddresses"/></webwork:param>
                </webwork:text>
            </p>
        </webwork:if>
        <webwork:else>
            <p>
                <webwork:text name="'admin.supportrequest.error.desc'" />
            </p>
        </webwork:else>
        <p><webwork:text name="'admin.supportrequest.bad.addresses2'" /></p>
        <p> <webwork:text name="'admin.supportrequest.error.manual.create'" >
            <webwork:param name="'value0'"><a href="<%= externalLinkUtil.getProperty("external.link.jira.support.site") %>"><%= externalLinkUtil.getProperty("external.link.jira.support.site") %></a></webwork:param>
            </webwork:text>
        </p>

        <p>- <webwork:text name="'admin.supportrequest.atlassian.team'"/></p>
    </page:applyDecorator>
</table>

</body>
</html>
