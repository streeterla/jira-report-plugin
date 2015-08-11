<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- Only Global Admins or Project Admins of all projects associated with selected issues can disable bulk operation mail notifications -->
<div class="noteBox nowrap">
    <webwork:if test="sendBulkNotification() == true">
        <webwork:text name="'bulk.operation.send.mail.confirm.yes'" />
    </webwork:if>
    <webwork:else>
        <webwork:text name="'bulk.operation.send.mail.confirm.no'">
            <webwork:param name="value0"><b></webwork:param>
            <webwork:param name="value01"></b></webwork:param>
        </webwork:text>
    </webwork:else>
</div>
