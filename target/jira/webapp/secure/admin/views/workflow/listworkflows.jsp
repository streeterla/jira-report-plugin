<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.workflows.view.workflows'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.workflows.view.workflows'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">workflow</page:param>
    <webwork:if test="enterprise == false">
        <p>
        <webwork:text name="'admin.workflows.table.below.shows'"/>
        </p>
        <p>
            <webwork:text name="'admin.workflows.workflow.modes'"/>
            <ul>
                <li><webwork:text name="'admin.workflows.active.description'">
                    <webwork:param name="'value0'"><font color="darkgreen"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                    </webwork:text>
                </li>
                <li><webwork:text name="'admin.workflows.editing.description'">
                    <webwork:param name="'value0'"><font color="darkblue"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                    </webwork:text>
                </li>
                <li><webwork:text name="'admin.workflows.inactive.description'">
                    <webwork:param name="'value0'"><font color="darkred"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                    </webwork:text>
                </li>
            </ul>
        </p>
        <p>
            <webwork:if test="/systemAdministrator == true">
                <webwork:text name="'admin.workflows.note'">
                    <webwork:param name="'value0'"><span class="warning"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                    <webwork:param name="'value2'"><a href="<%= request.getContextPath() %>/secure/admin/XmlBackup!default.jspa"></webwork:param>
                    <webwork:param name="'value3'"></a></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.workflows.note.admin'">
                    <webwork:param name="'value0'"><span class="warning"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                    <webwork:param name="'value2'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                    <webwork:param name="'value3'"></a></webwork:param>
                </webwork:text>
            </webwork:else>
        </p>

    </webwork:if>
    <webwork:else>
        <p>
        <webwork:text name="'admin.workflows.table.below.shows'"/>
        </p>
        <p>
            <webwork:text name="'admin.workflows.workflow.modes'"/>
            <ul>
                <li><webwork:text name="'admin.workflows.active.description2'">
                    <webwork:param name="'value0'"><font color="darkgreen"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                    </webwork:text>
                </li>
                <li><webwork:text name="'admin.workflows.editing.description2'">
                    <webwork:param name="'value0'"><font color="darkblue"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                    </webwork:text>
                </li>
                <li><webwork:text name="'admin.workflows.inactive.description2'">
                    <webwork:param name="'value0'"><font color="darkred"><b></webwork:param>
                    <webwork:param name="'value1'"></b></font></webwork:param>
                    </webwork:text>
                </li>
            </ul>
            <webwork:text name="'admin.workflows.delete.workflow.instruction'"/>
        </p>
        <ul class="square">
            <li><webwork:text name="'admin.workflows.view.current.workflow.schemes'">
                <webwork:param name="'value0'"><b><a href="<%= request.getContextPath() %>/secure/admin/ViewWorkflowSchemes.jspa"></webwork:param>
                <webwork:param name="'value1'"></a></b></webwork:param>
            </webwork:text></li>
        </ul>
    </webwork:else>
</page:applyDecorator>
<webwork:if test="/tooManyActiveWorkflowsInProfessional == true">
<p>
    <table align="center" width="90%">
        <tr>
            <td>
                <div class="warningBox"><webwork:text name="'admin.workflows.error.professional.toomanyworkflows'" /></div>
            </td>
        </tr>
    </table>
