<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.cvsmodules.update.cvs.module'"/></title>
</head>
<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">UpdateRepository.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"> <webwork:text name="'common.forms.update'"/> </page:param>
    	<page:param name="cancelURI">ViewRepositories.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.cvsmodules.update.cvs.module'"/></page:param>
        <page:param name="helpURL">cvs_integration</page:param>
        <page:param name="description">
            <webwork:text name="'admin.cvsmodules.update.page.description'"/>
            <p><webwork:text name="'admin.cvsmodules.update.note'">
                <webwork:param name="'value0'"><font color="#bb0000"><b></webwork:param>
                <webwork:param name="'value1'"></b></font></webwork:param>
            </webwork:text></p>
        </page:param>
        <page:param name="width">100%</page:param>

        <%@ include file="/includes/admin/vcs/cvsfields.jsp" %>

        <ui:component name="'id'" template="hidden.jsp"/>
        <ui:component name="'type'" template="hidden.jsp"/>

    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
