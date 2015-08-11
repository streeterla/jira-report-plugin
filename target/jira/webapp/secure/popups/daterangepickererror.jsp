<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'popups.daterange.title'"/></title>
</head>
<body>
<h3><webwork:text name="'popups.daterange.title'"/></h3>
<page:applyDecorator name="jiraform">
    <page:param name="action">null</page:param>
    <page:param name="onsubmit">return false;</page:param>
    <page:param name="title">
        <webwork:text name="'popups.daterange.error'"/>
    </page:param>
    <page:param name="width">100%</page:param>
    <page:param name="autoSelectFirst">false</page:param>
    <page:param name="buttons">
        <input type="button" value="<webwork:text name="'admin.common.words.close'"/>" onclick="window.close();">
    </page:param>
</page:applyDecorator>
</body>
</html>
