<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuesettings.associate'"/></title>
</head>

<body>
    <webwork:bean name="'org.apache.commons.lang.ClassUtils'" id="classUtils" />

<webwork:if test="/allProjects/empty == true">
    <page:applyDecorator name="jirapanel">
        <%--<page:param name="helpURL">configcustomfield</page:param>--%>
        <%--<page:param name="helpURLFragment">#Managing+multiple+configuration+schemes</page:param>--%>
		<page:param name="title"><webwork:text name="'admin.issuesettings.associate'"/></page:param>
		<page:param name="instructions">
            <webwork:text name="'admin.issuesettings.associate.no.projects.available'">
                <webwork:param name="'value0'"><webwork:property value="configScheme/name" /></webwork:param>
            </webwork:text>
        </page:param>
		<page:param name="width">100%</page:param>
    	<page:param name="cancelURI">ManageIssueTypeSchemes!default.jspa</page:param>
	</page:applyDecorator>
</webwork:if>
<webwork:else>
    <page:applyDecorator name="jiraform">
        <%--<page:param name="helpURL">configcustomfield</page:param>--%>
        <%--<page:param name="helpURLFragment">#Managing+multiple+configuration+schemes</page:param>--%>
		<page:param name="title"><webwork:text name="'admin.issuesettings.associate'"/></page:param>
		<page:param name="instructions">
            <p><webwork:text name="'admin.issuesettings.associate.instructions'">
                <webwork:param name="'value0'"><strong><webwork:property value="configScheme/name" /></strong></webwork:param>
            </webwork:text></p>
            <webwork:if test="/default == true">
                <div class="infoBox">
                    <webwork:text name="'admin.issuesettings.associate.only.unassociated.displayed'"/>
                </div>
            </webwork:if>
        </page:param>
		<page:param name="action"><webwork:property value="@classUtils/shortClassName(/class)" />.jspa</page:param>
		<page:param name="width">100%</page:param>
    	<page:param name="cancelURI">ManageIssueTypeSchemes!default.jspa</page:param>
		<page:param name="submitId">associate_submit</page:param>
		<page:param name="submitName"><webwork:text name="'admin.projects.schemes.associate'"/></page:param>

        <ui:component template="multihidden.jsp" >
            <ui:param name="'fields'">schemeId,fieldId</ui:param>
        </ui:component>

        <ui:component label="text('admin.issuesettings.scheme.name')" value="configScheme/name" template="textlabel.jsp" />
        <webwork:if test="configScheme/description && configScheme/description != ''">
            <ui:component label="text('common.words.description')" value="configScheme/description" template="textlabel.jsp" />
        </webwork:if>

        <ui:select label="text('common.concepts.projects')" name="'projects'" template="selectmultiple.jsp"
                   list="/allProjects" listKey="'id'" listValue="'name'" >
           <ui:param name="'size'">5</ui:param>
           <ui:param name="'optionTitle'">description</ui:param>
           <ui:param name="'description'"><webwork:text name="'admin.issuesettings.associate.apply.for.all'"/></ui:param>
        </ui:select>

	</page:applyDecorator>
</webwork:else>

</body>
</html>
