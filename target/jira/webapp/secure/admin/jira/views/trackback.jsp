<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.globalsettings.trackbacks.jira.trackbacks'"/></title>
</head>

<body>
    <page:applyDecorator name="jiratable">
        <page:param name="title"><webwork:text name="'admin.globalsettings.trackbacks.trackback.settings'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="titleColspan">2</page:param>
        <page:param name="helpURL">trackback</page:param>
        <page:param name="description">
          <webwork:text name="'admin.globalsettings.trackbacks.description'">
              <webwork:param name="'value0'"><em></webwork:param>
              <webwork:param name="'value1'"></em></webwork:param>
              <webwork:param name="'value2'"><a href="http://www.movabletype.org/docs/mttrackback.html"></webwork:param>
              <webwork:param name="'value3'"></a></webwork:param>
              <webwork:param name="'value4'"><br></webwork:param>
          </webwork:text>
          <ul>
          <li><webwork:text name="'admin.globalsettings.trackbacks.description.incoming'">
              <webwork:param name="'value0'"><b></webwork:param>
              <webwork:param name="'value1'"></b></webwork:param>
              <webwork:param name="'value2'"><a href="<webwork:component name="'external.link.confluence.product.site'" template="externallink.jsp" />"></webwork:param>
              <webwork:param name="'value3'"></a></webwork:param>
          </webwork:text></p></li>
          <li><webwork:text name="'admin.globalsettings.trackbacks.description.outgoing'">
              <webwork:param name="'value0'"><b></webwork:param>
              <webwork:param name="'value1'"></b></webwork:param>
          </webwork:text></p></li>
          <li><webwork:text name="'admin.globalsettings.trackbacks.description.url.patterns.to.exclude'">
              <webwork:param name="'value0'"><b></webwork:param>
              <webwork:param name="'value1'"></b></webwork:param>
          </webwork:text></li>
          </ul>
          <webwork:text name="'admin.common.phrases.more.information'"/>

        </page:param>

        <tr>
            <td valign="top" bgcolor="#ffffff" width=40% align=left>
            &nbsp; <b><webwork:text name="'admin.globalsettings.trackbacks.accept.incoming.trackback.pings'"/></b>
            <td bgcolor="#ffffff" width=60%>
                <webwork:if test="acceptPings == true">
                    <font color="#009900"><b><webwork:text name="'admin.common.words.on'"/></b></font>
			    </webwork:if>
			    <webwork:else>
				    <font color="#990000"><b><webwork:text name="'admin.common.words.off'"/></b></font>
                </webwork:else>
            </td>
        </tr>
        <tr>
            <td valign="top" bgcolor="#fffff0" width=40% align=left>
            &nbsp; <b><webwork:text name="'admin.globalsettings.trackbacks.send.outgoing.trackback.pings'"/></b>
            </td>
            <td  bgcolor="#fffff0" width=60%>
                <webwork:if test="sendPings == 'allIssues'">
                    <font color="#009900"><b><webwork:text name="'admin.common.words.on'"/></b> (<webwork:text name="'admin.globalsettings.trackbacks.for.all.issues'"/>)</font>
			    </webwork:if>
                <webwork:elseIf test="sendPings == 'public'">
                    <font color="#009900"><b><webwork:text name="'admin.common.words.on'"/></b> (<webwork:text name="'admin.globalsettings.trackbacks.for.public.issues.only'"/>)</font>
			    </webwork:elseIf>
			    <webwork:else>
				    <font color="#990000"><b><webwork:text name="'admin.common.words.off'"/></b></font>
                </webwork:else>
            </td>
        </tr>
        <tr>
            <td valign="top" bgcolor="#ffffff" width=40% align=left>
            &nbsp; <b><webwork:text name="'admin.globalsettings.trackbacks.url.patterns.to.exclude'"/></b>
            </td>
            <td  bgcolor="#ffffff" width=60%>
                <webwork:property value="/urlExcludePattern" />
            </td>
        </tr>

        <!--<tr>-->
            <!--<td valign="top" bgcolor="#fffff0" width=40% align=left>-->
            <!--&nbsp; <strong>Allowed URL Patterns</strong>-->
            <!--</td>-->
            <!--<td  bgcolor="#fffff0" width=60%>-->
                <%--<webwork:property value="/urlAllowedPattern" />--%>
            <!--</td>-->
        <!--</tr>-->

    </page:applyDecorator>

    <p>
    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=100%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width=100%>
    	<tr bgcolor=#f0f0f0>
    		<td class="colHeaderLink" colspan=2 align=center>
    			<a href="TrackbackAdmin!default.jspa"><b><webwork:text name="'admin.common.phrases.edit.configuration'"/></b></a>
    		</td>
    	</tr>
    </table>
    </td></tr></table>
    </p>

</body>
</html>
