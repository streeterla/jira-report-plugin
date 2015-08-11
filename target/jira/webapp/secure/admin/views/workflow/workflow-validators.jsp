<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<webwork:if test="/descriptorTab == 'all' || /descriptorTab == 'validators'">

    <%-- Display Validators (if there is at least one) --%>
    <webwork:if test="/descriptorTab == 'all'"><h3><webwork:text name="'admin.workflowtransition.validators'"/></h3></webwork:if>

    <%-- Add the 'Add Validator' Link if the workflow is not active --%>
    <webwork:if test="workflow/editable == true">
    <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle>
    <webwork:text name="'admin.workflowtransition.addnewvalidator'">
        <webwork:param name="'value0'"><a href="<webwork:url page="AddWorkflowTransitionValidator!default.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /></webwork:url>"><b></webwork:param>
        <webwork:param name="'value1'"></b></a></webwork:param>
    </webwork:text>
    </webwork:if>

    <p>
    <webwork:if test="/transition/validators && (/transition/validators/empty == false)">
        <webwork:if test="/transition/validators/size > 1">
            <div class="top-tick"><!-- --></div>
            <div class="condition-group">
        </webwork:if>

            <webwork:bean id="descriptorBean" name="'com.atlassian.jira.web.bean.WorkflowDescriptorFormatBean'">
                <webwork:param name="'descriptorCollection'" value="/transition/validators"/>
                <webwork:param name="'delete'" value="workflow/editable" />
                <webwork:param name="'edit'" value="workflow/editable" />
                <webwork:param name="'deleteAction'">DeleteWorkflowTransitionValidator.jspa</webwork:param>
                <webwork:param name="'editAction'">EditWorkflowTransitionValidatorParams!default.jspa</webwork:param>
                <webwork:param name="'pluginType'">workflow-validator</webwork:param>
                <webwork:param name="'operatorTextKey'">admin.workflowtransition.operator.and</webwork:param>
            </webwork:bean>

            <%@ include file="/includes/admin/workflow/viewworkflowdescriptors.jsp" %>
        <webwork:if test="/transition/validators/size > 1">
            </div>
            <div class="bottom-tick"><!-- --></div>
        </webwork:if>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'admin.workflowtransition.no.input.parameter.checks'"/>
    </webwork:else>
    </p>
</webwork:if>
