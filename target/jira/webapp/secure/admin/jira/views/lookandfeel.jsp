<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="webwork" prefix="ui" %>
<html>
<head>
	<title><ww:text name="'admin.globalsettings.lookandfeel.look.and.feel.configuration'"/></title>
</head>
<body>
<p/>
<table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=100%><tr><td>
<table id="lookAndFeelLogo" border="0" cellpadding="3" cellspacing="1" width=100%>

	<tr bgcolor=#f0f0f0>
		<td class="colHeaderLink" colspan=2>
        <% // @todo - fix up %>
            <ui:component name="'lookandfeel.logoandcolours'" template="help.jsp">
                <ui:param name="'helpURLFragment'" value = "'#logo'"/>
            </ui:component>
<%--			<a href="http://www.atlassian.com/software/jira/docs/latest/lookandfeel.html#logo" target="_jirahelp"><img src="<%= request.getContextPath() %>/images/icons/help_blue.gif" width=16 height=16 align=right border=0 alt="Get help!" title="Get online help about Look and Feel"></a>--%>
			<h3 class="formtitle"><ww:text name="'admin.globalsettings.lookandfeel.logo'"/></h3>
            <p class="wrapping"><ww:text name="'admin.globalsettings.lookandfeel.logo.desc'"/></p>
		</td>
	</tr>

	<%-- NOTE: Keep these property keys the same as APKeys - can't use statics in WW --%>
	<tr bgcolor="#ffffff">
		<td valign=top width=30%>&nbsp; <b><ww:text name="'common.concepts.url'"/></b></td>
		<td valign=top width=70%>
            <ww:if test="applicationProperties/string('jira.lf.logo.url') != null" >
                <ww:if test="applicationProperties/string('jira.lf.logo.url') != null && applicationProperties/string('jira.lf.logo.url')/startsWith('http://') == false &&  applicationProperties/string('jira.lf.logo.url')/startsWith('https://') == false" >
                   <%= request.getContextPath() %><ww:property value="applicationProperties/string('jira.lf.logo.url')"/>
                </ww:if>
                <ww:else>
                    <ww:property value="applicationProperties/string('jira.lf.logo.url')"/>
                </ww:else>
            </ww:if>
            <ww:else>&lt;default&gt;</ww:else></td>
	</tr>
    <tr bgcolor="#fffff0">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.preview'"/></b></td>
		<td valign=top>
            <ww:if test="applicationProperties/string('jira.lf.logo.url') != null" >
                <ww:if test="applicationProperties/string('jira.lf.logo.url') != null && applicationProperties/string('jira.lf.logo.url')/startsWith('http://') == false &&  applicationProperties/string('jira.lf.logo.url')/startsWith('https://') == false" >
                   <br><img src="<%= request.getContextPath() %><ww:property value="applicationProperties/string('jira.lf.logo.url')"/>" width="<ww:property value="applicationProperties/string('jira.lf.logo.width')"/>" height="<ww:property value="applicationProperties/string('jira.lf.logo.height')"/>" />
                </ww:if>
                <ww:else>
                    <br><img src="<ww:property value="applicationProperties/string('jira.lf.logo.url')"/>" width="<ww:property value="applicationProperties/string('jira.lf.logo.width')"/>" height="<ww:property value="applicationProperties/string('jira.lf.logo.height')"/>" align="center" valign="bottom"/>
                </ww:else>
            </ww:if>
            <ww:else>&lt;N/A&gt;</ww:else></td>
	</tr>
	<tr bgcolor="#ffffff">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.logo.width'"/></b></td>
		<td valign=top><ww:if test="applicationProperties/string('jira.lf.logo.width') != null"><ww:property value="applicationProperties/string('jira.lf.logo.width')"/></ww:if>
                                 <ww:else>&lt;default&gt;</ww:else></td>
	</tr>
	<tr bgcolor="#fffff0">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.logo.height'"/></b></td>
		<td valign=top><ww:if test="applicationProperties/string('jira.lf.logo.height') != null"><ww:property value="applicationProperties/string('jira.lf.logo.height')"/></ww:if>
                                 <ww:else>&lt;default&gt;</ww:else></td>
	</tr>
