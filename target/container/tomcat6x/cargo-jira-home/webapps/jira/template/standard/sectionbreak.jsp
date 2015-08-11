<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<webwork:if test="!parameters['nobreak']">
<tr><td class="fieldLabelArea">&nbsp;</td><td class="rowClear">&nbsp;</td></tr>
</webwork:if>
<tr class="jiraformSectionBreak">
    <td colspan="2">
        <h3 class="formtitle"><webwork:property value="parameters['label']"/></h3>
    </td>
</tr>
<webwork:property value="parameters['description']" >
<webwork:if test=".">
	<tr>
		<td colspan="2" class="jiraformheader">
        <webwork:property value="." />
        </td>
	</tr>
</webwork:if>
</webwork:property>

<webwork:property value="parameters['instructions']" >
<webwork:if test=".">
	<tr>
		<td colspan="2" class="instructions">
        <webwork:property value="." />
        </td>
	</tr>
</webwork:if>
</webwork:property>
