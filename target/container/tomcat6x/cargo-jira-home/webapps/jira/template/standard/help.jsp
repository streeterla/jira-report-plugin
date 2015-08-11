<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.jira.web.util.HelpUtil" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%-- Provides help on a topic. Sample usage:

    <webwork:component name="'navigatorviews'" template="help.jsp">
        <webwork:param name="'align'" value="'middle'"/>
    </webwork:component>

Code use:
    com.atlassian.jira.web.util.HelpUtil helpUtil = new com.atlassian.jira.web.util.HelpUtil(request.getRemoteUser(), request.getContextPath());
    request.setAttribute("helpUtil", helpUtil);
--%>

<%--<webwork:bean name="'com.atlassian.jira.web.util.HelpUtil'" id="helpUtil" />--%>
<%
    // pico tries to find a satisfiable constructor for HelpUtil, whilst none exists.  This is quite slow for performance reasons
    HelpUtil helpUtil = new HelpUtil();
    request.setAttribute("helpUtil", helpUtil);
%>

<webwork:property value="@helpUtil/helpPath(parameters['name'])">
    <webwork:if test="local"><%-- Open local help in a popup window --%>
        <a class="localHelp help-lnk" href="<webwork:url value="url"/>" onclick="var child = window.open('<webwork:url value="url"/>', 'jiraLocalHelp', 'width=600, height=500, resizable, scrollbars=yes'); child.focus(); return false;">
    </webwork:if>
    <webwork:else><%-- Open remote help (docs) in a new window --%>
            <a  class="help-lnk" href="<webwork:property value="url"/><webwork:property value="parameters['helpURLFragment']" />" target="_jirahelp">
    </webwork:else>
            <webwork:property value="parameters['linktext']">
                <webwork:if test=".">
                       <span class="link-text"><webwork:property value="."/></span>
                </webwork:if>
            </webwork:property>
            <img src="<%= ComponentManager.getInstance().getWebResourceManager().getStaticResourcePrefix() %>/images/icons/help_blue.gif" width="16" height="16"
            <%--if this is from a component then dont align right as it should be tight to the component--%>
            <webwork:if test="parameters['noalign'] != true">
                <webwork:property value="parameters['align']">
                    <webwork:if test=".">
                        align=<webwork:property value="."/>
                    </webwork:if>
                    <webwork:else>
                        align=right
                    </webwork:else>
                </webwork:property>
            </webwork:if>
            border="0" alt="<webwork:property value="alt" />"
            title="<webwork:if test="local"><webwork:text name="'local.help'"/></webwork:if><webwork:else><webwork:text name="'online.help'"/></webwork:else> <webwork:property value="title" />"/></a>

</webwork:property>
