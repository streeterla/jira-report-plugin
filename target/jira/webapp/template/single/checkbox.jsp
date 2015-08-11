<%@ taglib uri="webwork" prefix="webwork" %>
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
