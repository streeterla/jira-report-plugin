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
<jsp:include page="/template/single/controlheader.jsp" />
<input type="text"
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
      <webwork:property value="parameters['onfocus']">
         <webwork:if test=".">onfocus="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['style']">
         <webwork:if test=".">style="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['class']">
         <webwork:if test=".">class="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
>
<a href="javascript:show_calendar('<%= request.getContextPath() %>', '<webwork:property value="parameters['formname']" />', document.<webwork:property value="parameters['formname']" />, '<webwork:property value="parameters['name']" />');"><img src="<%= request.getContextPath() %>/images/icons/cal.gif" width="16" height="16" border="0" alt="<webwork:text name="'date.picker.select.date'"/>" title="<webwork:text name="'date.picker.select.date'"/>"></a>
<jsp:include page="/template/single/controlfooter.jsp" />
