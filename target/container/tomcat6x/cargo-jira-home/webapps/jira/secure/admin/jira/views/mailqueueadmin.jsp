<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.mailqueue.mail.queue.admin'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.mailqueue.mail.queue'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
		<webwork:if test="/page == 'errorqueue'">
			<webwork:text name="'admin.mailqueue.description'"/>
		</webwork:if>
		<webwork:else>
            <webwork:text name="'admin.mailqueue.this.page.shows'"/>
		</webwork:else>
        <webwork:if test="/mailSendingDisabled == true">
            <p><webwork:text name="'admin.mailqueue.sending.mail.is.disabled'">
                    <webwork:param name="'value0'"><span class="warning"></webwork:param>
                    <webwork:param name="'value1'"></span></webwork:param>
                </webwork:text></p>
        </webwork:if>
        <webwork:if test="/hasMailServer == false">
            <p><span class="warning"><webwork:text name="'admin.common.words.warning'"/></span>:
                <webwork:if test="/systemAdministrator == true" >
                    <webwork:text name="'admin.mailqueue.no.default.mail.server'">
                        <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/admin/ViewMailServers.jspa"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.mailqueue.no.default.mail.server.admin'">
                        <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/Administrators.jspa#sysadmins"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text>
                </webwork:else>
            </p>
        </webwork:if>
        <webwork:if test="/enabledNotificationSchemes == false">
            <p><webwork:text name="'admin.mailqueue.no.associated.notification.schemes'">
                    <webwork:param name="'value0'"><span class="warning"></webwork:param>
                	<webwork:param name="'value1'"></span></webwork:param>
            </webwork:text>
            </p>
        </webwork:if>
    
    </page:param>
	<webwork:if test="/page == 'errorqueue'">
		<p>
			<webwork:text name="'admin.mailqueue.number.of.items'">
			    <webwork:param name="'value0'"><b><webwork:property value="mailQueue/errorSize" /></b></webwork:param>
			</webwork:text>
		</p>
		<p>
        <ul class="square">
            <li><webwork:text name="'admin.mailqueue.resend.error.queue'">
			    <webwork:param name="'value0'"><a href="<webwork:url page="MailQueueAdmin.jspa"><webwork:param name="'resend'" value="'true'"/><webwork:param name="'page'" value="page"/></webwork:url>"></webwork:param>
			    <webwork:param name="'value1'"></a></webwork:param>
			</webwork:text></li>
            <li><webwork:text name="'admin.mailqueue.delete.error.queue'">
			    <webwork:param name="'value0'"><a href="<webwork:url page="MailQueueAdmin.jspa"><webwork:param name="'delete'" value="'true'"/><webwork:param name="'page'" value="page"/></webwork:url>"></webwork:param>
			    <webwork:param name="'value1'"></a></webwork:param>
			</webwork:text></li>
        </ul>
		</p>
    </webwork:if>
    <webwork:else>
		<p>
			<webwork:text name="'admin.mailqueue.number.of.items'">
			    <webwork:param name="'value0'"><b><webwork:property value="mailQueue/size" /></b></webwork:param>
			</webwork:text>
		</p>
        <webwork:if test="mailQueue/sending == true">
        <p><webwork:text name="'admin.mailqueue.currently.sending'">
            <webwork:param name="'value0'"><font color="green"><b></webwork:param>
            <webwork:param name="'value1'"></b></font></webwork:param>
        </webwork:text></p>
        <ul class="square">
            <li><webwork:text name="'admin.mailqueue.bypass.currently.sending.mail'">
                <webwork:param name="'value0'"><a href="<webwork:url page="MailQueueAdmin.jspa"><webwork:param name="'unstick'" value="'true'"/></webwork:url>"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text></li>
        </ul>
        </webwork:if>
        <ul class="square">
            <li><webwork:text name="'admin.mailqueue.flush.mail.queue'">
                <webwork:param name="'value0'"><a href="<webwork:url page="MailQueueAdmin.jspa"><webwork:param name="'flush'" value="'true'"/></webwork:url>"><b></webwork:param>
                <webwork:param name="'value1'"></b></a></webwork:param>
            </webwork:text></li>
        </ul>
    </webwork:else>
