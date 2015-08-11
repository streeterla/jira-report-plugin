<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- checkbox.jsp
  --
  -- Required Parameters:
  --   * label       - The description that will be used to identfy the control.
  --   * name        - The name of the attribute to put and pull the result from.
  --                   Equates to the NAME parameter of the HTML INPUT tag.
  --   * fieldValue  - The value displayed by the control.  Equates to the value
  --                   of the HTML INPUT tag.
  --
  -- Optional Parameters:
  --   * id              - sets the id of the HTML INPUT tag.
  --   * disabled        - DISABLED parameter of the HTML INPUT tag.
  --   * tabindex        - tabindex parameter of the HTML INPUT tag.
  --   * onchange        - onkeyup parameter of the HTML INPUT tag.
  --%>


<%@ taglib uri="webwork" prefix="webwork" %>
<%@ include file="/template/standard/controlheader.jsp" %>
<input type="checkbox" <webwork:if test="parameters['nameValue'] == true">checked="checked"</webwork:if>
       name="<webwork:property value="parameters['name']"/>"
       value="<webwork:property value="parameters['fieldValue']"/>"
     <webwork:property value="parameters['checked']">
        <webwork:if test=".">checked="checked"</webwork:if>
     </webwork:property>
     <webwork:property value="parameters['id']">
        <webwork:if test=".">id="<webwork:property value="." />"</webwork:if>
     </webwork:property>
     <webwork:property value="parameters['class']">
        <webwork:if test=".">class="<webwork:property value="." />"</webwork:if>
     </webwork:property>
     <webwork:property value="parameters['style']">
        <webwork:if test=".">style="<webwork:property value="." />"</webwork:if>
     </webwork:property>
     <webwork:property value="parameters['disabled']">
        <webwork:if test="{parameters['disabled']}">DISABLED</webwork:if>
     </webwork:property>
     <webwork:property value="parameters['tabindex']">
        <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
     </webwork:property>
     <webwork:property value="parameters['onchange']">
        <webwork:if test=".">onchange="<webwork:property value="."/>"</webwork:if>
     </webwork:property>
/>

<%@ include file="/template/standard/controlfooter.jsp" %>
