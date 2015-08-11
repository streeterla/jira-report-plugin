<%@ taglib uri="webwork" prefix="webwork" %>
<input type="text"
       name="<webwork:property value="parameters['nameNext']"/>"
      <webwork:property value="parameters['sizeNext']">
         <webwork:if test=".">size="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['maxlengthNext']">
         <webwork:if test=".">maxlength="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['valueNext']">
         <webwork:if test=".">value="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['disabledNext']">
         <webwork:if test="{parameters['disabledNext']}">DISABLED</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['readonly']">
         <webwork:if test="{parameters['readonlyNext']}">READONLY</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['onkeyupNext']">
         <webwork:if test=".">onkeyup="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['tabindexNext']">
         <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['onchangeNext']">
         <webwork:if test=".">onchange="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['styleNext']">
         <webwork:if test=".">style="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
>
