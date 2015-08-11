
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<html>
<head>
	<title><webwork:text name="'admin.subtasks.delete.issuetype'">
	    <webwork:param name="'value0'"><webwork:property value="constant/string('name')" /></webwork:param>
	</webwork:text></title>
</head>
<body>

<page:applyDecorator name="jiraform">
	<page:param name="title"><webwork:text name="'admin.subtasks.delete.issuetype'">
	    <webwork:param name="'value0'"><webwork:property value="constant/string('name')" /></webwork:param>
	</webwork:text></page:param>
	<page:param name="autoSelectFirst">false</page:param>
	<page:param name="description">
        <webwork:property value="matchingIssues">
            <webwork:if test="./empty == true">
                <p><webwork:text name="'admin.subtasks.delete.issuetype.confirmation'"/></p>
		        <p><webwork:text name="'admin.subtasks.delete.no.matching.issues'"/></p>
            </webwork:if>
            <webwork:elseIf test="./empty == false && ../availableIssueTypes/empty == true">
		        <p><webwork:text name="'admin.subtasks.delete.note'">
		            <webwork:param name="'value0'"><span class="warning"></webwork:param>
		            <webwork:param name="'value1'"></span></webwork:param>
		            <webwork:param name="'value2'"><b><webwork:property value="./size" /></b></webwork:param>
		        </webwork:text></p>
            </webwork:elseIf>
            <webwork:else>
                <p><webwork:text name="'admin.subtasks.delete.issuetype.confirm.and.specify'"/></p>
                <p><webwork:text name="'admin.subtasks.delete.currently.x.matching.issues'">
                    <webwork:param name="'value0'"><b><webwork:property value="./size" /></b></webwork:param>
                </webwork:text></p>
            </webwork:else>
        </webwork:property>
	</page:param>

	<page:param name="action">DeleteSubTaskIssueType.jspa</page:param>
    <page:param name="width">100%</page:param>
    <webwork:if test="availableIssueTypes/empty == false || matchingIssues/empty == true">
	    <page:param name="submitId">delete_submit</page:param>
	    <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    </webwork:if>
	<page:param name="cancelURI">ManageSubTasks.jspa</page:param>

    <webwork:if test="matchingIssues/empty == false && availableIssueTypes/empty == false">
        <ui:select name="'newId'" label="'New type for matching issues'" list="availableIssueTypes"
            listKey="'string('id')'" listValue="'string('name')'" />
    </webwork:if>
	<ui:component name="'id'" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'"  />

</page:applyDecorator>

</body>
</html>
