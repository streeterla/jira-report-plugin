<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager"%>

<html>
<head>
    <title><webwork:text name="'admin.projects.issuetypescheme.select.for.project'">
        <webwork:param name="'value0'"><webwork:property value="/project/string('name')" /></webwork:param>
    </webwork:text></title>
    <%
        WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
        webResourceManager.requireResource("jira.webresources:selectissuetypescheme");
    %>
</head>
<body>

	<page:applyDecorator name="jiraform">
        <%--<page:param name="helpURL">configcustomfield</page:param>--%>
        <%--<page:param name="helpURLFragment">#Managing+multiple+configuration+schemes</page:param>--%>
		<page:param name="title"><webwork:text name="'admin.projects.issuetypescheme.select.for.project'">
        <webwork:param name="'value0'"><webwork:property value="/project/string('name')" /></webwork:param>
    </webwork:text></page:param>
		<page:param name="instructions">
            <p><webwork:text name="'admin.projects.issuetypescheme.instructions'">
                <webwork:param name="'value0'"><strong><webwork:property value="/project/string('name')" /></strong></webwork:param>
            </webwork:text></p>
            <p>
                <webwork:if test="/subTaskIssues > 0">,
                    <webwork:text name="'admin.projects.issuetypescheme.there.are.current.issues.long'">
                        <webwork:param name="'value0'"><strong><webwork:property value="/standardIssues" /></strong></webwork:param>
                        <webwork:param name="'value1'"><strong><webwork:property value="/subTaskIssues" /></strong></webwork:param>
                    </webwork:text>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.projects.issuetypescheme.there.are.current.issues.short'">
                        <webwork:param name="'value0'"><strong><webwork:property value="/standardIssues" /></strong></webwork:param>
                    </webwork:text>
                </webwork:else>
                <webwork:text name="'admin.projects.issuetypescheme.current.scheme.is'">
                    <webwork:param name="'value0'"><strong><webwork:property value="/currentIssueTypeScheme/name" /></strong></webwork:param>
                </webwork:text>
            </p>
            <div id="choose-section" class="tools">
            <ui:radio label="''"
                      name="'createType'"
                      list="/typeOptions"
                      theme="'single'">
                <ui:param name="'noTable'" value="'true'" />
            </ui:radio>
            </div>
        </page:param>
		<page:param name="action">SelectIssueTypeSchemeForProject.jspa</page:param>
		<page:param name="width">100%</page:param>
		<page:param name="labelWidth">20%</page:param>
    	<page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="/project/long('id')" /></webwork:url></page:param>
		<page:param name="submitId">ok_submit</page:param>
		<page:param name="submitName"> <webwork:text name="'admin.common.words.ok'"/> </page:param>


        <ui:component template="multihidden.jsp" >
            <ui:param name="'fields'">projectId,fieldId</ui:param>
        </ui:component>

        <tbody id="chooseScheme">
            <ui:select label="text('admin.projects.issue.type.scheme')" name="'schemeId'"
                       list="/allSchemes" listKey="'id'" listValue="'name'" >
               <ui:param name="'size'"><webwork:property value="/allSchemes/size()" /></ui:param>
               <ui:param name="'summary'">description</ui:param>
               <ui:param name="'optionTitle'">description</ui:param>
               <ui:param name="'showOptionId'">true</ui:param>
            </ui:select>
        </tbody>

        <tbody id="chooseProject">

            <ui:select label="text('common.concepts.project')" name="'sameAsProjectId'"
                       list="/allProjects" listKey="'/configSchemeForProject(./name)/id'" listValue="'name'" >
               <ui:param name="'headerrow'"><webwork:text name="'common.words.pleaseselect'" /></ui:param>
               <ui:param name="'optionTitle'">description</ui:param>
            </ui:select>

            <ui:component label="text('admin.projects.issue.type.scheme')" value="/configScheme/name" template="textlabel.jsp" name="'issueTypeSchemeLabel'" />
        </tbody>

        <tbody id="createScheme">
        <webwork:if test="/existingAutoCreatedScheme">
            <tr><td colspan="2">
                <div class="warningBox halfWidth centered">
                    <webwork:text name="'admin.projects.issuetypescheme.already.exists'">
                        <webwork:param name="'value0'"><strong><webwork:property value="defaultNameForNewScheme" /></strong></webwork:param>
                    </webwork:text>
                    <a href="<webwork:url page="/secure/admin/ConfigureOptionSchemes!default.jspa">
                        <webwork:param name="'fieldId'" value="'issuetype'" />
                        <webwork:param name="'projectId'" value="/projectId" />
                        <webwork:param name="'schemeId'" value="/existingAutoCreatedScheme/id" />
                        <webwork:param name="'returnUrl'" >/secure/project/ViewProject.jspa?pid=<webwork:property value="/project/long('id')" /></webwork:param>
                     </webwork:url>"><webwork:text name="'admin.projects.issuetypescheme.edit.scheme'"/></a>.
                </div>
            </td></tr>

        </webwork:if>
        <webwork:else>
            <ui:component label="text('common.concepts.project')" value="/project/string('name')" template="textlabel.jsp" >
            </ui:component>

            <ui:component label="text('admin.projects.issue.type.scheme')" value="/defaultNameForNewScheme" template="textlabel.jsp" >
                <ui:param name="'description'"><webwork:text name="'admin.projects.issuetypescheme.note'"/></ui:param>
            </ui:component>

            <ui:select label="text('admin.projects.issuetypescheme.issue.types.for.scheme')" name="'selectedOptions'" template="selectmultiple.jsp"
                       list="/allOptions" listKey="'id'" listValue="'name'" >
                <ui:param name="'optionIcon'">imagePath</ui:param>
                <ui:param name="'optionTitle'">description</ui:param>
                <ui:param name="'description'"><webwork:text name="'admin.projects.issuetypescheme.select.issue.types'"/></ui:param>
            </ui:select>
        </webwork:else>
        </tbody>

        <tbody id="optionsForScheme">

            <tr>
                <td class="fieldLabelArea">
                    <webwork:text name="'admin.projects.issuetypescheme.issue.types.for.scheme'"/>:
                </td>
                <td class="fieldValueArea">
                    <webwork:iterator value="./allSchemes" status="'status'">
                        <ul class="imagebacked" id="<webwork:property value="id" />" style="display: none; width: 100%;">
                            <webwork:iterator value="/options(.)" status="'status'">
                                <li style="background-image: url('<webwork:url value="imagePath" />')">
                                    <webwork:property value="./name" /> <webwork:if test="./subTask == true"><span class="smallgrey">(<webwork:text name="'admin.projects.issuetypescheme.sub.task'"/>)</span></webwork:if><br />
                                </li>
                            </webwork:iterator>
                        </ul>
                    </webwork:iterator>
                </td>
            </tr>

        </tbody>

    </page:applyDecorator>
</body>
</html>

