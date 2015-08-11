<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>

<style>
.condition-block { margin: 0 0 0 20px; padding: 0; }
.operator { padding: 10px 0 10px 0; }
.highlighted-leaf { background: #cee7ff; margin: 0 0 0 20px; padding: 4px; }
.leaf { background: #f0f0f0; margin: 0 0 0 20px; padding: 4px; }
.single-leaf { background: #f0f0f0; margin: 0; padding: 4px; }

/* Used for drawing a 'grouping brace' around grouped conditions, i.e. conditions in the same ConditionsDescriptor */
.condition-group { border-left: 1px solid green; }
.top-tick { border-bottom: 1px solid green; height: 1px; width: 12px; }
.bottom-tick { border-top: 1px solid green; height: 1px; width: 12px; }
</style>

<table class="gridBox" cellpadding="3" cellspacing="1" width="100%" align="center"><tr bgcolor="#ffffff"><td>

<webwork:if test="/initial != true">
<webwork:if test="/descriptorTab == 'all' || /descriptorTab == 'conditions'">
    <webwork:if test="/descriptorTab == 'all'"><h3><webwork:text name="'admin.workflowtransition.conditions'"/></h3></webwork:if>
    <webwork:if test="workflow/editable == true">
        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle>
        <webwork:text name="'admin.workflowtransition.addnewcondition'">
            <webwork:param name="'value0'"><a href="<webwork:url page="AddWorkflowTransitionCondition!default.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /></webwork:url>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text>
    </webwork:if>

    <webwork:if test="transition/restriction && transition/restriction/conditionsDescriptor && transition/restriction/conditionsDescriptor/conditions">
        <p>

        <webwork:property value="transition/restriction/conditionsDescriptor" >
            <webwork:if test="./conditions">
                <webwork:property value="." id="conditionDescriptor" />

                <webwork:bean id="descriptorBean" name="'com.atlassian.jira.web.bean.WorkflowConditionFormatBean'">
                    <webwork:param name="'descriptor'" value="@conditionDescriptor"/>
                    <webwork:param name="'delete'" value="workflow/editable" />
                    <webwork:param name="'edit'" value="workflow/editable" />
                    <webwork:param name="'deleteAction'">DeleteWorkflowTransitionCondition.jspa</webwork:param>
                    <webwork:param name="'editAction'">EditWorkflowTransitionConditionParams!default.jspa</webwork:param>
                    <webwork:param name="'pluginType'">workflow-condition</webwork:param>
                </webwork:bean>

                <%@ include file="/includes/admin/workflow/viewworkflowconditions.jsp" %>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.workflowtransition.available.to.everybody'"/>
            </webwork:else>
        </webwork:property>
        </p>
    </webwork:if>
    <webwork:else>
        <p><webwork:text name="'admin.workflowtransition.no.conditions'"/></p>
    </webwork:else>
</webwork:if>
</webwork:if>

<jsp:include page="/secure/admin/views/workflow/workflow-validators.jsp" flush="false" />


<webwork:if test="/descriptorTab == 'all' || /descriptorTab == 'other'">

<jsp:include page="/secure/admin/views/workflow/workflow-conditionals.jsp" flush="false" />

<jsp:include page="/secure/admin/views/workflow/workflow-unconditionals.jsp" flush="false" />

<jsp:include page="/secure/admin/views/workflow/workflow-uncond-prefunctions.jsp" flush="false" />

<jsp:include page="/secure/admin/views/workflow/workflow-global-prefuncs.jsp" flush="false" />

<jsp:include page="/secure/admin/views/workflow/workflow-global-postfuncs.jsp" flush="false" />

</webwork:if>

<webwork:if test="/descriptorTab == 'all' || /descriptorTab == 'postfunctions'">
    <webwork:if test="/descriptorTab == 'all'"><h3><webwork:text name="'admin.workflowtransition.post.functions'"/></h3></webwork:if>

    <webwork:if test="transition/unconditionalResult">
        <webwork:if test="workflow/editable == true">
        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle>
        <webwork:text name="'admin.workflowtransition.add.new.post.function'">
            <webwork:param name="'value0'"><a id="add_post_func" href="<webwork:url page="AddWorkflowTransitionPostFunction!default.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /></webwork:url>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text>
    </webwork:if>
    <p>

    <webwork:if test="/transition/unconditionalResult/postFunctions/empty == false">

        <webwork:if test="/transition/unconditionalResult/postFunctions/size > 1">
            <div class="top-tick"><!-- --></div>
            <div class="condition-group">
        </webwork:if>


        <webwork:bean id="descriptorBean" name="'com.atlassian.jira.web.bean.WorkflowDescriptorFormatBean'">
            <webwork:param name="'descriptorCollection'" value="transition/unconditionalResult/postFunctions"/>
            <webwork:param name="'delete'" value="workflow/editable" />
            <webwork:param name="'edit'" value="workflow/editable" />
            <webwork:param name="'deleteAction'">DeleteWorkflowTransitionPostFunction.jspa</webwork:param>
            <webwork:param name="'editAction'">EditWorkflowTransitionPostFunctionParams!default.jspa</webwork:param>
            <webwork:param name="'pluginType'">workflow-function</webwork:param>
            <webwork:param name="'orderable'" value="workflow/editable" />
            <webwork:param name="'operatorTextKey'">admin.workflowtransition.operator.then</webwork:param>
        </webwork:bean>

        <%@ include file="/includes/admin/workflow/viewworkflowdescriptors.jsp" %>

        <webwork:if test="/transition/unconditionalResult/postFunctions/size > 1">
            </div>
            <div class="bottom-tick"><!-- --></div>
        </webwork:if>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'admin.workflowtransition.no.post.functions'"/>
    </webwork:else>
    </p>
    </webwork:if>
</webwork:if>

</td></tr></table>
