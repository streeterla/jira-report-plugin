<%@ taglib uri="webwork" prefix="webwork" %>
<jsp:include page="/template/standard/controlheader.jsp" />

<webwork:if test="!@summaryCounter">
<webwork:property value="0" id="summaryCounter" />
</webwork:if>

<webwork:property value="parameters['summary']" id="summary" />
<webwork:if test="@summary">
<%
    Integer counter = (Integer) request.getAttribute("summaryCounter");
    if (counter != null)
    {
        int i = counter.intValue();
        int value =  i + 1;
        request.setAttribute("summaryCounter", new Integer(value));
    }
%>

<script>
function changeDescription<webwork:property value="@summaryCounter" />(dropdown)
{

var summaries = [
 <webwork:property value="parameters['headerrow']">
      <webwork:if test=". && . != ''">"<webwork:property value="parameters['headersummary']" />",</webwork:if>
   </webwork:property>
   <webwork:property value="parameters['headerrow2']">
      <webwork:if test=". && . != ''">"<webwork:property value="parameters['headersummary2']" />",</webwork:if>
   </webwork:property>
   <webwork:iterator value="parameters['list']">
      "<webwork:property value="{parameters['summary']}"/>",
   </webwork:iterator>
   ];

  document.getElementById("<webwork:property value="parameters['name']"/>_summary").innerHTML = summaries[dropdown.selectedIndex];
}
</script>
</webwork:if>

<select name="<webwork:property value="parameters['name']"/>"
        id="<webwork:property value="parameters['name']"/>_select"
      <webwork:property value="parameters['disabled']">
         <webwork:if test="{parameters['disabled']}">DISABLED</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['tabindex']">
         <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['onchange']">
         <webwork:if test=".">onchange="<webwork:property value="."/>"</webwork:if>
         <webwork:elseIf test="@summary"> onchange="changeDescription<webwork:property value="@summaryCounter" />(this);"</webwork:elseIf>
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
   <webwork:property value="parameters['headerrow2']">
      <webwork:if test=". && . != ''"><option
		value="<webwork:property value="parameters['headervalue2']" />"
		<webwork:if test="../parameters['headervalue2'] == ../parameters['nameValue']">selected</webwork:if>
		><webwork:property value="parameters['headerrow2']" /></option></webwork:if>
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

<webwork:if test="@summary && !parameters['description']"><br /></webwork:if>
<span class="selectDescription" id="<webwork:property value="parameters['name']"/>_summary"></span>
<webwork:if test="@summary">
    <script>
    changeDescription<webwork:property value="@summaryCounter" />(document.getElementById("<webwork:property value="parameters['name']"/>_select"));
    </script>
</webwork:if>
<jsp:include page="/template/standard/controlfooter.jsp" />
