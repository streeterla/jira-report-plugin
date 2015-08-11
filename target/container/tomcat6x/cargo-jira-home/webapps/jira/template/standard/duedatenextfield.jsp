<%@ taglib uri="webwork" prefix="webwork" %>
<input type="text"
       name="<webwork:property value="parameters['namePrevious']"/>"
      <webwork:property value="parameters['sizePrevious']">
         <webwork:if test=".">size="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['maxlengthPrevious']">
         <webwork:if test=".">maxlength="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['valuePrevious']">
         <webwork:if test=".">value="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['disabledPrevious']">
         <webwork:if test="{parameters['disabledPrevious']}">DISABLED</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['readonlyPrevious']">
         <webwork:if test="{parameters['readonlyPrevious']}">READONLY</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['onkeyupPrevious']">
         <webwork:if test=".">onkeyup="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['tabindexPrevious']">
         <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['onchangePrevious']">
         <webwork:if test=".">onchange="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
      <webwork:property value="parameters['stylePrevious']">
         <webwork:if test=".">style="<webwork:property value="."/>"</webwork:if>
      </webwork:property>
>
