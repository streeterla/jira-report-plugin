<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.workflowstep.view.workflow.step'"/> - <webwork:property value="step/name" /></title>
</head>
<body>

<table width="100%" cellpadding="4" cellspacing="0"><tr><td valign="top" width="50%">
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.workflowstep.view.workflow.step'"/> &mdash; <webwork:property value="step/name" /></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">workflow</page:param>
    <p>        
            <%@ include file="/includes/admin/workflow/workflowinfobox.jsp" %>
    </p>
    <p>
        <webwork:text name="'admin.workflowstep.thispageshows'">
            <webwork:param name="'value0'"><b><webwork:property value="step/name" /></b></webwork:param>
        </webwork:text>
        <webwork:if test="/oldStepOnDraft(/step) == true">
             <webwork:text name="'admin.workflowstep.step.exists.on.active'"/>
        </webwork:if><br>
    </p>
    <p>
        <webwork:property value="/step">
            <webwork:if test="metaAttributes/('jira.status.id')">
                <webwork:property value="metaAttributes/('jira.status.id')">
                    <webwork:property value="/status(.)">
                        <webwork:text name="'admin.workflowstep.linkedtostatus'"/>:

                        <webwork:component name="'notUsed'" template="constanticon.jsp">
                            <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                            <webwork:param name="'iconurl'" value="./string('iconurl')" />
                            <webwork:param name="'alt'"><webwork:property value="./string('name')" /></webwork:param>
                            <webwork:param name="'title'"><webwork:property value="./string('name')" /> - <webwork:property value="./string('description')" /></webwork:param>
                        </webwork:component>
                        <webwork:property value="./string('name')" /><br>
                    </webwork:property>
                </webwork:property>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.workflowstep.no.linked.status'">
                    <webwork:param name="'value0'"><b></webwork:param>
                    <webwork:param name="'value1'"></b></webwork:param>
                </webwork:text>
            </webwork:else>
        </webwork:property>
    </p>
    <ul class="square">
        <li><webwork:text name="'admin.workflows.viewallsteps'">
            <webwork:param name="'value0'"><a href="<webwork:url page="ViewWorkflowSteps.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /></webwork:url>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
            <webwork:param name="'value2'"><b><webwork:property value="/workflowDisplayName" /></b></webwork:param>
        </webwork:text></li>
        <webwork:if test="/workflow/editable == true">
            <webwork:if test="/stepWithoutTransitionsOnDraft(/step/id) == false">
                <li><webwork:text name="'admin.workflowstep.add.outgoing.transition'">
                    <webwork:param name="'value0'"><a id="add_transition" href="<webwork:url page="AddWorkflowTransition!default.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'originatingUrl'" value="'viewWorkflowStep'" /></webwork:url>"><b></webwork:param>
                    <webwork:param name="'value1'"></b></a></webwork:param>
                </webwork:text></li>
            </webwork:if>
            <webwork:if test="/step/actions/empty == false">
                <li><webwork:text name="'admin.workflowstep.delete.outgoing.transitions'">
                    <webwork:param name="'value0'"><a id="del_transition" href="<webwork:url page="DeleteWorkflowTransitions!default.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'originatingUrl'" value="'viewWorkflowStep'" /></webwork:url>"><b></webwork:param>
                    <webwork:param name="'value1'"></b></a></webwork:param>
                </webwork:text></li>
            </webwork:if>
            <li><webwork:text name="'admin.workflowstep.edit.step'">
                <webwork:param name="'value0'"><a href="<webwork:url page="EditWorkflowStep!default.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'originatingUrl'" value="'viewWorkflowStep'" /></webwork:url>"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text></li>
            <webwork:if test="canDeleteStep(/step) == true">
                <li><webwork:text name="'admin.workflowstep.delete.step'">
                    <webwork:param name="'value0'"><a id="del_step" href="<webwork:url page="DeleteWorkflowStep!default.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'originatingUrl'" value="'viewWorkflowStep'" /></webwork:url>"><b></webwork:param>
                    <webwork:param name="'value1'"></b></a></webwork:param>
                </webwork:text></li>
            </webwork:if>
        </webwork:if>
        <li><webwork:text name="'admin.workflowstep.viewproperties'">
            <webwork:param name="'value0'"><a id="view_properties_<webwork:property value="/step/id"/>" href="<webwork:url page="ViewWorkflowStepMetaAttributes.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /></webwork:url>"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text></li>
    </ul>
