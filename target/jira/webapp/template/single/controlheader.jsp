<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="errors[parameters['name']]">
<webwork:if test="!parameters['noTable']"><td class="formErrors <webwork:if test="parameters['class']"><webwork:property value="parameters['class']"/></webwork:if>"></webwork:if>
<span class="errMsg"><webwork:property value="errors[parameters['name']]"/></span><br /></webwork:if>
<webwork:else>
<webwork:if test="!parameters['noTable']"><td <webwork:if test="parameters['bgcolor']"> bgcolor="<webwork:property value="parameters['bgcolor']"/>"</webwork:if> <webwork:if test="parameters['class']">class=<webwork:property value="parameters['class']"/></webwork:if>></webwork:if>
</webwork:else>

