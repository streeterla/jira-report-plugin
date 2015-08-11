<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.jira.bc.JiraServiceContext" %>
<%@ page import="com.atlassian.jira.bc.JiraServiceContextImpl" %>
<%@ page import="com.atlassian.jira.bc.user.search.UserPickerSearchService" %>
<%@ page import="com.atlassian.jira.security.JiraAuthenticationContext" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%--
-- userselect.jsp
--
-- Required Parameters:
--   * label      - The description that will be used to identfy the control.
--   * name       - The name of the attribute to put and pull the result from.
--   * formname   - The name of the form on which the control is to be placed. This is so the value can be returned
--   * userMode   - What mode of users should be returned. 1 = All users 2= Assignable Users etc

-- Optional Parameters:
--   * imageName   - determines what the image of the userselect will be called

--   * labelposition   - determines were the label will be place in relation
--                       to the control.  Default is to the left of the control.
--   * size       - SIZE parameter of the HTML INPUT tag.
--   * maxlength  - MAXLENGTH parameter of the HTML INPUT tag.
--   * disabled   - DISABLED parameter of the HTML INPUT tag.
--   * readonly   - READONLY parameter of the HTML INPUT tag.
--   * onkeyup    - onkeyup parameter of the HTML INPUT tag.
--   * onfocus    - onfocus parameter of the HTML INPUT tag.
--   * onchange  - onkeyup parameter of the HTML INPUT tag.
--   * tabindex  - tabindex parameter of the HTML INPUT tag.
--%>

<%--  Multi-Select User Picker

  -- set paramater 'multiSelect' to true to enable multi-select

  -- Required Parameters:
  --   * col      - The textarea number of columns to display.
  --   * row       - The textarea number of rows to display.
  --   * name   - The name of the form on which the control is to be placed. This is so the value can be returned
  --   * formname   - The name of the form on which the control is to be placed. This is so the value can be returned
  --   * userMode   - What mode of users should be returned. 1 = All users 2= Assignable Users etc
  --   * multiSelect   - Enables selection of multiple users
--%>

<%-- NOTE - ANY CHANGES TO THIS FILE - ALSO UPDATE pickertable.vm --%>

<%@ taglib uri="webwork" prefix="webwork" %>

 <%
     // Only include extra web resources (css, js) if Ajax Issue Picker turned on

    JiraAuthenticationContext authenticationContext = ComponentManager.getInstance().getJiraAuthenticationContext();
    JiraServiceContext ctx = new JiraServiceContextImpl(authenticationContext.getUser());
    UserPickerSearchService searchService = (UserPickerSearchService) ComponentManager.getComponentInstanceOfType(UserPickerSearchService.class);

    boolean canPerformAjaxSearch = searchService.canPerformAjaxSearch(ctx);
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:autocomplete");
 %>

<fieldset rel="<webwork:property value="parameters['name']"/>" class="hidden user-picker-params">
    <input type="hidden" id="formName" value="<webwork:property value="parameters['formname']" />">
    <input type="hidden" id="fieldName" value="<webwork:property value="parameters['name']" />">
    <input type="hidden" id="multiSelect" value="<webwork:if test="parameters['multiSelect'] == true">true</webwork:if><webwork:else>false</webwork:else>">
    <% if (canPerformAjaxSearch) { %><input type="hidden" id="userPickerEnabled" value="true"><% } %>    
</fieldset>

<div class="ajax_autocomplete" id="<webwork:property value="parameters['name']"/>_container">
<webwork:if test="parameters['multiSelect'] == true">
    <textarea name="<webwork:property value="parameters['name']"/>" cols="<webwork:property value="parameters['cols']"/>" rows="<webwork:property value="parameters['rows']"/>" id="<webwork:property value="parameters['name']"/>"
        <webwork:property value="parameters['disabled']">
            <webwork:if test="{parameters['disabled']}">DISABLED</webwork:if>
        </webwork:property>
        <webwork:property value="parameters['readonly']">
            <webwork:if test="{parameters['readonly']}">READONLY</webwork:if>
        </webwork:property>
    ></textarea>
</webwork:if>
<webwork:else>
<input type="text"
       name="<webwork:property value="parameters['name']"/>"
        id="<webwork:property value="parameters['name']"/>"
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
      <webwork:property value="parameters['onfocus']">
         <webwork:if test=".">onfocus="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['style']">
         <webwork:if test=".">style="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['class']">
         <webwork:if test=".">class="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
/></webwork:else>
<webwork:property value="parameters['disabled']">
    <webwork:if test="hasPermission('pickusers') == true">
    <a class="popup-trigger" href="#"><img <webwork:if test="parameters['multiSelect'] == true"> title="<webwork:text name="'user.picker.select.users'"/>" alt="<webwork:text name="'user.picker.select.users'"/>"</webwork:if><webwork:else> title="<webwork:text name="'user.picker.select.user'"/>" alt="<webwork:text name="'user.picker.select.user'"/>"</webwork:else>
            <webwork:property value="parameters['imageName']">
            <webwork:if test=".">name="<webwork:property value="."/>" </webwork:if>
            <webwork:else> name="assigneeImage" </webwork:else>
            src="<%=request.getContextPath()%>/images/icons/filter_public.gif" hspace="0" height="16" width="16" border="0" style="vertical-align:top"></a>
            </webwork:property>
    </webwork:if>
    <webwork:else>
        <img title="<webwork:text name="'user.picker.no.permission'"/>" src="<%= request.getContextPath()%>/images/icons/userpicker_disabled.gif" hspace="0" height="16" width="16" border="0" alt="" style="vertical-align:top"/>
    </webwork:else>
</webwork:property>
<% if (canPerformAjaxSearch) { %><div id="<webwork:property value="parameters['name']"/>_results" class="ajax_results"></div><font size="1"><webwork:text name="'user.picker.ajax.desc'"/></font><% } %>
</div>