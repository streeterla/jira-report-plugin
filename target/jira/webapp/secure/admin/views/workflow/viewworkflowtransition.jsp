<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.workflowtransition.view.workflow.transition'"/> - <webwork:property value="transition/name" /></title>
</head>
<body>

<table width="100%" cellpadding="4" cellspacing="0"><tr><td valign="top" width="50%">
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.workflowtransition.transition'"/>: <webwork:property value="transition/name" /></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">workflow</page:param>
    <p>
            <%@ include file="/includes/admin/workflow/workflowinfobox.jsp" %>
    </p>
    <webwork:if test="/global == true">
        <p>
            <webwork:text name="'admin.workflowtransition.availabletoall'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
            </webwork:text>
        </p>
    </webwork:if>
    <webwork:elseIf test="/initial == true">
        <p>
            <webwork:text name="'admin.workflowtransition.initial.transition'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
            </webwork:text>
        </p>
    </webwork:elseIf>

    <p>
    <b><webwork:text name="'admin.workflowtransition.transitionview'"/></b>:
    <webwork:if test="/initial == true">
       <webwork:text name="'admin.workflowtransition.noinitialview'"/>
    </webwork:if>
    <webwork:elseIf test="/fieldScreen">
            <a id="configure_fieldscreen" href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<webwork:property value="/fieldScreen/id" />"><webwork:property value="/fieldScreen/name" /></a>
    </webwork:elseIf>
    <webwork:else>
        <webwork:text name="'admin.workflowtransition.willhappeninstantly'"/>
    </webwork:else>
    <webwork:property value="/transition/metaAttributes/('jira.description')">
        <webwork:if test=". && length >  0">
            <br>
            <b><webwork:text name="'common.words.description'"/></b>: <webwork:property value="." />
        </webwork:if>
    </webwork:property>
    </p>
    <ul class="square">
        <li><webwork:text name="'admin.workflows.viewallsteps'">
            <webwork:param name="'value0'"><a href="<webwork:url page="ViewWorkflowSteps.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /></webwork:url>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
            <webwork:param name="'value2'"><b><webwork:property value="/workflowDisplayName" /></b></webwork:param>
        </webwork:text></li>
        <webwork:if test="/workflow/editable == true">
            <li><webwork:text name="'admin.workflowtransition.edittransition'">
                <webwork:param name="'value0'"><a href="<webwork:url page="EditWorkflowTransition!default.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /></webwork:url>" id="edit_transition"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text></li>
            <webwork:if test="/global == false && /initial == false">
                <li><webwork:text name="'admin.workflowtransition.deletetransition'">
                    <webwork:param name="'value0'"><a id="delete_transition" href="<webwork:url page="DeleteWorkflowTransitions!confirm.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'transitionIds'" value="transition/id" /></webwork:url>"><b></webwork:param>
                    <webwork:param name="'value1'"></b></a></webwork:param>
                </webwork:text></li>
            </webwork:if>
        </webwork:if>
        <li><webwork:text name="'admin.workflowtransition.viewproperties'">
            <webwork:param name="'value0'"><a id="view_transition_properties" href="<webwork:url page="ViewWorkflowTransitionMetaAttributes.jspa"><webwork:param name="'workflowMode'" value="workflow/mode" /><webwork:param name="'workflowName'" value="workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="transition/id" /></webwork:url>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text></li>
    </ul>

</page:applyDecorator>
</td><td valign="top" width="50%">
<table cellpadding="4" cellspacing="0" border="0" align="center" width="100%"><tr><td style="border: 1px solid #bbbbb0; background: #fffff0;">
<div class="formtitle"><webwork:text name="'admin.workflowstep.workflow.browser'"/></div>
    <table id="workflow_browser" cellpadding="3" cellspacing="0" border="0" width="100%">
        <tr>
            <td width="33%" align="right">
                <table id="orig_steps" cellpadding="3" cellspacing="3">
                    <webwork:iterator value="/stepsForTransition">
                        <tr>
                            <td style="border: 1px solid #bbb;" bgcolor="#ffffff" align="left" nowrap>
                                <a href="<webwork:url page="ViewWorkflowStep.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="id" /></webwork:url>"><webwork:property value="name" /></a>
                            </td>
                            <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
                        </tr>
                    </webwork:iterator>
                </table>
            </td>
            <td align="center" valign="middle" width="33%">
                <table cellpadding="3" cellspacing="3" border="0">
                    <tr>
                        <td style="border: 1px solid #bbb;" bgcolor="#f0f0f0">
                            <webwork:property value="/transition">
                                <webwork:if test="/global == true || /common == true"><em></webwork:if>
                                <webwork:property value="transition/name" />
                                <webwork:if test="/global == true || /common == true"></em></webwork:if>
                                <span class="smallgrey">(<webwork:property value="id" />)</span>
                            </webwork:property>
                        </td>
                    </tr>
                </table>
            </td>
            <td align="left" width="33%">
                 <table id="dest_steps" cellpadding="3" cellspacing="3" border="0">
                    <webwork:if test="/transitionWithoutStepChange == true">
                        <webwork:iterator value="/stepsForTransition">
                            <tr>
                                <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
                                <td align="left" style="border: 1px solid #bbb;" bgcolor="#ffffff" nowrap>
                                    <a href="<webwork:url page="ViewWorkflowStep.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="id" /></webwork:url>"><webwork:property value="name" /></a>
                                </td>
                            </tr>
                        </webwork:iterator>
                    </webwork:if>
                    <webwork:else>
                        <tr>
                            <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
                            <td align="left" style="border: 1px solid #bbb;" bgcolor="#ffffff" nowrap>
                                <webwork:property value="/workflow/descriptor/step(transition/unconditionalResult/step)">
                                    <a href="<webwork:url page="ViewWorkflowStep.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="id" /></webwork:url>"><webwork:property value="name" /></a>
                                </webwork:property>
                            </td>
                        </tr>
                    </webwork:else>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">(<webwork:text name="'admin.workflowtransition.originatingsteps'"/>)</td>
            <td align="absmiddle"><b>&nbsp;</b></td>
            <td align="center">(<webwork:text name="'admin.workflowtransition.destinationstep'"/>)</td>
        </tr>
    </table>
    </td></tr></table>
