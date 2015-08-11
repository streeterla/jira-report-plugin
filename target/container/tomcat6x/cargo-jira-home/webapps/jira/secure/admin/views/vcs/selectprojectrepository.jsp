
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.cvsmodules.select.repository'"/></title>
</head>
<body>

<webwork:if test="repositories == null || repositories/size == 0">
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.cvsmodules.select.none.available'"/></page:param>
        <page:param name="width">100%</page:param>
        <p>
        <webwork:text name="'admin.cvsmodules.select.have.not.created.any.modules'"/>
        </p>
        <p>
        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0>
        <webwork:text name="'admin.cvsmodules.add.new.module'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/admin/projectcategories/AddRepository!default.jspa"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text>
        </p>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
		<page:param name="title"><webwork:text name="'admin.cvsmodules.select.repository'"/></page:param>
        <page:param name="description">
            <webwork:text name="'admin.cvsmodules.select.page.description'"/>
            <p><webwork:text name="'admin.cvsmodules.select.note'">
                <webwork:param name="'value0'"><b><font color="#990000"></webwork:param>
                <webwork:param name="'value1'"></font></b></webwork:param>
            </webwork:text></p>
        </page:param>
        <page:param name="width">100%</page:param>
        <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="projectId"/></webwork:url></page:param>
        <page:param name="action">SelectProjectRepository.jspa</page:param>
        <page:param name="submitId">select_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.select'"/></page:param>

        <ui:select label="text('admin.cvsmodules.repository')" name="'repositoryIds'" list="repositories" listKey="'id'" listValue="'name'" template="selectmap.jsp">
            <ui:param name="'headerrow'" value="'None'" />
            <ui:param name="'headervalue'" value="-1" />
        </ui:select>
        <ui:component name="'projectId'" template="hidden.jsp"/>
	</page:applyDecorator>
</webwork:else>

</body>
</html>
