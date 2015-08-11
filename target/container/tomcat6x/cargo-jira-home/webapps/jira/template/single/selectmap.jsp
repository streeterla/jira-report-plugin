<%@ taglib uri="webwork" prefix="webwork" %>
<%@ include file="/template/single/controlheader.jsp" %>
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
      <webwork:property value="parameters['size']">
         <webwork:if test=".">size="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
        <webwork:property value="parameters['id']">
         <webwork:if test=".">id="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
>
   <webwork:property value="parameters['headerrow']">
      <webwork:if test=". && . != ''"><option
		value="<webwork:property value="parameters['headervalue']" />"
		<webwork:if test="../parameters['headervalue'] == ../parameters['nameValue']">selected</webwork:if>
		><webwork:property value="parameters['headerrow']" /></option></webwork:if>
   </webwork:property>
   <webwork:property value="parameters['headerrow2']">
      <webwork:if test=". && . != ''"><option
		value="<webwork:property value="parameters['headervalue2']" />"
		<webwork:if test="../parameters['headervalue2'] == ../parameters['nameValue']">selected</webwork:if>
		><webwork:property value="parameters['headerrow2']" /></option></webwork:if>
   </webwork:property>

   <%-- Check if an explicit selected value has been specified --%>
   <webwork:if test="parameters['selectedValue']">
   <%-- If it has, compare each value to the specified selected value and if they are equal prit 'SELECTED' next to it --%>
   <webwork:iterator value="parameters['list']">
	  <option value="<webwork:property value="{parameters['listKey']}"/>" <webwork:if test="{parameters['listKey']} == parameters['selectedValue']">SELECTED</webwork:if>>
         <webwork:property value="{parameters['listValue']}"/>
      </option>
   </webwork:iterator>
   </webwork:if>
   <webwork:else>
   <%-- Otherwise use the 'nameValue' for xomparison and selection of the value in the list --%>
    <webwork:iterator value="parameters['list']">
	  <option value="<webwork:property value="{parameters['listKey']}"/>" <webwork:if test="{parameters['listKey']} == parameters['nameValue']">SELECTED</webwork:if>>
         <webwork:property value="{parameters['listValue']}"/>
      </option>
   </webwork:iterator>
   </webwork:else>
</select>
<%@ include file="/template/single/controlfooter.jsp" %>
