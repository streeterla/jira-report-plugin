<%@ taglib prefix="webwork" uri="webwork" %>
<webwork:property value="errors[parameters['name']]"><webwork:if test="."><span class="error"><webwork:property value="errors[parameters['name']]"/></span></webwork:if></webwork:property>
<webwork:property value="parameters['description']"><webwork:if test="."><span class="description"><webwork:property value="." escape="false" /></span></webwork:if></webwork:property>
</div>