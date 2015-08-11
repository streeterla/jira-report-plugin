<%@ taglib uri="webwork" prefix="webwork" %>

<table class="grid">
<tr>
<th>Key</th>
<th>Value</th>
</tr>
<webwork:iterator value="." status="'rowStatus'">
<tr>
<td><webwork:property value="." /></td>
<td><webwork:property value="key" /></td>
<td><webwork:property value="value" /></td>
</tr>
</webwork:iterator>
</table>
