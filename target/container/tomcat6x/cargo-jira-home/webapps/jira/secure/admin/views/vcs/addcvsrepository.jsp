<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.cvsmodules.add.cvs.module'"/></title>

</head>
<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddRepository.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"> <webwork:text name="'common.forms.add'"/> </page:param>
    	<page:param name="cancelURI">ViewRepositories.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.cvsmodules.add.cvs.module'"/></page:param>
        <page:param name="helpURL">cvs_integration</page:param>
        <page:param name="description">
            <webwork:text name="'admin.cvsmodules.add.cvs.module.page.description'"/>
            <p><webwork:text name="'admin.cvsmodules.add.instructions'"/></p>
            <p><webwork:text name="'admin.cvsmodules.add.note'">
                <webwork:param name="'value0'"><span class="note"></webwork:param>
                <webwork:param name="'value1'"></span></webwork:param>
            </webwork:text></p>
         </page:param>
        <page:param name="width">100%</page:param>

        <%@ include file="/includes/admin/vcs/cvsfields.jsp" %>

    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
