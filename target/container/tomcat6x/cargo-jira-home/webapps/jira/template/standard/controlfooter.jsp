<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:property value="parameters['helpURL']"><webwork:if test=".">
    <webwork:component template="help.jsp" name="." >
        <webwork:param name="'align'">middle</webwork:param>
        <webwork:param name="'helpURLFragment'" value="parameters['helpURLFragment']"/>
    </webwork:component>
</webwork:if></webwork:property>
<webwork:property value="parameters['extrahtml']"><webwork:if test="."><webwork:property value="." escape="false" /></webwork:if></webwork:property>
<webwork:property value="parameters['description']"><webwork:if test="."><br /><font size="1"><webwork:property value="." escape="false" /></font></webwork:if></webwork:property>
	</td>
<webwork:if test="!parameters['nolabel']">
</tr>
</webwork:if>
