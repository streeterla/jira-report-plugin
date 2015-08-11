<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.issuesettings.statuses.delete.title'"/></title>
</head>
<body>
    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteStatus.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="cancelURI">ViewStatuses.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.issuesettings.statuses.delete.status'">
            <webwork:param name="'value0'"><webwork:property value="constant/string('name')" /></webwork:param>
        </webwork:text></page:param>
        <page:param name="description"><webwork:text name="'admin.issuesettings.statuses.delete.confirmation'"/></page:param>

        <ui:component name="'id'" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'"  />

    </page:applyDecorator>
    </p>
</body>
</html>
