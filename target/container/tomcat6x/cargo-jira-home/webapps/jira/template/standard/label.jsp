<%@ taglib uri="webwork" prefix="webwork" %>
<tr>
    <td bgcolor="#fffff0" align="right" valign="top"><webwork:property value="parameters['label']"/></td>
    <webwork:if test="parameters['escape'] == false">
        <td bgcolor="#ffffff" valign="top"><webwork:property value="parameters['value']" escape="false" /><br>
    </webwork:if>
    <webwork:else>
        <td bgcolor="#ffffff" valign="top"><webwork:property value="parameters['value']"/><br>
    </webwork:else>
        <span class="subText"><webwork:property value="parameters['description']" escape="false" /></span></td>
</tr>
