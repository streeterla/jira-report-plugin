<%@ page import="com.atlassian.jira.ComponentManager"%>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<webwork:if test="/schemeId != null">
<webwork:property id="command" value="'Modify'" />
</webwork:if>
<webwork:else>
<webwork:property id="command" value="'Add'" />
</webwork:else>

<%-- The page is used for the manageable option object --%>
<webwork:property value="/manageableOption" >
<html>
<head>
	<title><webwork:text name="'admin.issuesettings.issuetypes.issue.type.scheme'">
	    <webwork:param name="'value0'"><webwork:property value="@command" /> <webwork:property value="title" /></webwork:param>
	</webwork:text></title>
<%
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:editissuetypescheme");
%>

</head>
<body>
<style>
.fieldLabelArea
{
    width: 20%;
}

#optionsContainer
{
    height: <webwork:property value="/maxHeight" />px;
    margin: 0 auto;
    width: 80%;
    clear: both;
}

#optionsContainer .jiraformheader
{
    border: 1px #cccccc solid;
    border-bottom: none;
}

#optionsContainer h4
{
    padding: 3px;
    height: 1.5em;
    overflow: hidden;
}

#selectedOptions, #availableOptions
{
    height: <webwork:property value="/maxHeight" />px;
    border: 1px #cccccc solid;
}

#optionsContainer #left
{
    float: left;
    <webwork:if test="/allowEditOptions == true">
        width: 47%;
    </webwork:if>
    <webwork:else>
        width: 100%;
    </webwork:else>
}

#optionsContainer #right
{
    float: right;
    width: 47%;
}
#selectedOptions li, #availableOptions li
{
    cursor: move;
}
</style>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.issuesettings.form.title'">
        <webwork:param name="'value0'"><webwork:property value="@command" /></webwork:param>
        <webwork:param name="'value1'"><webwork:property value="title" /></webwork:param>
    </webwork:text></page:param>
    <page:param name="instructions">
        <p>
            <webwork:text name="'admin.issuesettings.you.can.configure'">
                <webwork:param name="'value0'"><webwork:property value="title" /></webwork:param>
                <webwork:param name="'value1'"><strong></webwork:param>
                <webwork:param name="'value2'"></strong></webwork:param>
            </webwork:text>
            <webwork:if test="/allowEditOptions == true">
            <webwork:text name="'admin.issuesettings.similarly.drag.drop.to.remove'">
                <webwork:param name="'value0'"><strong></webwork:param>
                <webwork:param name="'value1'"></strong></webwork:param>
            </webwork:text>
            </webwork:if>
        </p>
        <webwork:if test="/configScheme/global == true">
            <div class="noteBox">
                <webwork:text name="'admin.issuesettings.note.editing.global.scheme'">
                    <webwork:param name="'value0'"><strong></webwork:param>
                    <webwork:param name="'value1'"></strong></webwork:param>
                </webwork:text>
            </div>
        </webwork:if>
        <webwork:property value="/configScheme/associatedProjects">
        <webwork:if test=". && ./size() > 1">
            <div class="noteBox">
                <webwork:text name="'admin.issuesettings.note.editing.scheme.which.affects.x'">
                    <webwork:param name="'value0'"><strong></webwork:param>
                    <webwork:param name="'value1'"></strong></webwork:param>
                    <webwork:param name="'value2'"><strong><webwork:property value="./size()" /></strong></webwork:param>
                </webwork:text>
            <webwork:iterator value="." status="'status'">
                <strong><webwork:property value="./string('name')" /></strong><webwork:if test="@status/last == false">, </webwork:if><webwork:else>.</webwork:else>
            </webwork:iterator>
                <webwork:text name="'admin.issuesettings.if.not.changing'">
                    <webwork:param name="'value0'"><strong></webwork:param>
                    <webwork:param name="'value1'"></strong></webwork:param>
                </webwork:text>
                <webwork:if test="/projectId">
                    <webwork:text name="'admin.issuesettings.create.copy.of.scheme'">
                        <webwork:param name="'value0'"><a href="<webwork:url value="'/secure/admin/ConfigureOptionSchemes!copy.jspa'" >
                                        <webwork:param name="'fieldId'" value="'issuetype'" />
                                        <webwork:param name="'schemeId'" value="/schemeId" />
                                        <webwork:param name="'projectId'" value="/projectId" />
                                        <webwork:param name="'returnUrl'" value="/returnUrl" />
                                    </webwork:url>"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text>
                </webwork:if>
            </div>
        </webwork:if>
        </webwork:property>

        <webwork:if test="/projectId && /schemeId == null">
            <div class="infoBox">
                <webwork:text name="'admin.issuesettings.this.scheme.will.be.automatically.selected'">
                    <webwork:param name="'value0'"><strong><webwork:property value="/project/string('name')" /></strong></webwork:param>
                </webwork:text>
            </div>
        </webwork:if>

        <%@ include file="/includes/admin/javascriptrequired.jsp"%>
    </page:param>
    <page:param name="action">ConfigureOptionSchemes.jspa</page:param>
    <page:param name="submitName"><webwork:text name="'common.words.save'"/></page:param>
    <page:param name="submitId">submitSave</page:param>
    <page:param name="submitClassName">standard</page:param>
    <page:param name="buttons">
        <webwork:if test="/schemeId">
            <input type="reset" value="<webwork:text name="'admin.common.words.reset'"/>" onclick="window.location='<webwork:url value="'ConfigureOptionSchemes!default.jspa'" ><webwork:param name="'fieldId'" value="/fieldId" /><webwork:param name="'schemeId'" value="/schemeId" /></webwork:url>';return false;"/>
        </webwork:if>
    </page:param>
    <page:param name="cancelURI">ManageIssueTypeSchemes!default.jspa</page:param>

    <webwork:if test="/allowEdit == true">
        <ui:component template="multihidden.jsp" >
            <ui:param name="'fields'">schemeId,fieldId,projectId</ui:param>
        </ui:component>

        <ui:textfield label="text('admin.issuesettings.scheme.name')" name="'name'" >
            <ui:param name="'description'"><webwork:text name="'admin.issuesettings.name.for.scheme'"/></ui:param>
            <ui:param name="'mandatory'">true</ui:param>
            <ui:param name="'cssId'">name</ui:param>
            <ui:param name="'class'">standardField</ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'description'" size="40">
            <ui:param name="'cssId'">description</ui:param>
            <ui:param name="'description'">
                <webwork:text name="'admin.issuesettings.description.for.scheme'"/>
            </ui:param>
            <ui:param name="'class'">standardField</ui:param>
        </ui:textfield>
    </webwork:if>
    <webwork:else>
        <%--<ui:component label="'Field Type'" value="/customFieldType/name" template="textlabel.jsp" />--%>
        <ui:component template="multihidden.jsp" >
            <ui:param name="'fields'">schemeId,fieldId,name,description</ui:param>
        </ui:component>
    </webwork:else>


    <ui:select label="text('admin.issuesettings.default.issue.type')" name="'defaultOption'"
               list="/allOptions" listKey="'id'" listValue="'name'" >
        <ui:param name="'summary'">description</ui:param>
        <ui:param name="'headerrow'"><webwork:text name="'common.words.none'"/></ui:param>
        <ui:param name="'headervalue'"></ui:param>
        <ui:param name="'optionIcon'">imagePath</ui:param>
        <ui:param name="'optionTitle'">description</ui:param>
        <ui:param name="'description'"><webwork:text name="'admin.issuesettings.select.default.issue.types'">
            <webwork:param name="'value0'"><webwork:property value="title" /></webwork:param>
        </webwork:text></ui:param>
    </ui:select>

