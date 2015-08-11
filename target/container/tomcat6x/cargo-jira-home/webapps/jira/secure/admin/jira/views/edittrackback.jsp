<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.globalsettings.trackbacks.jira.trackbacks'"/></title>
</head>

<body>
       <page:applyDecorator name="jiraform">
        <page:param name="helpURL">trackback</page:param>
        <page:param name="action">TrackbackAdmin.jspa</page:param>
        <page:param name="submitId">update_trackback</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.globalsettings.trackbacks.trackback.settings'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="cancelURI">TrackbackAdmin!initial.jspa</page:param>
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
          </webwork:text></li>
          <li>
          <webwork:text name="'admin.globalsettings.trackbacks.description.outgoing'">
              <webwork:param name="'value0'"><b></webwork:param>
              <webwork:param name="'value1'"></b></webwork:param>
              <webwork:param name="'value2'"><em></webwork:param>
              <webwork:param name="'value3'"></em></webwork:param>
              <webwork:param name="'value4'"><em></webwork:param>
              <webwork:param name="'value5'"></em></webwork:param>
          </webwork:text>
          </li>
          <li><webwork:text name="'admin.globalsettings.trackbacks.description.url.patterns.to.exclude'">
              <webwork:param name="'value0'"><b></webwork:param>
              <webwork:param name="'value1'"></b></webwork:param>
          </webwork:text>
                <ul>
                    <li><webwork:text name="'admin.globalsettings.trackbacks.perl.instructions'"/></li>
                    <li><webwork:text name="'admin.globalsettings.trackbacks.base.url.is.excluded'">
                        <webwork:param name="'value0'"><i><webwork:property value="applicationProperties/string('jira.baseurl')" />.*</i></webwork:param>
                    </webwork:text></li>
                    <li><webwork:text name="'admin.globalsettings.trackbacks.one.expression.per.line'"/></li>
                    <li><webwork:text name="'admin.globalsettings.example'"/>:<br>
                    .*server.domain.com.*<br>
                    .*server2.domain.com.*<br>
                    .*domain2.com.*
                    </li>
                    <li><webwork:text name="'admin.globalsettings.trackbacks.for.more.information'">
                        <webwork:param name="'value0'"><a href="http://perldoc.perl.org/perlre.html" TARGET="_blank"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text>
                    </li>
                </ul>
          </li>

          <!--<li><strong>Allowed URL Patterns:</strong> A list of Perl style regular expressions that URLs will have to match before an outgoing trackback ping is sent. If this field is left blank then all URLs will be sent trackback pings.-->

      </ul>

      <p><webwork:text name="'admin.common.phrases.more.information'"/></p>

    </page:param>


    <ui:component label="text('admin.globalsettings.trackbacks.incoming.trackbacks')" template="sectionbreak.jsp">
        <ui:param name="'nobreak'">true</ui:param>
    </ui:component>


    <tr>
		<td align="right" valign="top" bgcolor="#fffff0" nowrap><span class="label">
            <webwork:text name="'admin.globalsettings.trackbacks.accept.incoming.trackback.pings'"/>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="acceptPings" id="acceptPingsTrue" <webwork:if test="acceptPings == true">checked</webwork:if> /> <label for="acceptPingsTrue"><webwork:text name="'admin.common.words.on'"/></label>
			&nbsp;
			<input type="radio" value="false" name="acceptPings" id="acceptPingsFalse" <webwork:if test="acceptPings == false">checked</webwork:if> /> <label for="acceptPingsFalse"><webwork:text name="'admin.common.words.off'"/></label>
            <span class="fieldDescription">
                <webwork:text name="'admin.globalsettings.trackbacks.description2.incoming'"/>
            </span>
		</td>
	</tr>

    <ui:component label="text('admin.globalsettings.trackbacks.outgoing.trackbacks')" template="sectionbreak.jsp" />

    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
            <webwork:text name="'admin.globalsettings.trackbacks.send.outgoing.trackback.pings'"/>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="allIssues" name="sendPings" id="sendPingsTrue" <webwork:if test="sendPings == 'allIssues'">checked="checked"</webwork:if> /> <label for="sendPingsTrue"><webwork:text name="'admin.globalsettings.trackbacks.on.for.all'"/></label>
			&nbsp;
			<input type="radio" value="public" name="sendPings" id="sendPingsPublic" <webwork:if test="sendPings == 'public'">checked="checked"</webwork:if> /> <label for="sendPingsPublic"><webwork:text name="'admin.globalsettings.trackbacks.on.for.public'"/></label>
			&nbsp;
			<input type="radio" value="false" name="sendPings" id="sendPingsFalse" <webwork:if test="sendPings == 'false'">checked="checked"</webwork:if> /> <label for="sendPingsFalse"><webwork:text name="'admin.common.words.off'"/></label>
			<span class="fieldDescription">
                <webwork:text name="'admin.globalsettings.trackbacks.description2.outgoing'"/>
            </span>
		</td>
	</tr>
    <ui:textarea label="text('admin.globalsettings.trackbacks.url.patterns.to.exclude2')" name="'urlExcludePattern'" rows="6" >
        <ui:param name="'description'">
        <webwork:text name="'admin.globalsettings.trackbacks.description2.url.patterns'"/>
        </ui:param>
    </ui:textarea>
    <%--<ui:textarea label="'Allowed URL Patterns'" name="'urlAllowedPattern'" rows="6" >--%>
        <%--<ui:param name="'description'">--%>
        <!--List of Perl regular expressions (one per line), of URL patternss you can send trackbacks to.-->
        <%--</ui:param>--%>
    <%--</ui:textarea>--%>

    </page:applyDecorator>

</body>
</html>
