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
  --   * listKey   - Where to get the values for the OPTION tag.  Equates to
  --                 the VALUE parameter of the OPTION tag.
  --   * listValue - The value displayed by the control.  Equates to the body
  --                 of the HTML OPTION tag.
  --
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in
relation
  --                       to the control.  Default is to the left of the
control.
  --   * disabled        - DISABLED parameter of the HTML SELECT tag.
  --   * tabindex        - tabindex parameter of the HTML SELECT tag.
  --   * onchange        - onkeyup parameter of the HTML SELECT tag.
  --   * size            - the size parameter of the HTML SELECT tag.
  --
  --%>
<%@ taglib uri="webwork" prefix="webwork" %>
<select multiple name="<webwork:property value="parameters['name']"/>"
      <webwork:property value="parameters['id']">
         <webwork:if test=".">id="<webwork:property value="."/>"</webwork:if>
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
      <webwork:property value="parameters['onclick']">
         <webwork:if test=".">onclick="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['style']"><webwork:if test=".">style="<webwork:property value="."/>"</webwork:if></webwork:property>
      <webwork:property value="parameters['class']">
         <webwork:if test=".">class="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
	  <webwork:property value="parameters['size']">
         <webwork:if test=".">size="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
>
   <webwork:property value="parameters['headeroptgroup']">
      <webwork:if test=". && . != ''"><optgroup label="<webwork:property value="parameters['headeroptgroup']"/>"></webwork:if>
   </webwork:property>

    <webwork:property value="parameters['headerrow']">
      <webwork:if test=". && . != ''"><option <webwork:property value="parameters['optionIcon']"><webwork:if test="."> class="selectall" </webwork:if></webwork:property> value="<webwork:property value="parameters['headervalue']" />" <webwork:if test="parameters['nameValue']"><webwork:iterator value="parameters['nameValue']"><webwork:if test=". == parameters['headervalue']"> SELECTED</webwork:if></webwork:iterator></webwork:if>><webwork:property value="parameters['headerrow']" /></option></webwork:if>
   </webwork:property>
   <webwork:property value="parameters['headerrow2']">
      <webwork:if test=". && . != ''"><option <webwork:property value="parameters['optionIcon']"><webwork:if test="."> class="selectall" </webwork:if></webwork:property> value="<webwork:property value="parameters['headervalue2']" />" <webwork:if test="parameters['nameValue']"><webwork:iterator value="parameters['nameValue']"><webwork:if test=". == parameters['headervalue2']"> SELECTED</webwork:if></webwork:iterator></webwork:if>><webwork:property value="parameters['headerrow2']" /></option></webwork:if>
   </webwork:property>

   <%-- JRA-6147 - The equality comparison to determine if the select option has been selected will not work if the iterator is passed Long objects. --%>
   <%-- Need to ensure that the iterator is passed strings --%>
   <webwork:iterator value="parameters['list']">
		<webwork:property value="./{parameters['listKey']}"><option value="<webwork:property value="."/>"<webwork:if test="parameters['nameValue']"><webwork:iterator value="parameters['nameValue']"><webwork:if test=". == .."> SELECTED</webwork:if></webwork:iterator></webwork:if></webwork:property>
        <webwork:property value="parameters['optionIcon']"><webwork:if test="."> class="imagebacked" style="background-image: url(<webwork:url value="../{.}" />);"</webwork:if></webwork:property>
        <webwork:property value="parameters['optionTitle']"><webwork:if test="."> title="<webwork:property value="../{.}" />"</webwork:if></webwork:property>
        >
        <webwork:if test="parameters['internat'] == true">
            <webwork:text name="{parameters['listValue']}"/>
        </webwork:if>
        <webwork:else>
            <webwork:property value="{parameters['listValue']}"/>
        </webwork:else>
        </option>
   </webwork:iterator>
</select>