<tr><td colspan="2">


<div id="optionsContainer" style="display:inline;">
<div id="left">
    <h4 class="jiraformheader">
        <webwork:if test="/allowEditOptions == true"><div class="toolbar subText"><a href="#" id="selectedOptionsRemoveAll">remove all</a></div></webwork:if>
        <webwork:text name="'admin.issuesettings.issuetypes.for.current.scheme'">
            <webwork:param name="'value0'"><webwork:property value="title" /></webwork:param>
        </webwork:text>
    </h4>
    <ul id="selectedOptions" class="imagebacked">
        <webwork:iterator value="/optionsForScheme" status="'status'">
            <li id="selectedOptions_<webwork:property value="./id" />" style="background-image:url('<webwork:url value="./imagePath" />')">
                <webwork:property value="./name" /> <webwork:if test="./subTask == true"><span class="smallgrey">(sub-task)</span></webwork:if>
            </li>
        </webwork:iterator>
    </ul>
</div>

<webwork:if test="/allowEditOptions == true">
<div id="right">
    <h4 class="jiraformheader">
        <div class="toolbar subText"><a href="#" id="selectedOptionsAddAll">add all</a></div>
        <webwork:text name="'admin.issuesettings.available.issue.types'">
            <webwork:param name="'value0'"><webwork:property value="title" /></webwork:param>
        </webwork:text>
    </h4>
    <ul id="availableOptions" class="imagebacked">
        <webwork:iterator value="/availableOptions" status="'status'">
            <li id="availableOptions_<webwork:property value="./id" />" style="background-image:url('<webwork:url value="./imagePath" />')">
                <webwork:property value="./name" /> <webwork:if test="./subTask == true"><span class="smallgrey">(sub-task)</span></webwork:if><br />
            </li>
        </webwork:iterator>
    </ul>
</div>
</webwork:if>

</div>

<script type="text/javascript">
<webwork:if test="/allowEditOptions == true">
    jira.app.editIssueTypeScheme.allowEditOptions = true;
</webwork:if>
</script>

</td></tr>
</page:applyDecorator>

<webwork:if test="/allowEditOptions == true">
    <script language="JavaScript">
        function openWindow()
        {
            var vWinUsers = window.open('<%= request.getContextPath() %>/secure/popups/IconPicker.jspa?fieldType=<webwork:property value="fieldId" />&formName=addConstantForm','IconPicker', 'status=no,resizable=yes,top=100,left=200,width=580,height=650,scrollbars=yes');
            vWinUsers.opener = self;
            vWinUsers.focus();
        }
    </script>
    <p />
    <page:applyDecorator name="jiraform">
        <page:param name="formName">addConstantForm</page:param>
        <page:param name="action">ConfigureOptionSchemes!addConstant.jspa</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="submitId">submitAdd</page:param>
        <page:param name="title"><webwork:text name="'admin.issuesettings.add.new'">
            <webwork:param name="'value0'"><webwork:property value="titleSingle" /></webwork:param>
        </webwork:text></page:param>
        <page:param name="instructions"><webwork:text name="'admin.issuesettings.quickly.add'">
            <webwork:param name="'value0'"><webwork:property value="titleSingle" /></webwork:param>
        </webwork:text></page:param>
        <page:param name="submitClassName">constant</page:param>
        <page:param name="submitAccessKey">A</page:param>

        <ui:textfield label="text('common.words.name')" name="'constantName'" >
            <ui:param name="'mandatory'">true</ui:param>
            <ui:param name="'class'">standardField</ui:param>
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'constantDescription'">
            <ui:param name="'class'">standardField</ui:param>
        </ui:textfield>

        <%@ include file="/secure/admin/views/issuetypes/typeicon.jsp"%>

    </page:applyDecorator>
</webwork:if>

</body>
</html>
</webwork:property>
