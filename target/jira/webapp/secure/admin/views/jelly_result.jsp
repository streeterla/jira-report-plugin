<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.jellyrunner.import.workflow.from.xml'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
	<page:param name="title"><webwork:text name="'admin.jellyrunner.import.workflow.from.xml'"/></page:param>
	<page:param name="description">
        <webwork:if test="result">
            <p><webwork:text name="'admin.jellyrunner.output'"/></p>
            <webwork:property value="result" escape="false"/>
        </webwork:if>
        <webwork:else>
            <p><webwork:text name="'admin.jellyrunner.success'"/></p>
        </webwork:else>
    </page:param>
</page:applyDecorator>
</body>
</html>
