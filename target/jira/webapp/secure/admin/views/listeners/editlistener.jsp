
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.listeners.edit.listener'"/></title>
</head>

<body>

<page:applyDecorator name="jiraform">
	<page:param name="action">EditListener.jspa</page:param>
	<page:param name="submitId">update_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="cancelURI">ViewListeners!default.jspa</page:param>
	<page:param name="title"><webwork:text name="'admin.listeners.edit.listener2'">
	    <webwork:param name="'value0'"><webwork:property value="listener/string('name')" /></webwork:param>
	</webwork:text></page:param>
	<page:param name="description">
        <webwork:if test="/jiraListener/description"><b><webwork:text name="'common.words.description'"/>:</b><br><webwork:property value="/jiraListener/description" escape="false" /></webwork:if>
        <br><b><webwork:text name="'admin.common.words.instructions'"/>:</b><br><webwork:text name="'admin.listeners.edit.instructions'"/>
    </page:param>

	<webwork:iterator value="acceptedParams">
	<tr>
		<td align="right" valign="top" bgcolor="#fffff0">
			<span class="label">
			<webwork:property value="." />
			</span>
		</td>

		<td bgcolor="#ffffff">
			<input type="text" name="<webwork:property value="." />" value="<webwork:property value="paramValue(.)" />">
		</td>
	</tr>
	</webwork:iterator>

	<ui:component name="'id'" template="hidden.jsp" />
</page:applyDecorator>

</body>
</html>
