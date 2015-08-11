<%@ page import="com.atlassian.jira.web.util.HelpUtil" %>
<% HelpUtil helpUtil = new HelpUtil();
   HelpUtil.HelpPath helpPath = helpUtil.getHelpPath("decodeparameters");
%>

<div class="noteBox">
    <webwork:text name="'admin.mailservers.mail.bad.props'">
        <webwork:param name="'value1'"><a href="<%=helpPath.getUrl()%>"/></webwork:param>
        <webwork:param name="'value2'"></a></webwork:param>
    </webwork:text>
</div>