</page:applyDecorator>
</td><td valign="top" width="50%">
    <table cellpadding="4" cellspacing="0" border="0" align="center" width="100%"><tr><td style="border: 1px solid #bbbbb0; background: #fffff0;">
    <div class="formtitle"><webwork:text name="'admin.workflowstep.workflow.browser'"/></div>
        <table id="workflow_browser" cellpadding="3" cellspacing="0" border="0" width="100%">
            <tr>
                <td align="absmiddle" width="33%" align="right">
                    <table id="inbound_trans" cellpadding="3" cellspacing="3" align="right">
                        <webwork:if test="/inboundTransitions && inboundTransitions/empty == false">
                        <webwork:iterator value="/inboundTransitions">
                            <tr>
                                <td style="border: 1px solid #bbb;" bgcolor="#f0f0f0" nowrap>
                                    <webwork:if test="/global(.) == true">
                                        <em><a id="view_transition_<webwork:property value="id" />" href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowTransition'" value="id" /></webwork:url>"
                                               <webwork:if test="metaAttributes/('jira.description')">title="<webwork:property value="metaAttributes/('jira.description')"/>"</webwork:if>><webwork:property value="name" /></a></em>
                                    </webwork:if>
                                    <webwork:elseIf test="/initial(.) == true">
                                        <a id="view_transition_<webwork:property value="id" />" href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowTransition'" value="id" /></webwork:url>"
                                               <webwork:if test="metaAttributes/('jira.description')">title="<webwork:property value="metaAttributes/('jira.description')"/>"</webwork:if>><webwork:property value="name" /></a>
                                    </webwork:elseIf>
                                    <webwork:else>
                                        <webwork:if test="/stepsForTransition(.)/empty == false">
                                            <webwork:if test="/common(.) == true"><em></webwork:if>
                                            <a id="view_transition_<webwork:property value="id" />" href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/stepsForTransition(.)/iterator/next/id" /><webwork:param name="'workflowTransition'" value="id" /></webwork:url>"
                                               <webwork:if test="metaAttributes/('jira.description')">title="<webwork:property value="metaAttributes/('jira.description')"/>"</webwork:if>><webwork:property value="name" /></a>
                                            <webwork:if test="/common(.) == true"></em></webwork:if>
                                        </webwork:if>
                                        <webwork:else>
                                            <span class="warning"><webwork:text name="'admin.workflowstep.error'"/></span>
                                        </webwork:else>
                                    </webwork:else>
                                    <span class="smallgrey">(<webwork:property value="id" />)</span>
                                </td>
                                <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height="16" width="16" border="0" align="absmiddle"></td>
                            </tr>
                        </webwork:iterator>
                        </webwork:if>
                        <webwork:else>
                            <tr>
                                <td><span class="warning"><webwork:text name="'admin.workflowstep.notransitions'"/></span></td>
                                <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height="16" width="16" border="0" align="absmiddle"></td>
                            </tr>
                        </webwork:else>
                    </table>
                </td>
                <td align="center" valign="middle" width="33%">
                    <table cellpadding="3" cellspacing="1" width="90%">
                        <tr>
                            <td align="center" style="border: 1px solid #bbb;" bgcolor="#ffffff" nowrap>
                                <webwork:property value="/step/name" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="absmiddle" width="33%">
                     <table id="outgoing_trans" cellpadding="3" cellspacing="3" border="0">
                        <webwork:if test="/outboundTransitions && /outboundTransitions/empty == false">
                        <webwork:iterator value="/outboundTransitions">
                            <tr>
                                <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height="16" width="16" border="0" align="absmiddle"></td>
                                <td align="left" style="border: 1px solid #bbb;" bgcolor="#f0f0f0"  nowrap>
                                    <webwork:if test="/global(.) == true">
                                        <em><a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowTransition'" value="id" /></webwork:url>"
                                               <webwork:if test="metaAttributes/('jira.description')">title="<webwork:property value="metaAttributes/('jira.description')"/>"</webwork:if>><webwork:property value="name" /></a></em>
                                    </webwork:if>
                                    <webwork:else>
                                        <webwork:if test="/common(.) == true"><em></webwork:if>
                                        <a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="/step/id" /><webwork:param name="'workflowTransition'" value="id" /></webwork:url>"
                                           <webwork:if test="metaAttributes/('jira.description')">title="<webwork:property value="metaAttributes/('jira.description')"/>"</webwork:if>><webwork:property value="name" /></a>
                                        <webwork:if test="/common(.) == true"></em></webwork:if>
                                    </webwork:else>
                                    <span class="smallgrey">(<webwork:property value="id" />)</span>
                                </td>
                            </tr>
                        </webwork:iterator>
                        </webwork:if>
                        <webwork:else>
                            <tr>
                                <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height="16" width="16" border="0" align="absmiddle"></td>
                                <td><span class="warning"><webwork:text name="'admin.workflowstep.notransitions'"/></span></td>
                            </tr>
                        </webwork:else>
                    </table>

                </td>
            </tr>
            <tr>
                <td align="center">(<webwork:text name="'admin.workflowstep.incomingtransitions'"/>)</td>
                <td align="absmiddle"><b>&nbsp;</b></td>
                <td align="center">(<webwork:text name="'admin.workflowstep.outgoingtransitions'"/>)</td>
            </tr>
        </table>
        </td></tr></table>
</td></tr></table>

    <p>
        <table class="gridBox" cellpadding="3" cellspacing="1" width="90%" align="center">
            <tr bgcolor="#ffffff"><td>
                <span class="warning"><webwork:text name="'admin.common.words.note'"/></span>:
                <ul>
                    <li><webwork:text name="'admin.workflowstep.transitions.appearing.in.italics'">
                        <webwork:param name="'value0'"><em></webwork:param>
                        <webwork:param name="'value1'"></em></webwork:param>
                    </webwork:text></li>
                    <li><webwork:text name="'admin.workflowstep.to.add.transition'"/></li>
                </ul>
            </td></tr>
        </table>

    </p>


