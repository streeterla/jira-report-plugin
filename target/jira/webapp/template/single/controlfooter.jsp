 <%@ taglib uri="webwork" prefix="webwork" %>
<webwork:property value="parameters['helpURL']"><webwork:if test=".">
    <webwork:component template="help.jsp" name="." >
        <webwork:param name="'align'">middle</webwork:param>
        <webwork:param name="'helpURLFragment'" value = "parameters['helpURLFragment']"/>
    </webwork:component>
</webwork:if></webwork:property>
<webwork:property value="parameters['description']"><webwork:if test="."><br /><font size="1"><webwork:property value="." escape="false" /></font></webwork:if></webwork:property>
<webwork:if test="!parameters['noTable']"></td></webwork:if>
