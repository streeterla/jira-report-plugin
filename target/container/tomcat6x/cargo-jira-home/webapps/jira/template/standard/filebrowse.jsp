<%@ page import="com.atlassian.core.util.FileSize"%>
<%@ page import="com.atlassian.jira.config.properties.APKeys"%>
<%@ page import="webwork.config.Configuration" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ include file="/template/standard/controlheader.jsp" %>

<input type="file"
       name="<webwork:property value="parameters['name']"/>"
       value="<webwork:property value="parameters['nameValue']"/>" <%-- NB - this will only work in opera.  IE & Mozilla both ignore it for security reasons --%>
       size="30"
>
<br><font size="1">
<webwork:text name="'attachfile.filebrowser.warning'">
    <webwork:param name="'value0'"><%= FileSize.format(new Long(Configuration.getString(APKeys.JIRA_ATTACHMENT_SIZE))) %></webwork:param>
</webwork:text></font>

<%@ include file="/template/standard/controlfooter.jsp" %>
