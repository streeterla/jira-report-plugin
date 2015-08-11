<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.issuecaching.issue.caching'"/></title>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'admin.issuecaching.configure.caching'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description"><webwork:text name="'admin.issuecaching.select.the.maximum.capacity'"/></page:param>
        <page:param name="action">SetCacheCapacity.jspa</page:param>
        <page:param name="submitId">update_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
        <page:param name="cancelURI">ViewCacheConfig.jspa</page:param>
        <ui:textfield label="text('admin.issuecaching.max.cache.capacity')" name="'capacity'" />
    </page:applyDecorator>
</body>
</html>
