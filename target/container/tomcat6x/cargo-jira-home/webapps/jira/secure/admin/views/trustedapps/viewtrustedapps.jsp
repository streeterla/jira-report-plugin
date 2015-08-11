<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.trustedapps.view.trusted.applications'"/></title>
</head>
<body>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.trustedapps.view.trusted.applications'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">trustedapps.list</page:param>
        <p>
             <webwork:text name="'admin.trustedapps.view.trusted.applications.description'"/>
        </p>
    </page:applyDecorator>

    <p/>
        <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="60%">
            <tr>
                <td>
                    <table border="0" cellpadding="3" cellspacing="1" width=100%>
                        <tr class="rowHeader">
                            <td class="colHeaderLink">
                                <b><webwork:text name="'common.words.name'"/></b>
                            </td>
                            <td class="colHeaderLink">
                                <b><webwork:text name="'common.words.operations'"/></b>
                            </td>
                        </tr>

                        <webwork:iterator value="/trustedApplications" status="'status'">
                            <tr class="<webwork:if test="@status/modulus(2) == 1">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else>">
                                <td valign="top">
                                    <b><webwork:property value="./name"/></b>
                                    <webwork:if test="./validKey == false">
                                        <br>
                                        <img src="<webwork:url page="/images/icons/emoticons/error.png"/>" alt="<webwork:property value="./publicKey" />"/>
                                        <font size="-2"><webwork:property value="./publicKey" /></font>
                                    </webwork:if>
                                </td>
                                <td width="1%" valign="top" nowrap="true">
                                    <webwork:if test="./validKey == true"><%-- only show if the key is valid --%>
                                        <a id="edit-<webwork:property value="./numericId"/>" href="<webwork:url page="/secure/admin/trustedapps/EditTrustedApplication!default.jspa"><webwork:param name="'id'" value="./numericId"/></webwork:url>" title="<webwork:text name="'admin.trustedapps.edit.trusted.app'">
                                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                                        </webwork:text>"><webwork:text name="'common.words.edit'"/></a>
                                    |</webwork:if>
                                     <a id="delete-<webwork:property value="./numericId"/>" href="<webwork:url page="/secure/admin/trustedapps/DeleteTrustedApplication!default.jspa"><webwork:param name="'id'" value="./numericId"/></webwork:url>" title="<webwork:text name="'admin.trustedapps.delete.trusted.app'">
                                        <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                                    </webwork:text>"><webwork:text name="'common.words.delete'"/></a>
                                </td>
                            </tr>
                        </webwork:iterator>
                        <webwork:if test="trustedApplications/size == 0">
                        <tr class="rowNormal">
                            <td colspan="2"><webwork:text name="'admin.trustedapps.no.apps.configured'"/></td>
                        </tr>
                        </webwork:if>
                    </table>
                </td>
            </tr>
        </table>
    <p/>

    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">ViewTrustedApplications!request.jspa</page:param>
        <page:param name="submitId">request_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.send.request'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.trustedapps.request.new.trusted.app'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.trustedapps.request.new.app.instructions'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
            </webwork:text>
        </page:param>

        <ui:textfield label="text('admin.trustedapps.words.base.url')" name="'trustedAppBaseUrl'" size="'60'">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>
    </page:applyDecorator>
    </p>
</body>
</html>
