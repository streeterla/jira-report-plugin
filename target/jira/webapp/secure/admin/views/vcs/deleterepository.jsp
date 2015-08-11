<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.cvsmodules.delete.version.control.module'"/></title>
</head>

<body>

    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteRepository.jspa</page:param>
		<page:param name="autoSelectFirst">false</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
    	<page:param name="cancelURI">ViewRepositories.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.cvsmodules.delete.version.control.module'"/></page:param>
        <page:param name="width">100%</page:param>
	    <page:param name="description">
        <input type="hidden" name="id" value="<webwork:property value="id" />">
        <input type="hidden" name="confirmed" value="true">

        <webwork:text name="'admin.cvsmodules.delete.confirmation'">
            <webwork:param name="'value0'"><b><webwork:property value="name" /></b></webwork:param>
        </webwork:text>
        </page:param>
    </page:applyDecorator>

</body>
</html>
