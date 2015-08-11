<%@ page import="webwork.util.ValueStack"%>
 <%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- select.jsp
  --
  -- Required Parameters:
  --   * label  - The description that will be used to identfy the control.
  --   * name   - The name of the attribute to put and pull the result from.
  --              Equates to the NAME parameter of the HTML SELECT tag.
  --   * list   - Iterator that will provide the options for the control.
  --              Equates to the HTML OPTION tags in the SELECT and supplies
  --              both the NAME and VALUE parameters of the OPTION tag.
  --
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in relation
  --                       to the control.  Default is to the left of the control.
  --   * disabled        - DISABLED parameter of the HTML SELECT tag.
  --   * tabindex        - tabindex parameter of the HTML SELECT tag.
  --   * onchange        - onkeyup parameter of the HTML SELECT tag.
  --
  --%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ include file="/template/standard/controlheader.jsp" %>
<select name="<webwork:property value="parameters['name']"/>"
      <webwork:property value="parameters['disabled']">
         <webwork:if test="{parameters['disabled']}">DISABLED</webwork:if>
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

   <webwork:property value="parameters['headerrow']">
      <webwork:if test=". && . != ''"><option
		value="<webwork:property value="parameters['headervalue']" />"
		<webwork:if test="../parameters['headerrow'] == ../parameters['nameValue']">selected</webwork:if>
		><webwork:property value="parameters['headerrow']" /></option></webwork:if>
   </webwork:property>
   <webwork:iterator value="parameters['list']">
      <option value="<webwork:property value="."/>" <webwork:if test="parameters['nameValue'] == .">SELECTED</webwork:if>>
            <webwork:property value="."/>
      </option>
   </webwork:iterator>
</select>

<%@ include file="/template/standard/controlfooter.jsp" %>
