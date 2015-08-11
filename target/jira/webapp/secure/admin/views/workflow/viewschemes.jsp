<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.workflow.workflow.schemes'"/></title>
</head>

<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.schemes.workflow.workflow.schemes'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">workflow</page:param>

    <p>
    <webwork:text name="'admin.schemes.workflow.description'"/>
    </p>
    <p>
        <webwork:text name="'admin.schemes.workflow.all.schemes.have.one.of.two.modes'"/>
        <ul>
            <li><webwork:text name="'admin.schemes.workflow.active.description'">
                <webwork:param name="'value0'"><font color="darkgreen"><b></webwork:param>
                <webwork:param name="'value1'"></b></font></webwork:param>
            </webwork:text></li>
            <li><webwork:text name="'admin.schemes.workflow.inactive.description'">
                <webwork:param name="'value0'"><font color="darkred"><b></webwork:param>
                <webwork:param name="'value1'"></b></font></webwork:param>
                <webwork:param name="'value2'"><b></webwork:param>
                <webwork:param name="'value3'"></b></webwork:param>
            </webwork:text></li>
        </ul>
        <webwork:text name="'admin.schemes.workflow.to.edit.a.scheme'"/>
    </p>
    <p>
    <webwork:text name="'admin.schemes.workflow.for.each.scheme'"/>
    <ul>
        <li><webwork:text name="'admin.schemes.workflow.assign.default.workflow'"/></li>
        <li><webwork:text name="'admin.schemes.workflow.override.this.default.workflow'"/></li>
    </ul>
    </p>
    <ul class="square">
        <li><webwork:text name="'admin.schemes.workflow.add.a.new.workflow.scheme'">
            <webwork:param name="'value0'"><b><a id="add_workflowscheme" href="<webwork:url page="AddWorkflowScheme!default.jspa"/>"></webwork:param>
            <webwork:param name="'value1'"></a></b></webwork:param>
        </webwork:text></li>
        <li><webwork:text name="'admin.schemes.workflow.list.current.workflows'">
            <webwork:param name="'value0'"><b><a id="list_workflows" href="<%= request.getContextPath() %>/secure/admin/workflows/ListWorkflows.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></b></webwork:param>
        </webwork:text></li>
    </ul>
</page:applyDecorator>

<p>

    <table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="90%"><tr><td>
    <table id="workflow_schemes_table" border="0" cellpadding="3" cellspacing="1" width="100%">
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.concepts.projects'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.common.phrases.active.inactive'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.schemes.workflow.workflows'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:iterator value="schemes" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top">
                <b>
                <a id="workflowscheme_<webwork:property value="long('id')"/>" href="<webwork:url page="EditWorkflowSchemeEntities!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>"><webwork:property value="string('name')"/></a>
                </b><br>
                <webwork:property value="string('description')"/></td>
            <td valign="top" nowrap>
            <webwork:iterator value="projects(.)">
            	<img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt=""/>
                <a href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" />"><webwork:property value="string('name')" /></a><br>
            </webwork:iterator>
            </td>
            <td valign="top" nowrap>
               <webwork:if test="/active(.) == true">
                   <font color="darkgreen"><b><webwork:text name="'admin.common.words.active'"/></b></font>
               </webwork:if>
               <webwork:else>
                   <font color="darkred"><b><webwork:text name="'admin.common.words.inactive'"/></b></font>
               </webwork:else>
            </td>
            <td valign="top" nowrap>
                <table border="0" cellpadding="2" cellspacing="0" class="grid" width="100%">
                    <tr>
                        <td><b><webwork:text name="'admin.schemes.issuesecurity.unassigned.types'"/>:</b></td>
                        <td>
                        <a title="<webwork:text name="'admin.workflows.view.workflow.steps'"/>" href="<webwork:url value="'/secure/admin/workflows/ViewWorkflowSteps.jspa'" ><webwork:param name="'workflowMode'" value="'live'" /><webwork:param name="'workflowName'" value="defaultEntity(.)/string('workflow')" /></webwork:url>"><webwork:property value="defaultEntity(.)/string('workflow')" /></a>
                        </td>
                    <tr>

                    <webwork:iterator value="nonDefaultEntities(.)">
                        <tr>
                            <td>
                                <b>
                                    <webwork:property value="/constantsManager/issueTypeObject(string('issuetype'))">
                                        <webwork:component name="'issuetype'" template="constanticon.jsp">
                                            <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                                            <webwork:param name="'iconurl'" value="./iconUrl" />
                                            <webwork:param name="'alt'"><webwork:property value="./nameTranslation" /></webwork:param>
                                            <webwork:param name="'title'"><webwork:property value="./nameTranslation" /> - <webwork:property value="./descTranslation" /></webwork:param>
                                        </webwork:component>
                                        <webwork:property value="./nameTranslation" />
                                    </webwork:property>
                                :</b>
                            </td>
                            <td><a title="<webwork:text name="'admin.workflows.view.workflow.steps'"/>" href="<webwork:url value="'/secure/admin/workflows/ViewWorkflowSteps.jspa'" >                       <webwork:param name="'workflowMode'" value="'live'" /><webwork:param name="'workflowName'" value="string('workflow')" /></webwork:url>"><webwork:property value="string('workflow')" /></a></td>
                        </tr>
                    </webwork:iterator>
                </table>
            </td>
            <td valign="top" align="left" nowrap>
                <a href="<webwork:url page="EditWorkflowSchemeEntities!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>"><webwork:text name="'admin.schemes.workflow.workflows'"/></a>
                |
                <a href="<webwork:url page="CopyWorkflowScheme.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>" title="<webwork:text name="'admin.schemes.workflow.create.a.copy'"/>"><webwork:text name="'common.words.copy'"/></a>
                <webwork:if test="/active(.) == false">
                |
                <a href="<webwork:url page="EditWorkflowScheme!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
                |
                <a id="del_<webwork:property value="string('name')"/>" href="<webwork:url page="DeleteWorkflowScheme!default.jspa"><webwork:param name="'schemeId'" value="long('id')"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
                </webwork:if>
            </td>
        </tr>
        </webwork:iterator>
        <webwork:if test="schemes/size == 0">
        <tr bgcolor="#ffffff">
            <td colspan="5"><webwork:text name="'admin.schemes.workflow.no.workflow.schemes.configured'"/></td>
        </tr>
        </webwork:if>
    </table>
    </td></tr></table>

</body>
</html>