</page:applyDecorator>

<p>

<table cellpadding="2" cellspacing="0" border="0" width="100%" align="center">
<tr>
	<webwork:if test="/page == 'errorqueue'">
		<td width="1%" nowrap align="center">
			&nbsp;<b><a href="<webwork:url page="MailQueueAdmin.jspa"/>"><webwork:text name="'admin.mailqueue.mail.queue.size'">
			    <webwork:param name="'value0'"><webwork:property value="mailQueue/size" /></webwork:param>
			</webwork:text></a></b>&nbsp;
		</td>
	</webwork:if>
	<webwork:else>
		<td bgcolor="#bbbbbb" width="1%" nowrap align="center">
			&nbsp;<font color="#ffffff"><b><webwork:text name="'admin.mailqueue.mail.queue.size'">
			    <webwork:param name="'value0'"><webwork:property value="mailQueue/size" /></webwork:param>
			</webwork:text></b></font>&nbsp;
		</td>
	</webwork:else>

	<webwork:if test="/page == 'errorqueue'">
		<td bgcolor="#bbbbbb" width="1%" nowrap align="center">
			&nbsp;<font color="#ffffff"><b><webwork:text name="'admin.mailqueue.error.queue.size'">
			    <webwork:param name="'value0'"><webwork:property value="mailQueue/errorSize" /></webwork:param>
			</webwork:text></b></font>&nbsp;
		</td>
	</webwork:if>
	<webwork:else>
		<td width="1%" nowrap align="center">
			&nbsp;<b><a href="<webwork:url page="MailQueueAdmin.jspa"><webwork:param name="'page'" value="'errorqueue'"/></webwork:url>"><webwork:text name="'admin.mailqueue.error.queue.size'">
			    <webwork:param name="'value0'"><webwork:property value="mailQueue/errorSize" /></webwork:param>
			</webwork:text></a></b>&nbsp;
		</td>
	</webwork:else>

	<td>&nbsp;</td>
</tr>
</table>

<table cellpadding="0" cellspacing="1" border="0" width="100%" bgcolor="#bbbbbb" align="center"><tr><td>
<table cellpadding="2" cellspacing="0" border="0" width="100%">
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink" width="80%">
                <b><webwork:text name="'admin.mailqueue.subject'"/></b>
            </td>
            <td class="colHeaderLink" width="20%">
                <b><webwork:text name="'admin.mailqueue.queued'"/></b>
            </td>
        </tr>

        <webwork:if test="mailQueue/sending == true">
            <tr bgcolor="#<webwork:if test="hasError == true">ffcccc</webwork:if><webwork:elseIf test="/mailSendingDisabled == true">ffdddd</webwork:elseIf><webwork:else>fffff0</webwork:else>">
                <td>
                    <img src="<%= request.getContextPath() %>/images/icons/mail_small.gif" border="0" alt="<webwork:text name="'admin.mailqueue.sending'"/>" title="<webwork:text name="'admin.mailqueue.sending'"/>">
                    <webwork:property value="/mailQueue/itemBeingSent/subject"/>
                </td>
                <td valign="top">
                    <webwork:property value="/prettySendingStartTime"/>
                </td>
            </tr>
        </webwork:if>
        <webwork:iterator value="queuedItems" status="'status'">
            <tr bgcolor="#<webwork:if test="hasError == true">ffcccc</webwork:if><webwork:elseIf test="/mailSendingDisabled == true">ffdddd</webwork:elseIf><webwork:elseIf test="@status/modulus(2) == 1">ffffff</webwork:elseIf><webwork:else>fffff0</webwork:else>">
                <td valign="top">
                    <webwork:property value="subject" />
                </td>
                <td valign="top">
                    <webwork:property value="/outlookDate/formatDMYHMS(dateQueued)" />
                </td>
            </tr>
        </webwork:iterator>
        <webwork:if test="queuedItems/size == 0 && mailQueue/sending == false">
            <tr bgcolor="#ffffff"><td colspan="2">
                <webwork:text name="'admin.mailqueue.no.queued.mail.items'"/>
            </td></tr>
        </webwork:if>

    </table>
</td></tr></table>
</body>
</html>
