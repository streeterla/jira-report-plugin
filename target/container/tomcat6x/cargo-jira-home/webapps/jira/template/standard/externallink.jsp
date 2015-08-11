<%@ page import="com.atlassian.jira.web.util.ExternalLinkUtilImpl,com.atlassian.jira.web.util.ExternalLinkUtil"%><%@ taglib uri="webwork" prefix="webwork" %><%--
    Allows lookup of a simple external link. Sample usage:
    <webwork:component name="'external.link.confluence.product.site'" template="externallink.jsp" >
        <webwork:param name="'value0'">xxx</webwork:param>
        <webwork:param name="'value1'">yyy</webwork:param>
        <webwork:param name="'value2'">zzz</webwork:param>
        <webwork:param name="'value3'">aaa</webwork:param>
    </webwork:component>">

    Sample in code usage:
      com.atlassian.jira.web.util.ExternalLinkUtil externalLinkUtil = com.atlassian.jira.web.util.ExternalLinkUtilImpl.getInstance();
      request.setAttribute("externalLinkUtil", externalLinkUtil);
      externalLinkUtil.getProperty("external.link.confluence.product.site");

    The params, value0-3, allow you to put replacement tokens into the string with the syntax {0} - {3}.
--%><%
    ExternalLinkUtil externalLinkUtil = ExternalLinkUtilImpl.getInstance();
    request.setAttribute("externalLinkUtil", externalLinkUtil);
%><webwork:if test="parameters['value0'] != true"><webwork:if test="parameters['value1'] != true"><webwork:if test="parameters['value2'] != true"><webwork:if test="parameters['value3'] != true"><webwork:property value="@externalLinkUtil/property(parameters['name'], parameters['value0'], parameters['value1'], parameters['value2'], parameters['value3'])" /></webwork:if><webwork:else><webwork:property value="@externalLinkUtil/property(parameters['name'], parameters['value0'], parameters['value1'], parameters['value2'])" /></webwork:else></webwork:if><webwork:else><webwork:property value="@externalLinkUtil/property(parameters['name'], parameters['value0'], parameters['value1'])" /></webwork:else></webwork:if><webwork:else><webwork:property value="@externalLinkUtil/property(parameters['name'], parameters['value0'])" /></webwork:else></webwork:if><webwork:else><webwork:property value="@externalLinkUtil/property(parameters['name'])" /></webwork:else>
