<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.workflows.view.workflow.steps'"/> - <webwork:property value="/workflowDisplayName" /></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.workflows.view.workflow.steps'"/> &mdash; <webwork:property value="/workflowDisplayName" /></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">workflow</page:param>
    <p>
        <%@ include file="/includes/admin/workflow/workflowinfobox.jsp" %>
    </p>
    <p>
        <webwork:text name="'admin.workflows.this.page.shows'">
            <webwork:param name="'value0'"><b><webwork:property value="/workflowDisplayName" /></b></webwork:param>
        </webwork:text>
        <webwork:if test="/workflow/draftWorkflow == true">
            <webwork:text name="'admin.workflowstep.steps.exists.on.active'"/>
        </webwork:if>
    </p>
    <p>
        <webwork:property value="workflow">
            <webwork:if test="./editable == false">
                <webwork:if test="./active == true"><webwork:text name="'admin.workflows.not.editable.because.active'">
                    <webwork:param name="'value0'"><font color="darkgreen"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                </webwork:text></webwork:if>
                <webwork:elseIf test="./systemWorkflow == true"><webwork:text name="'admin.workflows.not.editable.because.system.workflow'">
                    <webwork:param name="'value0'"><b><webwork:property value="workflow/name" /></b></webwork:param>
                </webwork:text></webwork:elseIf>
            </webwork:if>
        </webwork:property>
    </p>
    <ul class="square">
        <li><webwork:text name="'admin.workflows.view.all.workflows'">
            <webwork:param name="'value0'"><a href="ListWorkflows.jspa"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text></li>
        <li><webwork:text name="'admin.workflows.view.all.statuses'">
            <webwork:param name="'value0'"><a href="ViewStatuses.jspa"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text></li>
    </ul>
