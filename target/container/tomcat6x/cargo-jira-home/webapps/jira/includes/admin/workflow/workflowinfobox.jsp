<%--
  -- workflowinfobox.jsp
  --
  -- This is used to display information about a draft/active workflow that is being edited and provides
  -- a link to jump from the draft to the active and vice versa.  This requires a getWorkflow() method to be
  -- available by the calling webwork action (see /workflow below).
  -- Information being displayed also depends on a getStep() or getTransition() method being available.  If no
  -- step and no transition can be found, no information about who last edited the page will be displayed.
  --%>
<%@ taglib uri="jiratags" prefix="jira" %>
<webwork:if test="/workflow/systemWorkflow == false && /workflow/active == true">
    <div class="infoBox">
            <webwork:if test="/workflow/draftWorkflow == false">
                        <webwork:text name="'admin.workflow.infobox.viewing.active'"/>
                        <webwork:if test="/workflow/hasDraftWorkflow == true">
                            <webwork:text name="'admin.workflow.infobox.edit.draft'">
                                <webwork:param name="'value0'"><a id="view_draft_workflow" href="<webwork:url page="ViewWorkflowSteps.jspa"><webwork:param name="'workflowMode'" value="'draft'"/><webwork:param name="'workflowName'" value="/workflow/name"/></webwork:url>"></webwork:param>
                                <webwork:param name="'value1'"></a></webwork:param>
                            </webwork:text>
                        </webwork:if>
                        <webwork:else>
                            <webwork:text name="'admin.workflow.infobox.create.draft'">
                                <webwork:param name="'value0'"><a id="create_draft_workflow" href="<webwork:url page="CreateDraftWorkflow.jspa"><webwork:param name="'draftWorkflowName'" value="/workflow/name"/></webwork:url>"></webwork:param>
                                <webwork:param name="'value1'"></a></webwork:param>
                            </webwork:text>
                        </webwork:else>
                        <webwork:if test="/step == null && /transition == null && /workflow/updatedDate != null">
                            <br/>
                            <webwork:if test="/workflow/updateAuthorName == ''">
                                <webwork:text name="'admin.workflow.infobox.workflow.last.edited.by.anonymous'">
                                    <webwork:param name="'value0'"><strong></webwork:param>
                                    <webwork:param name="'value1'"></strong></webwork:param>
                                    <webwork:param name="'value2'"><webwork:property value="/outlookDate/formatDMYHMS(/workflow/updatedDate)"/></webwork:param>
                                </webwork:text>
                            </webwork:if>
                            <webwork:elseIf test="/remoteUser != null && /remoteUser/name/equals(/workflow/updateAuthorName) == true">
                                <webwork:text name="'admin.workflow.infobox.workflow.last.edited.by.you'">
                                    <webwork:param name="'value0'"><strong></webwork:param>
                                    <webwork:param name="'value1'"></strong></webwork:param>
                                    <webwork:param name="'value2'"><webwork:property value="/outlookDate/formatDMYHMS(/workflow/updatedDate)"/></webwork:param>
                                </webwork:text>
                            </webwork:elseIf>
                            <webwork:else>
                                <webwork:text name="'admin.workflow.infobox.workflow.last.edited'">
                                    <webwork:param name="'value0'"><jira:formatuser user="/workflow/updateAuthorName" type="'profileLink'" id="'workflow_edited'"/></webwork:param>
                                    <webwork:param name="'value1'"><webwork:property value="/outlookDate/formatDMYHMS(/workflow/updatedDate)"/></webwork:param>
                                </webwork:text>
                            </webwork:else>
                        </webwork:if>
                </webwork:if>
                <webwork:else>
                        <webwork:text name="'admin.workflow.infobox.editing.draft.view.original'">
                            <webwork:param name="'value0'"><a id="view_live_workflow" href="<webwork:url page="ViewWorkflowSteps.jspa"><webwork:param name="'workflowMode'" value="'live'"/><webwork:param name="'workflowName'" value="/workflow/name"/></webwork:url>"></webwork:param>
                            <webwork:param name="'value1'"></a></webwork:param>
                            <webwork:param name="'value2'"><a id="publish_draft_workflow" href="<webwork:url page="PublishDraftWorkflow!default.jspa"><webwork:param name="'workflowMode'" value="'draft'"/><webwork:param name="'workflowName'" value="/workflow/name"/></webwork:url>"></webwork:param>
                        </webwork:text>
                        <webwork:if test="/step == null && /transition == null && /workflow/updatedDate != null">
                            <br/>
                            <webwork:if test="/workflow/updateAuthorName == ''">
                                <webwork:text name="'admin.workflow.infobox.draft.last.edited.by.anonymous'">
                                    <webwork:param name="'value0'"><strong></webwork:param>
                                    <webwork:param name="'value1'"></strong></webwork:param>
                                    <webwork:param name="'value2'"><webwork:property value="/outlookDate/formatDMYHMS(/workflow/updatedDate)"/></webwork:param>
                                </webwork:text>
                            </webwork:if>
                            <webwork:elseIf test="/remoteUser != null && /remoteUser/name/equals(/workflow/updateAuthorName) == true">
                                <webwork:text name="'admin.workflow.infobox.draft.last.edited.by.you'">
                                    <webwork:param name="'value0'"><strong></webwork:param>
                                    <webwork:param name="'value1'"></strong></webwork:param>
                                    <webwork:param name="'value2'"><webwork:property value="/outlookDate/formatDMYHMS(/workflow/updatedDate)"/></webwork:param>
                                </webwork:text>
                            </webwork:elseIf>
                            <webwork:else>
                                <webwork:text name="'admin.workflow.infobox.draft.last.edited'">
                                    <webwork:param name="'value0'"><jira:formatuser user="/workflow/updateAuthorName" type="'profileLink'" id="'draft_workflow_edited'"/></webwork:param>
                                    <webwork:param name="'value1'"><webwork:property value="/outlookDate/formatDMYHMS(/workflow/updatedDate)"/></webwork:param>
                                </webwork:text>
                            </webwork:else>
                        </webwork:if>
                        <webwork:elseIf test="/step != null && /stepWithoutTransitionsOnDraft(/step/id) == true">
                            <p>
                            <webwork:text name="'admin.workflowtransitions.add.transition.draft.step.without.transition'">
                                <webwork:param name="'value0'"><strong></webwork:param>
                                <webwork:param name="'value1'"><webwork:property value="step/name" /></webwork:param>
                                <webwork:param name="'value2'"></strong></webwork:param>
                            </webwork:text>
                            </p>
                        </webwork:elseIf>
                </webwork:else>
        </div>
</webwork:if>
