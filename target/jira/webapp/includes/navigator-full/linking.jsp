<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="applicationProperties/option('jira.option.issuelinking') == true">
<webwork:property value="linkCollection(.)">
<webwork:if test="linkTypes != null && linkTypes/size > 0">
<tr>
	<td bgcolor="#f0f0f0" width="20%" valign="top">
		<b><webwork:text name="'common.concepts.issuelinks'" />:</b>
	</td>
	<td bgcolor="#ffffff" valign="top" colspan="3">
		<table cellpadding="4" cellspacing="0" border="0" width="100%">
		<webwork:iterator value="linkTypes">
		<tr>
			<td colspan="2" bgcolor="#f0f0f0">
			<b><webwork:property value="string('linkname')" /></b><br>
			</td>
		</tr>
		<tr>
			<td bgcolor="#ffffff" valign="top" width="50%">
				<jsp:include page="/includes/snippets/issuelinkoutward.jsp" />
			</td>

			<td bgcolor="#ffffff" valign="top" width="50%">
				<jsp:include page="/includes/snippets/issuelinkinward.jsp" />
			</td>
		</tr>
		</webwork:iterator>
		</table>
	</td>
</tr>
</webwork:if>
</webwork:property>
</webwork:if>