</td></tr></table>

<p>
<table cellpadding="2" cellspacing="0" border="0" width="100%" align="center">
<tr>
	<webwork:if test="/descriptorTab == 'all'">
		<td bgcolor="#bbbbbb" width="1%" nowrap align="center">
			&nbsp;<font color="#ffffff"><b><webwork:text name="'admin.workflowtransition.all'"/></b></font>&nbsp;
		</td>
	</webwork:if>
	<webwork:else>
		<td width="1%" nowrap align="center">
			&nbsp;<b><a id="view_all_trans" href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="/transition/id" /><webwork:param name="'descriptorTab'" value="'all'" /></webwork:url>"><webwork:text name="'admin.workflowtransition.all'"/></a></b>&nbsp;
		</td>
	</webwork:else>

    <webwork:if test="/initial != true">
    <webwork:if test="/descriptorTab == 'conditions'">
		<td bgcolor="#bbbbbb" width="1%" nowrap align="center">
			&nbsp;<font color=#ffffff><b><webwork:text name="'admin.workflowtransition.conditions'"/></b> <span class="small">(<webwork:property value="/numberConditions" />)</span></font>&nbsp;
		</td>
	</webwork:if>
	<webwork:else>
		<td width="1%" nowrap align="center">
			&nbsp;<b><a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="/transition/id" /><webwork:param name="'descriptorTab'" value="'conditions'" /></webwork:url>"><webwork:text name="'admin.workflowtransition.conditions'"/></b></a><span class="small"> (<webwork:property value="/numberConditions" />)</span>&nbsp;
		</td>
	</webwork:else>
    </webwork:if>

    <webwork:if test="/descriptorTab == 'validators'">
		<td bgcolor="#bbbbbb" width="1%" nowrap align="center">
			&nbsp;<font color="#ffffff"><b><webwork:text name="'admin.workflowtransition.validators'"/></b> <span class="small">(<webwork:if test="/transition/validators"><webwork:property value="/transition/validators/size" /></webwork:if><webwork:else>0</webwork:else>)</span></font>&nbsp;
		</td>
	</webwork:if>
	<webwork:else>
		<td width="1%" nowrap align="center">
			&nbsp;<b><a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="/transition/id" /><webwork:param name="'descriptorTab'" value="'validators'" /></webwork:url>"><webwork:text name="'admin.workflowtransition.validators'"/></a></b> <span class="small">(<webwork:if test="/transition/validators"><webwork:property value="/transition/validators/size" /></webwork:if><webwork:else>0</webwork:else>)</span>&nbsp;
		</td>
	</webwork:else>

    <webwork:if test="/descriptorTab == 'postfunctions'">
		<td bgcolor="#bbbbbb" width="1%" nowrap align="center">
			&nbsp;<font color="#ffffff"><b><webwork:text name="'admin.workflowtransition.post.functions'"/></b> <span class="small">(<webwork:if test="transition/unconditionalResult && transition/unconditionalResult/postFunctions"><webwork:property value="transition/unconditionalResult/postFunctions/size" /></webwork:if><webwork:else>0</webwork:else>)</span></font>&nbsp;
		</td>
	</webwork:if>
	<webwork:else>
		<td width="1%" nowrap align="center">
			&nbsp;<b><a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="/transition/id" /><webwork:param name="'descriptorTab'" value="'postfunctions'" /></webwork:url>"><webwork:text name="'admin.workflowtransition.post.functions'"/></a></b> <span class="small">(<webwork:if test="transition/unconditionalResult && transition/unconditionalResult/postFunctions"><webwork:property value="transition/unconditionalResult/postFunctions/size" /></webwork:if><webwork:else>0</webwork:else>)</span>&nbsp;
		</td>
	</webwork:else>

    <webwork:if test="/descriptorTab == 'other'">
		<td bgcolor="#bbbbbb" width="1%" nowrap align="center">
			&nbsp;<font color="#ffffff"><b><webwork:text name="'admin.workflowtransition.other'"/></b></font>&nbsp;
		</td>
	</webwork:if>
	<webwork:elseIf test="/showOtherTab == true">
		<td width="1%" nowrap align="center">
			&nbsp;<b><a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="/transition/id" /><webwork:param name="'descriptorTab'" value="'other'" /></webwork:url>"><webwork:text name="'admin.workflowtransition.other'"/></a></b>&nbsp;
		</td>
	</webwork:elseIf>

    <td width="100%">&nbsp;</td>
</tr>
</table>

<jsp:include page="/secure/admin/views/workflow/workflow-conditions-validators-results.jsp" />

</p>
</body>
</html>
