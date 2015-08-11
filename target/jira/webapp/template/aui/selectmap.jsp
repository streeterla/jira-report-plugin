<%@ taglib uri="webwork" prefix="webwork" %>
<jsp:include page="/template/aui/controlheader.jsp" />

<select name="<webwork:property value="parameters['name']"/>"
    <webwork:property value="parameters['id']">
       <webwork:if test=".">id="<webwork:property value="."/>"</webwork:if>
    </webwork:property>
    <webwork:property value="parameters['disabled']">
     <webwork:if test="{parameters['disabled']}">DISABLED</webwork:if>
    </webwork:property>
    <webwork:property value="parameters['tabindex']">
     <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
    </webwork:property>
    <webwork:property value="parameters['style']">
     <webwork:if test=".">style="<webwork:property value="."/>"</webwork:if>
    </webwork:property>
    <webwork:property value="parameters['class']">
     <webwork:if test=".">class="<webwork:property value="."/>"</webwork:if>
    </webwork:property>
    <webwork:property value="parameters['size']">
     <webwork:if test=".">size="<webwork:property value="."/>"</webwork:if>
    </webwork:property>
    <webwork:property value="parameters['title']">
     <webwork:if test=".">title="<webwork:property value="."/>"</webwork:if>
    </webwork:property>
>
   <webwork:property value="parameters['headerrow']">
      <webwork:if test=". && . != ''"><option
		value="<webwork:property value="parameters['headervalue']" />"
		<webwork:if test="../parameters['headervalue'] == ../parameters['nameValue']">selected</webwork:if>
		><webwork:property value="parameters['headerrow']" /></option></webwork:if>
   </webwork:property>

   <%-- Check if an explicit selected value has been specified --%>
   <webwork:if test="parameters['selectedValue']">
       <webwork:property value="parameters['selectedValue']" id="selectedValue" />
   </webwork:if>
   <webwork:else>
       <webwork:property value="parameters['nameValue']" id="selectedValue" />
   </webwork:else>

   <%-- If it has, compare each value to the specified selected value and if they are equal print 'SELECTED' next to it --%>
   <webwork:iterator value="parameters['list']">
	  <option value="<webwork:property value="{parameters['listKey']}"/>" <webwork:if test="{parameters['listKey']} == @selectedValue">SELECTED</webwork:if>
              <webwork:property value="parameters['optionIcon']"><webwork:if test="."> class="imagebacked" style="background-image: url(<webwork:url value="../{.}" />);"</webwork:if></webwork:property>
              <webwork:property value="parameters['optionTitle']"><webwork:if test="."> title="<webwork:property value="../{.}" />"</webwork:if></webwork:property>
              <webwork:if test="parameters['showOptionId']">id="<webwork:property value="parameters['name']" />_select_<webwork:property value="{parameters['listKey']}" />"</webwork:if>
              >
        <webwork:if test="parameters['internat'] == true"><webwork:text name="{parameters['listValue']}"/></webwork:if>
        <webwork:else><webwork:property value="{parameters['listValue']}"/></webwork:else>
      </option>
   </webwork:iterator>
</select>

<jsp:include page="/template/aui/controlfooter.jsp" />
