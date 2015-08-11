<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<!-- Only Global Admins or Project Admins of all projects associated with selected issues can disable bulk operation mail notifications -->

<webwork:if test="/canDisableMailNotifications() == true && /bulkEditBean/hasMailServer == true">
<p>
    <table class="grid formLabel nowrap">
        <tr>
            <td class="formLabel minWidth">
                <input type="checkbox" id="sendBulkNotificationCB" name="sendBulkNotification" value="true" checked></input>
            </td>
            <td class="formLabel">
                <label for="sendBulkNotificationCB">
                    <webwork:text name="'bulk.operation.send.mail'"/>
                    <br>
                    <span class="smallgrey"><webwork:text name="'bulk.operation.send.mail.desc'"/></span>
                </label>
            </td>
        </tr>
    </table>
</p>
</webwork:if>




