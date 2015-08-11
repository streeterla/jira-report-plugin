<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<tr class="hidden"><td>
<webwork:iterator value="parameters['nameValue']">
<webwork:if test=".">
<input type="hidden"
       id="<webwork:property value="parameters['name']"/>"
       name="<webwork:property value="parameters['name']"/>"
       value="<webwork:property value="."/>"
/>
</webwork:if>
</webwork:iterator>
</td></tr>
