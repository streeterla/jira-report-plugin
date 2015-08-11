<%@ taglib uri="webwork" prefix="webwork" %>
<%-- Only show message if errors are available. This will be done if ActionFormSupport is used. --%>
<webwork:property value="errors[parameters['namePrevious']]">
   <webwork:if test=".">
      <tr>
        <webwork:if test="parameters['labelposition'] == 'top'">
            <td align="left" valign="top" colspan="2" class="formErrors">
        </webwork:if>
        <webwork:else>
			<td class="formErrors">&nbsp;</td>
            <td valign="top" class="formErrors">
        </webwork:else>
            <span class="errMsg"><webwork:property value="."/></span>
        </td>
      </tr>
   </webwork:if>
</webwork:property>
<webwork:property value="errors[parameters['nameNext']]">
   <webwork:if test=".">
      <tr>
        <webwork:if test="parameters['labelposition'] == 'top'">
            <td align="left" valign="top" colspan="2" class="formErrors">
        </webwork:if>
        <webwork:else>
			<td class="formErrors">&nbsp;</td>
            <td valign="top" class="formErrors">
        </webwork:else>
            <span class="errMsg"><webwork:property value="."/></span>
        </td>
      </tr>
   </webwork:if>
</webwork:property>
<%-- if the label position is top, then give the label it's own row in the table --%>
<tr>
    <webwork:if test="parameters['labelposition'] == 'top'">
        <td align="left" valign="top" colspan="2" bgcolor="#fffff0">
    </webwork:if>
    <webwork:else>
        <td align="right" valign="top" bgcolor="<webwork:if test="errors[parameters['namePrevious']] || errors[parameters['nameNext']]">ffcccc</webwork:if><webwork:else>fffff0</webwork:else>">
    </webwork:else>
            <span class="label">
            <webwork:property value="parameters['label']"/>:
            </span>
        </td>
<%-- add the extra row  --%>
<webwork:if test="parameters['labelposition'] == 'top'">
   </tr><tr>
</webwork:if>
<webwork:if test="errors[parameters['namePrevious']] || errors[parameters['nameNext']]">
   <td class="formErrors">
</webwork:if>
<webwork:else>
	<td bgcolor="#ffffff">
</webwork:else>