</table>
</td></tr></table>
<p/>
<table id="lookAndFeelColors" align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=100%><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width=100%>

    <tr bgcolor=#f0f0f0>
		<td class="colHeaderLink" colspan=2>
        <% // @todo - fix up %>
			<ui:component name="'lookandfeel.logoandcolours'" template="help.jsp">
                <ui:param name="'helpURLFragment'" value = "'#colours'"/>
            </ui:component>
			<h3 class="formtitle"><ww:text name="'admin.globalsettings.lookandfeel.colours'"/></h3>
            <p class="wrapping"><ww:text name="'admin.globalsettings.lookandfeel.colours.desc'"/></p>
		</td>
	</tr>
    <!-- =========== TOP =================== -->
	<tr bgcolor="#ffffff">
		<td valign=top width=30%>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.top.bar.colour'"/></b></td>
		<td valign=top width=70%><ww:property value="/color('jira.lf.top.bgcolour')" escape="false"/></td>
	</tr>
    <tr bgcolor="#fffff0">
        <td valign=top width=30%>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.top.bar.hilightcolour'"/></b></td>
        <td valign=top width=70%><ww:property value="/color('jira.lf.top.hilightcolour')" escape="false"/></td>
    </tr>
    <tr bgcolor="#ffffff">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.top.text.colour'"/></b></td>
		<td valign=top><ww:property value="/color('jira.lf.top.textcolour')" escape="false"/>
            <ww:if test="/showInvisibleWarningForTopText == true">
                &nbsp;&nbsp;<span class="warning"><ww:text name="'admin.globalsettings.lookandfeel.toptext.samecolour'"/></span>
            </ww:if></td>
	</tr>
    <tr bgcolor="#fffff0">
        <td valign=top width=30%>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.top.text.hilightcolour'"/></b></td>
        <td valign=top width=70%><ww:property value="/color('jira.lf.top.texthilightcolour')" escape="false"/></td>
    </tr>
    <tr bgcolor="#ffffff">
        <td valign=top width=30%>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.top.separatorcolor'"/></b></td>
        <td valign=top width=70%><ww:property value="/color('jira.lf.top.separator.bgcolor')" escape="false"/></td>
    </tr>
    <!-- =========== MENU BAR =================== -->
    <tr bgcolor="#fffff0">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.menu.bar.colour'"/></b></td>
		<td valign=top><ww:property value="/color('jira.lf.menu.bgcolour')" escape="false"/></td>
	</tr>
    <tr bgcolor="#ffffff">
        <td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.menu.bar.text.colour'"/></b></td>
        <td valign=top><ww:property value="/color('jira.lf.menu.textcolour')" escape="false"/></td>
	</tr>

    <tr bgcolor="#fffff0">
        <td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.menu.bar.separator.colour'"/></b></td>
        <td valign=top><ww:property value="/color('jira.lf.menu.separator')" escape="false"/></td>
	</tr>
    <!-- =========== TEXT / LINK / HEADING =================== -->
    <tr bgcolor="#ffffff">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.link.colour'"/></b></td>
		<td valign=top><ww:property value="/color('jira.lf.text.linkcolour')" escape="false"/></td>
	</tr>
    <tr bgcolor="#fffff0">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.link.active.colour'"/></b></td>
		<td valign=top><ww:property value="/color('jira.lf.text.activelinkcolour')" escape="false"/></td>
	</tr>
    <tr bgcolor="#ffffff">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.heading.colour'"/></b></td>
		<td valign=top><ww:property value="/color('jira.lf.text.headingcolour')" escape="false"/></td>
	</tr>
</table>
</td></tr></table>
<p/>
<table id="lookAndFeelGadgetChromeColours" align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">
    <tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<ui:component name="'lookandfeel.logoandcolours'" template="help.jsp">
                <ui:param name="'helpURLFragment'" value = "'#gadgetchromecolours'"/>
            </ui:component>
			<h3 class="formtitle"><ww:text name="'admin.globalsettings.lookandfeel.gadget.chrome.colors'"/></h3>
            <p class="wrapping"><ww:text name="'admin.globalsettings.lookandfeel.gadget.chrome.colors.desc'"/></p>
		</td>
	</tr>
    <ww:iterator value="/gadgetColors" status="'status'">
        <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
            <td valign=top width=30%>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.gadget.colour.' + ."/></b></td>
            <td valign=top width=70%><ww:property value="/gadgetColor(.)" escape="false"/></td>
        </tr>        
    </ww:iterator>
</table>
</td></tr></table>
<p/>
<table id="lookAndFeelFormats" align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=100%><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width=100%>

    <tr bgcolor=#f0f0f0>
		<td class="colHeaderLink" colspan="3">
        <%-- // @todo - fix up
			<a href="http://www.atlassian.com/software/jira/docs/latest/configuration.html#settings" target="_jirahelp"><img src="<%= request.getContextPath() %>/images/icons/help_blue.gif" width=16 height=16 align=right border=0 alt="Get help!" title="Get online help about Look and Feel"></a>
        --%>
            <ui:component name="'lookandfeel.logoandcolours'" template="help.jsp">
                <ui:param name="'helpURLFragment'" value = "'#timeformats'"/>
            </ui:component>
			<h3 class="formtitle"><ww:text name="'admin.globalsettings.lookandfeel.date.time.formats'"/></h3>
            <p class="wrapping"><ww:text name="'admin.globalsettings.lookandfeel.date.time.formats.desc'"/></p>
		</td>
