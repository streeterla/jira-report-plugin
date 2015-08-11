<%@ taglib uri="webwork" prefix="webwork" %>
<%@ include file="/template/standard/controlheader.jsp" %>

<webwork:iterator value="parameters">
	<li><webwork:property value="key" /> = <webwork:property value="value" /></li>
</webwork:iterator>

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
>

   <webwork:iterator value="parameters['list']">
      <option value="<webwork:property value="."/>" <webwork:if test="parameters['nameValue'] == .">SELECTED</webwork:if>>
            <webwork:property value="."/>
      </option>
   </webwork:iterator>

</select>

<%@ include file="/template/standard/controlfooter.jsp" %>
