<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:property value="/manageableOption" >
<html>
<head>
	<title><webwork:text name="'admin.issuesettings.confirmdeletescheme.title'">
	    <webwork:param name="'value0'"><webwork:property value="titleSingle" /></webwork:param>
	    <webwork:param name="'value1'"><webwork:property value="/configScheme/name" /></webwork:param>
	</webwork:text></title>

</head>
<body>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.issuesettings.confirmdeletescheme.title'">
	    <webwork:param name="'value0'"><webwork:property value="titleSingle" /></webwork:param>
	    <webwork:param name="'value1'"><webwork:property value="/configScheme/name" /></webwork:param>
	</webwork:text></page:param>
    <page:param name="submitId">delete_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    <page:param name="cancelURI">ManageIssueTypeSchemes!default.jspa</page:param>
    <page:param name="action">DeleteOptionScheme.jspa</page:param>

    <ui:component name="'schemeId'" template="hidden.jsp" theme="'single'" />

    <tr><td colspan="2">
        <webwork:text name="'admin.issuesettings.confirmdeletescheme.about.to.delete'">
            <webwork:param name="'value0'"><webwork:property value="titleSingle" /></webwork:param>
            <webwork:param name="'value1'"><strong><webwork:property value="/configScheme/name" /></strong></webwork:param>
        </webwork:text>
        <webwork:property value="/configScheme/associatedProjects">
            <webwork:if test=".">
                <webwork:if test="./size() == 1">
                    <webwork:text name="'admin.issuesettings.confirmdeletescheme.one.project'">
                        <webwork:param name="'value0'"><webwork:property value="./iterator()/next()/string('name')" /></webwork:param>
                    </webwork:text>
                </webwork:if>
                <webwork:else>
                    <webwork:if test="./size() == 0">
                        <webwork:text name="'admin.issuesettings.confirmdeletescheme.no.projects'"/>
                    </webwork:if>
                    <webwork:else>
                        <webwork:text name="'admin.issuesettings.confirmdeletescheme.multiple.projects'">
                            <webwork:param name="'value0'"><webwork:property value="./size()" /></webwork:param>
                            <webwork:param name="'value1'">
                                <webwork:iterator value="." status="'status'">
                                    <webwork:if test="@status/first == true">(</webwork:if><strong><webwork:property value="./string('name')" /></strong><webwork:if test="@status/last == true">)</webwork:if><webwork:else>, </webwork:else>
                                </webwork:iterator>
                            </webwork:param>
                        </webwork:text>
                    </webwork:else>
                </webwork:else>
            </webwork:if>
        </webwork:property>
    </td></tr>
</page:applyDecorator>

</body>
</html>
</webwork:property>
