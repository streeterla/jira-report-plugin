<%@ taglib uri="webwork" prefix="webwork" %>

<%-- Expects a WorkflowConditionFormatBean to be in context with id 'descriptorBean' --%>

<%-- Only print the 'grouping brace' if there is more than one condition --%>
<webwork:if test="@descriptorBean/multipleDescriptors == true">
    <%-- NOTE: The HTML comment MUST be PRESENT in the DIV to ensure IE renders it as a flat DIV. Otherwise IE
             makes the div have a minimum height. --%>
    <div class="top-tick"><!-- --></div>
        <div class="condition-group">
</webwork:if>

<webwork:iterator value="@descriptorBean/descriptorCollection" status="'status'" >
    <webwork:if test="@status/first == false">
        <div class="operator">
            <span style="color: green;">&mdash; <webwork:text name="@descriptorBean/operatorTextKey"/></span>
            <webwork:if test="workflow/editable == true">
                <%-- Only allow the user to change anything if the workflow is editable --%>
                <webwork:if test="@status/index == 1">
                    &nbsp;&nbsp;
                    <webwork:text name="'admin.workflowtransition.addcondition'">
                        <webwork:param name="'value0'"><a href="<webwork:url page="AddWorkflowTransitionCondition!default.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /><webwork:param name="'count'"><webwork:property value="@descriptorBean/parentPrefix" /><webwork:property value="@status/count" /></webwork:param></webwork:url>"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text>
                    |
                    <a href="<webwork:url value="'ViewWorkflowTransition!changeLogicOperator.jspa'"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /><webwork:param name="'count'"><webwork:property value="@descriptorBean/parentPrefix" /><webwork:property value="@status/count" /></webwork:param></webwork:url>">
                        <webwork:text name="'admin.workflowtransition.changeoperator'">
                            <webwork:param name="'value0'"><webwork:text name="@descriptorBean/otherOperatorTextKey"/></webwork:param>
                        </webwork:text>
                    </a>
                </webwork:if>
            </webwork:if>
        </div>
    </webwork:if>

    <webwork:if test="@descriptorBean/nestedDescriptor(.) == false">
        <%@ include file="/includes/admin/workflow/viewworkflowdescriptor.jsp" %>
    </webwork:if>
    <webwork:else>
        <%-- Loop into this JSP with a new descriptorBean that represents the nested ConditionsDescriptor --%>

        <%-- needed to get around the WW bug of looking up the stack - so use the id --%>
        <webwork:property value="." id="conditionsDescriptor" />

        <webwork:if test="@conditionsDescriptor/conditions && @conditionsDescriptor/conditions/empty == false">
            <webwork:if test="@conditionsDescriptor/conditions/size > 1">
                <div class="condition-block">
            </webwork:if>

            <%-- save the descriptor bean on top of the stack --%>
            <webwork:property value="@descriptorBean">
                <%-- Hack to get around the WebWork EL bug --%>
                <webwork:property value="./deleteAction" id="da" />
                <webwork:property value="./editAction" id="ea" />
                <webwork:property value="@descriptorBean/parentPrefix" id="pp" />
                <%-- create a new descriptor bean to represent the conditions element --%>
                <webwork:bean id="descriptorBean" name="'com.atlassian.jira.web.bean.WorkflowConditionFormatBean'">
                    <webwork:param name="'descriptor'" value="@conditionsDescriptor"/>
                    <webwork:param name="'pluginType'" value="'workflow-condition'" />
                    <webwork:param name="'parentPrefix'"><webwork:property value="@pp" /><webwork:property value="@status/count" /></webwork:param>
                    <webwork:param name="'delete'" value="/workflow/editable" />
                    <webwork:param name="'edit'" value="workflow/editable" />
                    <webwork:param name="'deleteAction'" value="@da" />
                    <webwork:param name="'editAction'" value="@ea" />
                </webwork:bean>

                <%-- recurse to this JSP to print out the ConditionsDescriptor which likely has more than one
                ConditionDescriptor inside --%>
                <jsp:include page="/includes/admin/workflow/viewworkflowconditions.jsp" />

                <%-- put the old descriptor format bean back --%>
                <webwork:property id="descriptorBean" value="."/>

            </webwork:property>

            <webwork:if test="@conditionsDescriptor/conditions/size > 1">
                </div>
            </webwork:if>
        </webwork:if>
    </webwork:else>
</webwork:iterator>

<%-- Only close the 'grouping brace' if there is more than one condition --%>
<webwork:if test="@descriptorBean/multipleDescriptors == true">
        <%-- Close 'condition-group' div --%>
        <%-- NOTE: The HTML comment MUST be PRESENT in the DIV to ensure IE renders it as a flat DIV. Otherwise IE
             makes the div have a minimum height. --%>
        </div><div class="bottom-tick"><!-- --></div>
</webwork:if>
