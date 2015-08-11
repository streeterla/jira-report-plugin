<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.event.types.delete'"/></title>
</head>

<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">DeleteEventType.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
        <page:param name="cancelURI">ListEventTypes.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.event.types.delete'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <p>
                <webwork:text name="'admin.event.types.delete.confirmation'">
                    <webwork:param><b></webwork:param>
                    <webwork:param><webwork:property value="/eventTypeManager/eventType(eventTypeId)/translatedName(/remoteUser)"/></webwork:param>
                    <webwork:param></b></webwork:param>
                </webwork:text>
            </p>
        </page:param>

        <ui:component name="'eventTypeId'" template="hidden.jsp" theme="'single'"  />
        <ui:component name="'confirmed'" value="'true'" template="hidden.jsp" theme="'single'"  />

    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
