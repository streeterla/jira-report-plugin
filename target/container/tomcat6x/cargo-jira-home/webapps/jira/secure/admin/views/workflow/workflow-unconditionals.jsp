<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<webwork:if test="transition/unconditionalResult/validators && transition/unconditionalResult/validators/empty == false">
<h3><webwork:text name="'admin.workflowtransition.unconditional.result.validators'"/></h3>

<p>

    <webwork:if test="transition/unconditionalResult/validators/size > 1">
        <div class="top-tick"><!-- --></div>
        <div class="condition-group">
    </webwork:if>

    <webwork:bean id="descriptorBean" name="'com.atlassian.jira.web.bean.WorkflowDescriptorFormatBean'">
        <webwork:param name="'descriptorCollection'" value="transition/unconditionalResult/validators"/>
        <webwork:param name="'delete'">false</webwork:param>
        <webwork:param name="'pluginType'">workflow-validator</webwork:param>
        <webwork:param name="'operatorTextKey'">admin.workflowtransition.operator.and</webwork:param>
    </webwork:bean>

    <%@ include file="/includes/admin/workflow/viewworkflowdescriptors.jsp" %>

    <webwork:if test="transition/unconditionalResult/validators/size > 1">
        </div>
        <div class="bottom-tick"><!-- --></div>
    </webwork:if>
</p>
</webwork:if>
