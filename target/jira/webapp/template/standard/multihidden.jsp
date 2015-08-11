<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<webwork:generator id="hiddenFields" val="parameters['fields']" separator="','"/>
<webwork:iterator value="@hiddenFields">
    <ui:component name="." template="hidden.jsp" theme="'single'" />
<%--    <ui:textfield label="." name="." />--%>
</webwork:iterator>
<webwork:generator id="hiddenFields" val="parameters['multifields']" separator="','"/>
<webwork:iterator value="@hiddenFields">
    <ui:component name="." template="arrayhidden.jsp" />
</webwork:iterator>

