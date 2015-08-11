<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:ajax-favourite-control");
%>
<div id="fav_div_<webwork:property value="parameters['fieldId']"/>">
    <a id="fav_a_<webwork:property value="parameters['fieldId']"/>"
            class="fav-link enabled" title="<webwork:text name="'common.favourites.enabled.' +  parameters['entityType']"/>" href="#"><webwork:text name="'common.favourites.enabled.' +  parameters['entityType']"/></a>
</div>

<input id="fav_new_<webwork:property value="parameters['fieldId']" />" name="favourite" type="hidden" value="<webwork:if test="parameters['enabled'] == 'true'">true</webwork:if><webwork:else>false</webwork:else>"/>

<fieldset rel="<webwork:property value="parameters['fieldId']"/>" class="hidden favourite-params">
    <input type="hidden" id="remote" value="false">
    <input type="hidden" id="enabled" value="<webwork:if test="parameters['enabled'] == 'true'">true</webwork:if><webwork:else>false</webwork:else>">
    <input type="hidden" id="entityType" value="<webwork:property value="parameters['entityType']"/>">
    <input type="hidden" id="fieldId" value="<webwork:property value="parameters['fieldId']"/>">
    <input type="hidden" id="titleAdd" value="<webwork:text name="'common.favourites.enabled.' +  parameters['entityType']"/>"/>
    <input type="hidden" id="titleRemove" value="<webwork:text name="'common.favourites.disabled.' +  parameters['entityType']"/>"/>
</fieldset>
