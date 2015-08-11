<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="!@selectWithTextArea">
<webwork:property value="'true'" id="selectWithTextArea" />
<script language="JavaScript">
<!--
function changeSelectTextArea(fieldName)
{
    var selectList = document.getElementById(fieldName + "_select");
    var textBox = document.getElementById(fieldName);

    if ('OTHER_VALUE' == selectList.value)
    {
        textBox.style.display = '';
        textBox.select();
    }
    else
    {
        textBox.style.display = 'none';
        textBox.value = selectList.value;
    }
}
//-->
</script>
</webwork:if>
   <%-- Check if an explicit selected value has been specified --%>
   <webwork:if test="parameters['selectedValue']">
       <webwork:property value="parameters['selectedValue']" id="selectedValue" />
   </webwork:if>
   <webwork:elseIf test="parameters['nameValue']">
       <webwork:property value="parameters['nameValue']" id="selectedValue" />
   </webwork:elseIf>
   <webwork:else>
       <webwork:property value="''" id="selectedValue" />
   </webwork:else>

<select name="<webwork:property value="parameters['name']"/>_select"
        id="<webwork:property value="parameters['name']"/>_select"
        onchange="changeSelectTextArea('<webwork:property value="parameters['name']"/>');"
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
    <webwork:property value="'false'" id="selectWithTextAreaSelected" />
    
   <webwork:property value="parameters['headerrow']">
      <webwork:if test=". && . != ''"><option
		value="<webwork:property value="parameters['headervalue']" />"
		<webwork:if test="../parameters['headervalue'] == @selectedValue">selected <webwork:property value="'true'" id="selectWithTextAreaSelected" /></webwork:if>
		><webwork:property value="parameters['headerrow']" /></option></webwork:if>
   </webwork:property>
   <webwork:property value="parameters['headerrow2']">
      <webwork:if test=". && . != ''"><option
		value="<webwork:property value="parameters['headervalue2']" />"
		<webwork:if test="../parameters['headervalue2'] == @selectedValue">selected <webwork:property value="'true'" id="selectWithTextAreaSelected" /></webwork:if>
		><webwork:property value="parameters['headerrow2']" /></option></webwork:if>
   </webwork:property>

   <%-- If it has, compare each value to the specified selected value and if they are equal print 'SELECTED' next to it --%>
   <webwork:iterator value="parameters['list']">
	  <option value="<webwork:property value="{parameters['listKey']}"/>" <webwork:if test="{parameters['listKey']} == @selectedValue">SELECTED <webwork:property value="'true'" id="selectWithTextAreaSelected" /></webwork:if>
              <webwork:property value="parameters['optionIcon']"><webwork:if test="."> class="imagebacked" style="background-image: url(<webwork:url value="../{.}" />);"</webwork:if></webwork:property>
              <webwork:property value="parameters['optionTitle']"><webwork:if test="."> title="<webwork:property value="../{.}" />"</webwork:if></webwork:property>
              <webwork:if test="parameters['showOptionId']">id="<webwork:property value="parameters['name']" />_select_<webwork:property value="{parameters['listKey']}" />"</webwork:if>
              >
        <webwork:if test="parameters['internat'] == true"><webwork:text name="{parameters['listValue']}"/></webwork:if>
        <webwork:else><webwork:property value="{parameters['listValue']}"/></webwork:else>
      </option>
   </webwork:iterator>
    <option value="OTHER_VALUE" <webwork:if test="@selectWithTextAreaSelected != 'true' && @selectedValue && @selectedValue != ''">SELECTED</webwork:if>><webwork:text name="'common.words.other'" /></option>
</select>
<br />
<input id="<webwork:property value="parameters['name']"/>" name="<webwork:property value="parameters['name']"/>" type="text" value="<webwork:property value="@selectedValue" />" />
<script language="JavaScript">
<!--
    changeSelectTextArea('<webwork:property value="parameters['name']"/>');
//-->
</script>
