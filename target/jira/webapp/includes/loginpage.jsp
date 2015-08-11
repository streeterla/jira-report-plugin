<%@ page import="com.atlassian.jira.ManagerFactory,
                 com.atlassian.jira.config.properties.APKeys"%>
<%@ page import="com.opensymphony.util.TextUtils" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<h2><webwork:text name="'login.welcome.to'"/> <%= TextUtils.htmlEncode(ManagerFactory.getApplicationProperties().getDefaultBackedString(APKeys.JIRA_TITLE))%></h2>
<%@ include file="/includes/loginform.jsp" %>