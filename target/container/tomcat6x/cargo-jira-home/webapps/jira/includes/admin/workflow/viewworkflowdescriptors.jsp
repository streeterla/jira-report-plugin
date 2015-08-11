<%-- Expects a WorkflowFunctionBean to be in context with id 'descriptorBean' --%>
<webwork:iterator value="@descriptorBean/descriptorCollection" status="'status'" >
    <webwork:if test="@status/first == false">
        <div class="operator">
            <span style="color: green;">&mdash; <webwork:text name="@descriptorBean/operatorTextKey"/></span>
        </div>
    </webwork:if>

    <%@ include file="/includes/admin/workflow/viewworkflowdescriptor.jsp" %>
</webwork:iterator>
