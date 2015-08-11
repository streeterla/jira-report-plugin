<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:if test="/active(scheme) == false">
                <webwork:text name="'admin.schemes.workflow.edit.edit.workflows.for'">
                    <webwork:param name="'value0'"><webwork:property value="scheme/string('name')" /></webwork:param>
                </webwork:text>
           </webwork:if>
           <webwork:else>
                <webwork:text name="'admin.schemes.workflow.view.workflows.for'">
                    <webwork:param name="'value0'"><webwork:property value="scheme/string('name')" /></webwork:param>
                </webwork:text>               
           </webwork:else></title>
</head>

<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:if test="/active(scheme) == false"><webwork:text name="'admin.schemes.workflow.edit.edit.workflows.for'">
        <webwork:param name="'value0'"><webwork:property value="scheme/string('name')" /></webwork:param>
    </webwork:text></webwork:if><webwork:else><webwork:text name="'admin.schemes.workflow.view.workflows.for'">
        <webwork:param name="'value0'"><webwork:property value="scheme/string('name')" /></webwork:param>
    </webwork:text></webwork:else></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">workflow_schemes</page:param>
    <p>
    <webwork:if test="/active(scheme) == true">
        <webwork:text name="'admin.schemes.workflow.edit.page.description.disabled'">
            <webwork:param name="'value0'"><webwork:property value="scheme/string('name')"/></webwork:param>
        </webwork:text>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'admin.schemes.workflow.edit.page.description'">
            <webwork:param name="'value0'"><webwork:property value="scheme/string('name')"/></webwork:param>
        </webwork:text>
    </webwork:else>
    </p>
    <ul class="square">
        <webwork:if test="/active(scheme) == false">
            <li><webwork:text name="'admin.schemes.workflow.assign.an.issue.to.this.workflow.scheme'">
                <webwork:param name="'value0'"><a href="<webwork:url page="AddWorkflowSchemeEntity!default.jspa"><webwork:param name="'schemeId'" value="scheme/string('id')"/></webwork:url>"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text></li>
        </webwork:if>
        <li><webwork:text name="'admin.schemes.workflow.view.all.workflow.schemes'">
            <webwork:param name="'value0'"><a href="ViewWorkflowSchemes.jspa"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text></li>
    </ul>
</page:applyDecorator>

<p>

    <table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="90%"><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width="100%">
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink">
                <b><webwork:text name="'common.concepts.issuetype'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'issue.field.workflow'"/></b>
            </td>
            <webwork:if test="/active(scheme) == false">
                <td class="colHeaderLink" width="10%">
                    <b><webwork:text name="'common.words.operations'"/></b>
                </td>
            </webwork:if>
        </tr>

        <webwork:if test="defaultEntity != null">
        <webwork:property value="defaultEntity">
        <tr bgcolor="#ffffcc">
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.schemes.workflow.all.unassigned.issue.types'"/></b><br>
                <span class="small"><webwork:text name="'admin.schemes.workflow.issues.of.all.types.not.explicitly.assigned.will.use.this.workflow'"/></span>
            </td>
             <td valign="top">
                <webwork:property value="/workflow(string('workflow'))">
                    <a title="<webwork:text name="'admin.workflows.view.workflow.steps'"/>" href="<webwork:url value="'/secure/admin/workflows/ViewWorkflowSteps.jspa'" ><webwork:param name="'workflowMode'" value="mode" /><webwork:param name="'workflowName'" value="name" /></webwork:url>"><webwork:property value="name" /></a>
                </webwork:property>
            </td>
            <webwork:if test="../active(scheme) == false">
                <td nowrap valign="top">
                    <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt=""/>
                    <a href="<webwork:url page="DeleteWorkflowSchemeEntity!default.jspa"><webwork:param name="'id'" value="long('id')"/><webwork:param name="'schemeId'" value="schemeId"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
                </td>
            </webwork:if>
        </tr>
        </webwork:property>
        </webwork:if>

        <webwork:iterator value="nonDefaultEntities" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top">
                <webwork:property value="/constantsManager/issueTypeObject(string('issuetype'))">
                    <webwork:component name="'issuetype'" template="constanticon.jsp">
                        <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                        <webwork:param name="'iconurl'" value="./iconUrl" />
                        <webwork:param name="'alt'"><webwork:property value="./nameTranslation" /></webwork:param>
                        <webwork:param name="'title'"><webwork:property value="./nameTranslation" /> - <webwork:property value="./descTranslation" /></webwork:param>
                    </webwork:component>
                    <webwork:property value="./nameTranslation" />
                </webwork:property>
            </td>
            <td valign="top">
                <webwork:property value="/workflow(string('workflow'))">
                    <a title="<webwork:text name="'admin.workflows.view.workflow.steps'"/>" href="<webwork:url value="'/secure/admin/workflows/ViewWorkflowSteps.jspa'" ><webwork:param name="'workflowMode'" value="mode" /><webwork:param name="'workflowName'" value="name" /></webwork:url>"><webwork:property value="name" /></a>
                </webwork:property>
            </td>
            <webwork:if test="../active(scheme) == false">
                <td nowrap valign="top">
                    <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt=""/>
                    <a id="del_<webwork:property value="/constantsManager/issueType(string('issuetype'))/string('name')"/>_<webwork:property value="/workflow(string('workflow'))/name"/>" href="<webwork:url page="DeleteWorkflowSchemeEntity!default.jspa"><webwork:param name="'id'" value="long('id')"/><webwork:param name="'schemeId'" value="schemeId"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
                </td>
            </webwork:if>
        </tr>
        </webwork:iterator>
    </table>
    </td></tr></table>

    </body>
</html>
