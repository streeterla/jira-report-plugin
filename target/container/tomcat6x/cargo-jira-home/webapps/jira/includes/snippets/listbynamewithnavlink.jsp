<%@ taglib uri="webwork" prefix="webwork" %>
<%
// This is used to render Components & Versions on the ViewIssue action
//
// TODO: when ViewIssue.getComponents() and ViewIssue.getFixVersions() return value objects and not GenericValues, refactor this to not use GenericValue field accessors
%>
<webwork:if test=". != null && size > 0">
    <webwork:iterator status="'liststatus'">
        <a href="<webwork:url value="'/browse/' + /selectedProject/string('key') + '/' + $navfield + '/' + ./long('id')"/>" title="<webwork:property value="./string('name')" /> <webwork:property value="./string('description')" ><webwork:if test=". && !./equals('')"> - <webwork:property value="." /></webwork:if></webwork:property>"><webwork:property value="string('name')"/></a><webwork:if test="@liststatus/last == false">, </webwork:if>
    </webwork:iterator>
</webwork:if>
<webwork:else>
    <webwork:text name="'common.words.none'"/>
</webwork:else>
