<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ page import="com.atlassian.jira.config.properties.APKeys" %>
<%@ page import="com.atlassian.jira.config.properties.ApplicationProperties" %>
<%@ taglib uri="webwork" prefix="webwork" %>

<%
    // Only include extra web resources (css, js) if Ajax Issue Picker turned on
    ApplicationProperties applicationProperties= ComponentManager.getInstance().getApplicationProperties();
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:autocomplete");
%>

<div class="ajax_autocomplete" id="<webwork:property value="parameters['name']"/>_container">
      <input type="text" name="<webwork:property value="parameters['name']"/>" id="<webwork:property value="parameters['name']"/>"
      <webwork:property value="parameters['size']">
         <webwork:if test=".">size="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['maxlength']">
         <webwork:if test=".">maxlength="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['nameValue']">
         <webwork:if test=".">value="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['disabled']">
         <webwork:if test="{parameters['disabled']}">DISABLED</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['readonly']">
         <webwork:if test="{parameters['readonly']}">READONLY</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['onkeyup']">
         <webwork:if test=".">onkeyup="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['tabindex']">
         <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['onchange']">
         <webwork:if test=".">onchange="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['style']">
         <webwork:if test=".">style="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      />
    <a class="popup-trigger" href="#" title="Quick link to recently viewed issues">[<webwork:text name="'linkissue.picker.selectissue'"/>]</a>
    <div id="<webwork:property value="parameters['name']"/>_results" class="ajax_results"></div>
    <webwork:if test="applicationProperties/option('jira.ajax.autocomplete.issuepicker.enabled') == true">
        <div class="small"><webwork:text name="'linkissue.picker.desc'"/></div>
    </webwork:if>
    <webwork:if test="parameters['sameProjectMessage'] == true">
        <div class="small"><webwork:text name="'linkissue.picker.desc.same.project'">
            <webwork:param name="'value0'"><webwork:property value="parameters['selectedProjectKey']"/></webwork:param>
        </webwork:text></div>
    </webwork:if>
</div>

<fieldset rel="<webwork:property value="parameters['name']"/>" class="hidden issue-picker-params">
    <input type="hidden" id="formName" value="<webwork:property value="parameters['formname']" />">
    <input type="hidden" id="fieldName" value="<webwork:property value="parameters['name']"/>">
    <input type="hidden" id="currentIssueKey" value="<webwork:property value="parameters['currentissue']"/>">
    <webwork:property value="parameters['currentJQL']">
        <webwork:if test=".">
            <input type="hidden" id="currentJQL" value="<webwork:property value="."/>">
        </webwork:if>
    </webwork:property>
    <input type="hidden" id="singleSelectOnly" value="<webwork:property value="parameters['singleSelectOnly']"><webwork:if test="."><webwork:property value="."/></webwork:if><webwork:else>false</webwork:else></webwork:property>">
    <input type="hidden" id="showSubTasks" value="<webwork:property value="parameters['showSubTasks']"><webwork:if test="."><webwork:property value="."/></webwork:if><webwork:else>true</webwork:else></webwork:property>">
    <input type="hidden" id="showSubTaskParent" value="<webwork:property value="parameters['showSubTasksParent']"><webwork:if test="."><webwork:property value="."/></webwork:if><webwork:else>true</webwork:else></webwork:property>">
    <input type="hidden" id="currentProjectId" value="<webwork:property value="parameters['selectedProjectId']"><webwork:if test="."><webwork:property value="."/></webwork:if></webwork:property>">
    <input type="hidden" id="issuePickerEnabled" value="<webwork:if test="applicationProperties/option('jira.ajax.autocomplete.issuepicker.enabled') == true">true</webwork:if><webwork:else>false</webwork:else>">   
</fieldset>