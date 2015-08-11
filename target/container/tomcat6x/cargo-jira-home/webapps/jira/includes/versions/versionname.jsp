<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="./archived == true">
    <font color="#999999"><webwork:property value="name" /></font>
</webwork:if>
<webwork:else>
    <webwork:property value="name" />
</webwork:else>
