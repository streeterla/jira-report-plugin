<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:ajax-favourite-control");
%>
<div id="fav_div_<webwork:property value="parameters['tableId']"/>_<webwork:property value="parameters['entityType']" />_<webwork:property value="parameters['entityId']" />" rel="<webwork:property value="parameters['entityId']" />">
    <a id="fav_a_<webwork:property value="parameters['tableId']" />_<webwork:property value="parameters['entityType']" />_<webwork:property value="parameters['entityId']" />"
            class="fav-link enabled" title="<webwork:if test="parameters['enabled'] == 'true'"><webwork:text name="'common.favourites.enabled.' +  parameters['entityType']"/></webwork:if><webwork:else><webwork:text name="'common.favourites.disabled.' +  parameters['entityType']"/></webwork:else>" href="#">
        <webwork:if test="parameters['enabled'] == 'true'"><webwork:text name="'common.favourites.enabled.' +  parameters['entityType']"/></webwork:if><webwork:else><webwork:text name="'common.favourites.disabled.' +  parameters['entityType']"/></webwork:else></a>
</div>

<fieldset rel="<webwork:property value="parameters['tableId']"/>_<webwork:property value="parameters['entityType']" />_<webwork:property value="parameters['entityId']"/>" class="hidden favourite-params">
    <input type="hidden" id="enabled" value="<webwork:if test="parameters['enabled'] == 'true'">true</webwork:if><webwork:else>false</webwork:else>">
    <input type="hidden" id="tableId" value="<webwork:property value="parameters['tableId']" />">
    <input type="hidden" id="entityType" value="<webwork:property value="parameters['entityType']"/>">
    <input type="hidden" id="entityId" value="<webwork:property value="parameters['entityId']"/>">
    <webwork:if test="parameters['relatedDropdown']">
        <input type="hidden" id="relatedDropdown" value="<webwork:property value="parameters['relatedDropdown']"/>">
    </webwork:if>
    <input type="hidden" id="removeId" value="<webwork:property value="parameters['removeId']"/>">
    <input type="hidden" id="titleAdd" value="<webwork:text name="'common.favourites.enabled.' +  parameters['entityType']"/>"/>
    <input type="hidden" id="titleRemove" value="<webwork:text name="'common.favourites.disabled.' +  parameters['entityType']"/>"/>
    <webwork:if test="parameters['removeId']">
        <input type="hidden" id="undoText" value="<webwork:text name="'common.favourites.undo.' +  parameters['entityType']" />&nbsp;<a href='#'><webwork:text name="'common.favourites.undo'"/></a>"/>
        <input type="hidden" id="undoEntityName" value="<webwork:property value="parameters['entityName']"/>"/> 
    </webwork:if>
    <input type="hidden" id="errorMsg" value="<webwork:text name="'common.favourites.error.server'"/>"/>
</fieldset>

