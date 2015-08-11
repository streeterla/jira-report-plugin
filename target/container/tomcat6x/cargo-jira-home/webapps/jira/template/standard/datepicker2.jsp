<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.jira.config.properties.APKeys" %>
<%@ page import="com.atlassian.jira.config.properties.ApplicationProperties" %>
<%@ page import="com.atlassian.jira.web.action.util.CalendarResourceIncluder" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Locale" %>
<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- textlabel.jsp
  --
  -- Required Parameters:
  --   * label      - The description that will be used to identfy the control.
  --   * name       - The name of the attribute to put and pull the result from.
  --
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in relation
  --                       to the control.  Default is to the left of the control.
  --
  --%>
<%@ taglib uri="webwork" prefix="webwork" %>
<jsp:include page="/template/standard/controlheader.jsp" />
<input id='date_<webwork:property value="parameters['name']"/>' type="text"
       name="<webwork:property value="parameters['name']"/>"
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
      <webwork:property value="parameters['class']">
         <webwork:if test=".">class="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
>
<%
    final ApplicationProperties appProperties = ComponentManager.getComponentInstanceOfType(ApplicationProperties.class);
    CalendarResourceIncluder calendarResourceIncluder = new CalendarResourceIncluder();
    Locale locale = ComponentManager.getInstance().getJiraAuthenticationContext().getI18nHelper().getLocale();
    if (calendarResourceIncluder.hasTranslation(locale))
    {
        calendarResourceIncluder.includeIfTranslated(locale);
%>
    <img id="<webwork:property value="parameters['name']"/>_trigger_c" src="<%= request.getContextPath() %>/images/icons/cal.gif" width="16" height="16" border="0" alt="Pick a date">

    <script type="text/javascript">
        Calendar.setup({
            firstDay                : <%= Calendar.getInstance(locale).getFirstDayOfWeek()-1 %>,              // first day of the week
            inputField              : "date_<webwork:property value="parameters['name']"/>",     // id of the input field
            button                  : "<webwork:property value="parameters['name']"/>_trigger_c",  // trigger for the calendar (button ID)
            align                   : "Tl",           // alignment (defaults to "Bl")
            singleClick             : true,
            useISO8601WeekNumbers   : <%= appProperties.getOption(APKeys.JIRA_DATE_TIME_PICKER_USE_ISO8061) %>, // use ISO8061 date/time standard
            <webwork:if test="parameters['showsTime'] == true">
            showsTime               : "true",
            ifFormat                : "<webwork:property value="/dateTimeFormat"/>",
            date                    : <%= System.currentTimeMillis() %>,
            timeFormat              : "<webwork:property value="/timeFormat"/>"
            </webwork:if>
            <webwork:else>
            ifFormat                : "<webwork:property value="/dateFormat"/>"      // our date only format
            </webwork:else>
        });
    </script>
<% } %>

<jsp:include page="/template/standard/controlfooter.jsp" />
