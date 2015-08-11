<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<webwork:if test="transition/unconditionalResult/preFunctions && transition/unconditionalResult/preFunctions/empty == false">

    <h3><webwork:text name="'admin.workflowtransition.unconditional.result.prefunctions'"/></h3>

    <webwork:if test="transition/unconditionalResult/preFunctions/size > 1">
        <div class="top-tick"><!-- --></div>
        <div class="condition-group">
    </webwork:if>

    <webwork:bean id="descriptorBean" name="'com.atlassian.jira.web.bean.WorkflowDescriptorFormatBean'">
        <webwork:param name="'descriptorCollection'" value="transition/unconditionalResult/preFunctions"/>
        <webwork:param name="'delete'">false</webwork:param>
        <webwork:param name="'pluginType'">workflow-function</webwork:param>
        <webwork:param name="'orderable'">false</webwork:param>
        <webwork:param name="'operatorTextKey'">admin.workflowtransition.operator.then</webwork:param>
    </webwork:bean>

    <%@ include file="/includes/admin/workflow/viewworkflowdescriptors.jsp" %>

    <webwork:if test="transition/unconditionalResult/preFunctions/size > 1">
        </div>
        <div class="bottom-tick"><!-- --></div>
    </webwork:if>

</webwork:if>