</page:applyDecorator>
<p>
    <table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="90%"><tr><td>
    <table id="steps_table" border="0" cellpadding="3" cellspacing="1" width="100%">
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink">
                <webwork:text name="'admin.workflows.step.name.id'">
                    <webwork:param name="'value0'"><b></webwork:param>
                    <webwork:param name="'value1'"></b></webwork:param>
                    <webwork:param name="'value2'"><span class="smallgrey"></webwork:param>
                    <webwork:param name="'value3'"></span></webwork:param>
                </webwork:text>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.workflows.linked.status'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.workflows.transitions'">
                    <webwork:param name="'value0'"><span class="smallgrey"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                </webwork:text></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:iterator value="workflow/descriptor/steps" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top">
                <b><a href="<webwork:url page="ViewWorkflowStep.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="./id" /></webwork:url>"><webwork:property value="name"/></a></b>
                <span class="smallgrey">(<webwork:property value="id" />)</span>
            </td>
            <td valign="top">
                <webwork:if test="metaAttributes/('jira.status.id')">
                <webwork:property value="metaAttributes/('jira.status.id')">
                    <webwork:property value="/status(.)">
                        <webwork:component name="'notUsed'" template="constanticon.jsp">
                            <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                            <webwork:param name="'iconurl'" value="./iconUrl" />
                            <webwork:param name="'alt'"><webwork:property value="./nameTranslation" /></webwork:param>
                            <webwork:param name="'title'"><webwork:property value="./nameTranslation" /> - <webwork:property value="./descTranslation" /></webwork:param>
                        </webwork:component>
                        <webwork:property value="./nameTranslation" />
                    </webwork:property>
                </webwork:property>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.workflowtransition.no.linked.status'"/>
                </webwork:else>
            </td>
            <td valign="top">
                <webwork:iterator value="actions">
                    <webwork:if test="./common == true"><em></webwork:if>
                    <a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="../id" /><webwork:param name="'workflowTransition'" value="id" /></webwork:url>"
                       <webwork:if test="./metaAttributes/('jira.description')">title="<webwork:property value="./metaAttributes/('jira.description')" />"</webwork:if>><webwork:property value="name" /></a>
                    <webwork:if test="./common == true"></em></webwork:if>
                    <span class="smallgrey">(<webwork:property value="id"/>)</span>
                    <br>
                    <span class="smallgrey">&gt;&gt;
                        <webwork:if test="/transitionWithoutStepChange(.) == true">
                            <webwork:property value="../name"/>
                        </webwork:if>
                        <webwork:else>
                            <webwork:property value="/workflow/descriptor/step(unconditionalResult/step)/name" />
                        </webwork:else>
                    </span><br>
                </webwork:iterator>

                <%-- Global Actions --%>
                <webwork:iterator value="workflow/descriptor/globalActions" status="'status'">
                    <em><a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name"/><webwork:param name="'workflowTransition'" value="id" /></webwork:url>"
                           <webwork:if test="./metaAttributes/('jira.description')">title="<webwork:property value="./metaAttributes/('jira.description')" />"</webwork:if>><webwork:property value="name" /></a></em> <span class="smallgrey">(<webwork:property value="id"/>)</span>
                    <br>
                    <span class="smallgrey">&gt;&gt; <webwork:property value="/workflow/descriptor/step(unconditionalResult/step)/name" /></span><br>
                </webwork:iterator>
            </td>
            <td valign="top" nowrap>
                <webwork:if test="workflow/editable == true">
                    <webwork:if test="/stepWithoutTransitionsOnDraft(id) == false">
                        <a id="add_trans_<webwork:property value="id" />" href="<webwork:url page="AddWorkflowTransition!default.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="id" /></webwork:url>"><webwork:text name="'admin.workflows.add.transition'"/></a>
                        |
                    </webwork:if>
                    <webwork:if test="actions/empty == false">
                        <a id="del_trans_<webwork:property value="id" />" href="<webwork:url page="DeleteWorkflowTransitions!default.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="id" /></webwork:url>"><webwork:text name="'admin.workflows.delete.transitions'"/></a>
                        |
                    </webwork:if>
                    <a id="edit_step_<webwork:property value="id" />" href="<webwork:url page="EditWorkflowStep!default.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="id" /></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
                    |
                </webwork:if>
                <a href="<webwork:url page="ViewWorkflowStepMetaAttributes.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="id" /></webwork:url>"><webwork:text name="'admin.workflows.view.properties'"/></a>
                <%-- canDeleteStep checks if the workflow isEditable --%>
                <webwork:if test="canDeleteStep(.) == true">
                    |
                    <a id="delete_step_<webwork:property value="id" />" href="<webwork:url page="DeleteWorkflowStep!default.jspa"><webwork:param name="'workflowMode'" value="/workflow/mode" /><webwork:param name="'workflowName'" value="/workflow/name" /><webwork:param name="'workflowStep'" value="id" /></webwork:url>"><webwork:text name="'admin.workflows.delete.step'"/></a>
                </webwork:if>
            </td>
        </tr>
        </webwork:iterator>
    </table>
    </td></tr></table>

    <webwork:if test="workflow/editable == true">
        <p>

        <%-- Check if there are any available (unlinked) statuses, as we cannot have more than one step per JIRA status
             in the same workflow --%>
        <webwork:if test="unlinkedStatuses && unlinkedStatuses/empty == false">
        <page:applyDecorator name="jiraform">
            <page:param name="action">AddWorkflowStep.jspa</page:param>
            <page:param name="submitId">add_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
            <page:param name="title"><webwork:text name="'admin.workflows.add.new.step'"/></page:param>
            <page:param name="width">100%</page:param>

            <ui:component name="'workflowName'" value="workflow/name"  template="hidden.jsp"  theme="'single'" />
            <ui:component name="'workflowMode'" value="workflow/mode" template="hidden.jsp" />

            <ui:textfield label="text('admin.workflows.step.name')" name="'stepName'" size="'30'" />

            <ui:select label="text('admin.workflows.linked.status')" name="'stepStatus'" list="unlinkedStatuses" listKey="'genericValue/string('id')'" listValue="'nameTranslation'" />

        </page:applyDecorator>
        </webwork:if>
        <webwork:else>
        <page:applyDecorator name="jirapanel">
            <page:param name="title"><webwork:text name="'admin.workflows.add.new.step'"/></page:param>
            <page:param name="width">100%</page:param>
            <p>
            <webwork:text name="'admin.workflows.all.existing.issue.statuses.are.used'">
                <webwork:param name="'value0'"><br></webwork:param>
                <webwork:param name="'value1'"><a href="ViewStatuses.jspa"></webwork:param>
                <webwork:param name="'value2'"></a></webwork:param>
            </webwork:text>
            </p>
        </page:applyDecorator>
        </webwork:else>
        </p>
    </webwork:if>
</body>
</html>
