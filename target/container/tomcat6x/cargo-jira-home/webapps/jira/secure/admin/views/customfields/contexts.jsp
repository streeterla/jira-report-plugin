<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<table class="blank">
<webwork:if test="./enabled != true">
    <title><webwork:text name="'admin.issuefields.customfields.contexts'"/></title>
    <tr><td colspan="2"><webwork:text name="'admin.issuefields.customfields.not.configured.context'"/></td></tr>
</webwork:if>
<webwork:else>
    <title><webwork:text name="'admin.issuefields.customfields.contexts'"/></title>

    <webwork:if test="./global == true">
    <tr><td colspan="2"><webwork:text name="'admin.issuefields.customfields.global.all.issues'"/></td></tr>
    </webwork:if>

    <webwork:if test="./allIssueTypes == false">
    <tr>
        <td><webwork:text name="'admin.issuefields.customfields.issue.types'"/>:</td>
        <td>
        <webwork:iterator value="./associatedIssueTypes" status="'status'">
            <webwork:property value="/constantsManager/issueTypeObject(./string('id'))">
                <a style="padding-right: 0.3em;" href="EditIssueType!default.jspa?returnUrl=ViewCustomFields.jspa&id=<webwork:property value="./id" />">
<webwork:component name="'customfieldicon'" template="constanticon.jsp">
  <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
  <webwork:param name="'iconurl'" value="iconUrl" />                             -
  <webwork:param name="'alt'"><webwork:property value="nameTranslation" /></webwork:param>
  <webwork:param name="'title'"><webwork:property value="nameTranslation"/> - <webwork:property value="descTranslation"/></webwork:param>
</webwork:component>
                </a>
            </webwork:property>
        </webwork:iterator>
        </td>
    </tr>
    </webwork:if>

    <webwork:if test="./associatedProjectCategories != null && ./associatedProjectCategories/empty == false">
    <tr>
        <td><webwork:text name="'admin.issuefields.customfields.project.categories'"/>:</td>
        <td><webwork:iterator value="./associatedProjectCategories" status="'status'">
           <a title="<webwork:property value="string('name')" /><webwork:property value="string('description')"><webwork:if test=". && !./equals('')"> - <webwork:property value="." /></webwork:if></webwork:property>" href="EditProjectCategory!default.jspa?returnUrl=ViewCustomFields.jspa&id=<webwork:property value="long('id')" />"><webwork:property value="string('name')" /></a><br />
         </webwork:iterator></td>
    </tr>
    </webwork:if>
    <webwork:if test="./associatedProjects != null && ./associatedProjects/empty == false">
    <tr>
        <td><webwork:text name="'admin.issuefields.customfields.projects'"/>:</td>
        <td><webwork:iterator value="./associatedProjects" status="'status'">
           <a title="<webwork:property value="string('name')" /><webwork:property value="string('description')"><webwork:if test=". && !./equals('')"> - <webwork:property value="." /></webwork:if></webwork:property>" href="ViewProject.jspa?pid=<webwork:property value="long('id')" />"><webwork:property value="string('name')" /></a><br />
         </webwork:iterator></td>
    </tr>
    </webwork:if>
</webwork:else>
</table>