<%--        <td valign=top width=20%><b>Format</b></td>--%>
<%--        <td valign=top width=50%><b>Example</b></td>--%>
	</tr>

    <tr bgcolor="#f0f0f0">
		<td valign=top width=30%>&nbsp;</td>
		<td valign=top width=20%><b><ww:text name="'admin.globalsettings.lookandfeel.format'"/></b></td>
		<td valign=top width=50%><b><ww:text name="'admin.globalsettings.lookandfeel.example'"/></b></td>
	</tr>

    <tr bgcolor="#ffffff">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.time.format'"/></b></td>
		<td valign=top><ww:property value="applicationProperties/defaultBackedString('jira.lf.date.time')"  escape="false" /></td>
        <td valign=top><ww:property value="/outlookDate/formatTime(currentTimestamp)" /></td>
	</tr>
	<tr bgcolor="#fffff0">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.day.format'"/></b></td>
		<td valign=top><ww:property value="applicationProperties/defaultBackedString('jira.lf.date.day')"  escape="false" /></td>
        <td valign=top><ww:property value="/outlookDate/formatDay(currentTimestamp)" /></td>
	</tr>
    <tr bgcolor="#ffffff">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.complete.date.time.format'"/></b></td>
		<td valign=top><ww:property value="applicationProperties/defaultBackedString('jira.lf.date.complete')"  escape="false" /></td>
        <td valign=top><ww:property value="/outlookDate/formatDMYHMS(currentTimestamp)" /></td>
	</tr>
	<tr bgcolor="#fffff0">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.day.month.year.format'"/></b></td>
		<td valign=top><ww:property value="applicationProperties/defaultBackedString('jira.lf.date.dmy')"  escape="false" /></td>
        <td valign=top><ww:property value="/outlookDate/formatDMY(currentTimestamp)" /></td>
	</tr>
	<tr bgcolor="#ffffff">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.date.picker.format'"/></b> <span class="small">(<ww:text name="'admin.globalsettings.lookandfeel.javascript.format'"/>)</span></td>
		<td valign=top><ww:property value="applicationProperties/defaultBackedString('jira.date.picker.java.format')"  escape="false" />
                       <span class="small">(<ww:property value="applicationProperties/defaultBackedString('jira.date.picker.javascript.format')"  escape="false" />)</span></td>
        <td valign=top><ww:property value="/outlookDate/formatDatePicker(currentTimestamp)" /></td>
	</tr>
    <tr bgcolor="#fffff0">
		<td valign=top>&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.date.time.picker.format'"/></b> <span class="small">(<ww:text name="'admin.globalsettings.lookandfeel.javascript.format'"/>)</span></td>
		<td valign=top nowrap><ww:property value="applicationProperties/defaultBackedString('jira.date.time.picker.java.format')"  escape="false" />
                       <span class="small">(<ww:property value="applicationProperties/defaultBackedString('jira.date.time.picker.javascript.format')"  escape="false" />)</span></td>
        <td valign=top><ww:property value="/outlookDate/formatDateTimePicker(currentTimestamp)" /></td>
	</tr>
    <tr bgcolor="#ffffff">
        <td valign="top">&nbsp; <b><ww:text name="'admin.globalsettings.lookandfeel.date.time.picker.useISO8601'"/></b></td>
        <td valign="top" colspan="2"><ww:if test="/useISO8601 == true"><ww:text name="'admin.common.words.on'"/></ww:if><ww:else><ww:text name="'admin.common.words.off'"/></ww:else></td>
    </tr>
</table>
</td></tr></table>
<p/>
<ww:if test="/hasUserFormatsToEdit == true">
    <table id="userFormats" align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=100%><tr><td>
    <table id="userformat" border="0" cellpadding="3" cellspacing="1" width=100%>

        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink" colspan="3">
                <ui:component name="'lookandfeel.logoandcolours'" template="help.jsp">
                    <ui:param name="'helpURLFragment'" value = "'#userformats'"/>
                </ui:component>
                <h3 class="formtitle"><ww:text name="'admin.globalsettings.lookandfeel.user.formats'"/></h3>
            </td>
        </tr>

        <tr bgcolor="#f0f0f0">
            <td valign=top width=30%><b><ww:text name="'admin.globalsettings.lookandfeel.type'"/></b></td>
            <td valign=top width=20%><b><ww:text name="'admin.globalsettings.lookandfeel.format'"/></b></td>
            <td valign=top width=50%><b><ww:text name="'admin.globalsettings.lookandfeel.example'"/></b></td>
        </tr>
        <ww:iterator value="/userFormatTypes" status="'status'">
            <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
                <td valign=top><b><ww:property value="/userFormatTypeName(.)" /></b></td>
                <td valign=top><ww:property value="/userFormatName(.)"/><ww:if test="/userFormatTypeDesc(.) != null"> <br/><span class="small">(<ww:property value="/userFormatTypeDesc(.)"/>)</span></ww:if></td>
                <td valign=top><ww:property value="/sampleUserFormat(.)" escape="false"/></td>
            </tr>
        </ww:iterator>
    </table>
    </td></tr></table>
    <p/>
</ww:if>
<table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=100%><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width=100%>
	<tr bgcolor=#f0f0f0>
		<td class="colHeaderLink" colspan=2 align=center>
			<a href="EditLookAndFeel!default.jspa" id="editlookandfeel" accesskey="E"><b><ww:text name="'admin.common.phrases.edit.configuration'"/></b></a>
		</td>
	</tr>
</table>
</td></tr></table>
</body>
</html>
