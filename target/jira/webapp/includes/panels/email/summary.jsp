<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>

<table cellpadding=3 cellspacing=0 border=0 width=200>
<tr><td class="lhc-h">
    <b><webwork:text name="'viewissue.subheading.emaildetails'"/></b>
</td></tr>
</table>
<webwork:if test="email">
<webwork:property value="email">
<table cellpadding=3 cellspacing=0 border=0>
<tr>
	<td valign=top width=1% nowrap><b><webwork:text name="'viewissue.email.from'" /></b></td>
	<td valign=top width=100%>
        <webwork:if test="author != null">
            <jira:formatuser user="author/name" type="'profileLinkExternal'" id="'email'"/>
		</webwork:if>
		<webwork:else>
            <br>
			<webwork:property value="from" />
		</webwork:else>
	</td>
</tr>
<tr>
	<td valign=top><b><webwork:text name="'viewissue.email.date'" /></b></td>
	<td valign=top>
      <webwork:property value="/outlookDate/formatDMY(timestamp('created'))"/>
	</td>
</tr>

<webwork:if test="string('level') != null">
    <tr>
	    <td valign=top nowrap><b><webwork:text name="'viewissue.email.visibleby'"/></b></td>
	    <td valign=top>
		    <font color=#990000><webwork:property value="string('level')" /></font>
	    </td>
    </tr>
</webwork:if>

</table>
</webwork:property>
</webwork:if>
<webwork:else>
    <p>Could not retrieve email.</p>
</webwork:else>
