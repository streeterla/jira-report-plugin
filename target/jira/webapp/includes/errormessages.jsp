<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="hasErrorMessages == true">
	<font color=#cc0000><b>ERRORS</b>:</font>
	<ul>
	<webwork:iterator value="errorMessages">
		<li><webwork:property /></li>
	</webwork:iterator>
	</ul>
</webwork:if>