</p>
</webwork:if>
<p>
    <table id="workflows_table" class="gridTabBox" cellpadding="3" cellspacing="1" align="center" width="90%">
        <tr bgcolor="#f0f0f0">
            <th>
                <b><webwork:text name="'common.words.name'"/></b>
            </th>
            <th>
                <b><webwork:text name="'common.words.description'"/></b>
            </th>
            <th>
                <b><webwork:text name="'common.words.status'"/></b>
            </th>
            <webwork:if test="enterprise == true">
            <th>
                <b><webwork:text name="'admin.menu.schemes.schemes'"/></b>
            </th>
            </webwork:if>
            <th>
                <b><webwork:text name="'admin.workflows.number.of.steps'"/></b>
            </th>
            <th>
                <b><webwork:text name="'common.words.operations'"/></b>
            </th>
        </tr>

        <webwork:iterator value="workflows" status="'status'">
            <webwork:if test="./draftWorkflow == true && /parentWorkflowActive(.) == false">
                <tr bgcolor="#ffcccc">
                <webwork:property id="bgcolour" value="'ffcccc'"/>
            </webwork:if>
            <webwork:elseIf test="@status/modulus(2) == 1">
                <tr bgcolor="#ffffff">
            </webwork:elseIf>
            <webwork:else>
                <tr bgcolor="#fffff0">
            </webwork:else>
            <td valign="top">
                 <webwork:if test="./draftWorkflow == true">
                     <img src="<%= request.getContextPath()%>/images/icons/link_out_bot.gif" alt="<webwork:text name="'common.words.draft'"/>" style="float:left;"/>
                     <div style="padding-left:20px;" class="boldTop"><webwork:property value="name"/></div>
                </webwork:if>
                <webwork:else>
                    <span class="boldTop"><webwork:property value="name"/></span>
                </webwork:else>
                <webwork:if test="./systemWorkflow == true">
                    &nbsp;<span class="smallgrey"><webwork:text name="'admin.workflows.readonly.system.workflow'"/></span>
                </webwork:if>
                <webwork:if test="./updateAuthorName != null && ./updatedDate != null">
                    <webwork:if test="./draftWorkflow == false">
                        <br/>
                    </webwork:if>
                    <webwork:if test="./updateAuthorName == ''">
                        <span class="smallgrey"><webwork:text name="'admin.workflows.last.modified.anonymous'">
                            <webwork:param name="'value0'"><webwork:property value="/outlookDate/formatDMY(./updatedDate)"/></webwork:param>
                        </webwork:text></span>
                    </webwork:if>
                    <webwork:else>
                        <span class="smallgrey"><webwork:text name="'admin.workflows.last.modified'">
                            <webwork:param name="'value0'"><webwork:property value="/outlookDate/formatDMY(./updatedDate)"/></webwork:param>
                            <webwork:param name="'value1'"><webwork:property value="/userFullName(./updateAuthorName)"/></webwork:param>
                        </webwork:text></span>
                    </webwork:else>
                </webwork:if>
            </td>
            <td valign="top"><webwork:property value="description"/></td>
            <td valign="top">
                <webwork:if test="./draftWorkflow == true">
                    <font color="darkblue"><b><webwork:text name="'common.words.draft'"/></b></font>
                </webwork:if>
                <webwork:else>
                    <webwork:if test="./active == true">
                        <font color="darkgreen"><b><webwork:text name="'admin.common.words.active'"/></b></font>
                    </webwork:if>
                    <webwork:else>
                        <font color="darkred"><b><webwork:text name="'admin.common.words.inactive'"/></b></font>
                    </webwork:else>
                </webwork:else>
            </td>
            <webwork:if test="enterprise == true">
            <td>
                <webwork:property value="/schemesForWorkflow(.)" id="workflowSchemes"/>
                <webwork:if test="@workflowSchemes && @workflowSchemes/empty == false">
                    <webwork:iterator value="@workflowSchemes">
                        <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle">
                        <a href="<%= request.getContextPath() %>/secure/admin/EditWorkflowSchemeEntities!default.jspa?schemeId=<webwork:property value="long('id')" />"><webwork:property value="string('name')" /></a><br/>
                    </webwork:iterator>
                    <webwork:if test="default == true"><br/></webwork:if>
                </webwork:if>
                <webwork:if test="default == true">
                    <span class="small"><webwork:text name="'admin.workflows.default.workflow.description'"/></span>
                </webwork:if>
            </td>
            </webwork:if>
            <td valign="top"><webwork:property value="descriptor/steps/size" /></td>
            <td valign="top" nowrap>
                <a id="steps_<webwork:property value="mode"/>_<webwork:property value="name"/>" href="<webwork:url page="ViewWorkflowSteps.jspa"><webwork:param name="'workflowMode'" value="mode" /><webwork:param name="'workflowName'" value="name" /></webwork:url>"><webwork:text name="'admin.workflows.steps'"/></a>
                |
                <a id="xml_<webwork:property value="name"/>" href="<webwork:url page="ViewWorkflowXml.jspa"><webwork:param name="'workflowMode'" value="mode" /><webwork:param name="'workflowName'" value="name" /></webwork:url>"><webwork:text name="'admin.common.words.xml'"/></a>
                |
                <a id="copy_<webwork:property value="name"/>" href="<webwork:url page="CloneWorkflow!default.jspa"><webwork:param name="'workflowMode'" value="mode" /><webwork:param name="'workflowName'" value="name" /></webwork:url>"><webwork:text name="'common.words.copy'"/></a>
                <webwork:if test="./editable == true">
                    |
                    <a id="edit_<webwork:property value="mode"/>_<webwork:property value="name"/>" href="<webwork:url page="EditWorkflow!default.jspa"><webwork:param name="'workflowMode'" value="mode" /><webwork:param name="'workflowName'" value="name" /></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
                    <webwork:if test="enterprise == false || (enterprise == true && @workflowSchemes/empty == true) || draftWorkflow == true">
                        |
                        <a id="del_<webwork:property value="name"/>" href="<webwork:url page="DeleteWorkflow.jspa"><webwork:param name="'workflowMode'" value="mode" /><webwork:param name="'workflowName'" value="name" /></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
                  </webwork:if>
                </webwork:if>
                <webwork:if test="./active == true && ./systemWorkflow == false && ./hasDraftWorkflow == false">
                    | <a id="createDraft_<webwork:property value="name"/>" href="<webwork:url page="CreateDraftWorkflow.jspa"><webwork:param name="'draftWorkflowName'" value="name" /></webwork:url>"><webwork:text name="'admin.workflows.create.draft'"/></a>
                </webwork:if>
                <webwork:if test="/enterprise == false && ./active == false && noProjects == false">
                |
                <a id="activate_<webwork:property value="name"/>" href="<webwork:url page="ActivateWorkflow!default.jspa"><webwork:param name="'workflowMode'" value="mode" /><webwork:param name="'workflowName'" value="name" /></webwork:url>"><webwork:text name="'admin.common.words.activate'"/></a>
                </webwork:if>
                <webwork:if test="./draftWorkflow == true && /parentWorkflowActive(.) == true">
                    | <a id="publishDraft_<webwork:property value="name"/>" href="<webwork:url page="PublishDraftWorkflow!default.jspa"><webwork:param name="'workflowName'" value="name" /><webwork:param name="'workflowMode'" value="mode" /></webwork:url>"><webwork:text name="'common.words.publish'"/></a>
                </webwork:if>

            </td>
        </tr>
        </webwork:iterator>
    </table>

    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddWorkflow.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.workflows.add.new.workflow'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.workflows.instructions1'"/>
            <ul>
                <li><webwork:text name="'admin.workflows.provide.a.name'"/>
                <li><webwork:text name="'admin.workflows.add.the.steps'"/>
                <li><webwork:text name="'admin.workflows.create.transitions'"/>
                <webwork:if test="enterprise == true">
                    <li><webwork:text name="'admin.workflows.enable.the.workflow'"/>
                </webwork:if>
                <webwork:else>
                    <li><webwork:text name="'admin.workflows.make.default'"/>
                </webwork:else>
            </ul>
            <webwork:if test="/systemAdministrator == true">
                <webwork:text name="'admin.workflows.create.or.import.from.xml'">
                    <webwork:param name="'value0'"><b><a href="<webwork:url page="ImportWorkflowFromXml!default.jspa" />"></webwork:param>
                    <webwork:param name="'value1'"></a></b></webwork:param>
                </webwork:text>
            </webwork:if>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'newWorkflowName'" size="'30'">
            <ui:param name="'description'"><webwork:text name="'admin.common.phrases.use.only.ascii'"/></ui:param>
        </ui:textfield>
        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />

    </page:applyDecorator>
    </p>
</p>
</body>
</html>
