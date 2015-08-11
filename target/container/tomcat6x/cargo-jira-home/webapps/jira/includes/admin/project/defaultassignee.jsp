<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<webwork:if test="assigneeTypes/size > 1">
<ui:select label="text('admin.projects.default.assignee')" name="'assigneeType'" list="assigneeTypes" listKey="'key'" listValue="'text(value)'">
    <ui:param name="'description'">
            <webwork:text name="'admin.addproject.default.assignee.description'"/>
    </ui:param>
</ui:select>
</webwork:if>
<webwork:else>
    <ui:component name="'assigneeType'" value="assigneeTypes/keySet/iterator/next" template="hidden.jsp" theme="'single'" />    
    <webwork:label label="text('admin.projects.default.assignee')" name="'assigneeType'">
        <ui:param name="'value'"><webwork:text name="assigneeTypes/values/iterator/next"/></ui:param>
        <ui:param name="'description'">
            <webwork:text name="'admin.addproject.default.assignee.description'"/>  
        </ui:param>
    </webwork:label>
</webwork:else>
