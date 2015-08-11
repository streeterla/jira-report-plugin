<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuesettings.priorities.view.priorities'"/></title>
</head>
<body>
<script language="JavaScript">
    function openWindow()
    {
        var vWinUsers = window.open('<%= request.getContextPath() %>/secure/popups/IconPicker.jspa?fieldType=priority&formName=jiraform','IconPicker', 'status=no,resizable=yes,top=100,left=200,width=580,height=650,scrollbars=yes');
        vWinUsers.opener = self;
	    vWinUsers.focus();
    }
</script>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuesettings.priorities.view.priorities'"/></page:param>
    <page:param name="width">100%</page:param>
    <p>
    <webwork:text name="'admin.issuesettings.priorities.the.table.below'"/>
    </p>
    <webwork:if test="/translatable == true">
        <p>
        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" align="absmiddle" alt="" />
        <webwork:text name="'admin.issuesettings.priorities.translate.priorities'">
            <webwork:param name="'value0'"><b><a href="ViewTranslations!default.jspa?issueConstantType=priority"/></webwork:param>
            <webwork:param name="'value1'"></a></b></webwork:param>
        </webwork:text>
        </p>
    </webwork:if>
</page:applyDecorator>
<p>
    <table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor="#f0f0f0">
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.description'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'iconpicker.label.icon'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.common.words.color'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.issuesettings.order'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>
        <webwork:iterator value="/constantsManager/priorities" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign="top"><b><webwork:property value="string('name')"/></b><webwork:if test="../default(.) == true"> (<webwork:text name="'admin.common.words.default'"/>)</webwork:if></td>
            <td valign="top"><webwork:property value="string('description')"/></td>
            <td valign="top" align=center>
            <webwork:component name="'priority'" template="constanticon.jsp">
              <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
              <webwork:param name="'iconurl'" value="./string('iconurl')" />
              <webwork:param name="'alt'"><webwork:property value="./string('name')" /></webwork:param>
            </webwork:component>
            </td>
            <td align="center">
                <table><tr><td bgcolor="<webwork:property value="./string('statusColor')"/>"><img src="<%= request.getContextPath() %>/images/border/spacer.gif" border="0" width="16" height="16" alt=""/></td></tr></table>
            </td>
            <td valign="top" align="center">
                <webwork:if test="@status/first != true"><a href="<webwork:url page="PriorityUp.jspa"><webwork:param name="'up'" value="string('id')" /></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_up_blue_small.gif" class="sortArrow" alt="<webwork:text name="'admin.issuesettings.priorities.move.priority.up'"/>"></a></webwork:if>
                <webwork:else><img src="<%= request.getContextPath() %>/images/border/spacer.gif" class="sortArrow" alt=""/></webwork:else>
                <webwork:if test="@status/last != true"><a href="<webwork:url page="PriorityDown.jspa"><webwork:param name="'down'" value="string('id')" /></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_down_blue_small.gif" class="sortArrow" alt="<webwork:text name="'admin.issuesettings.priorities.move.priority.down'"/>"></a></webwork:if>
                <webwork:else><img src="<%= request.getContextPath() %>/images/border/spacer.gif" class="sortArrow" alt=""/></webwork:else>
            </td>
            <td valign=top nowrap>
                <a href="EditPriority!default.jspa?id=<webwork:property value="string('id')"/>"><webwork:text name="'common.words.edit'"/></a>
                |
                <a href="DeletePriority!default.jspa?id=<webwork:property value="string('id')"/>"><webwork:text name="'common.words.delete'"/></a>
                <webwork:if test="../default(.) == false">
                |
                <a href="<webwork:url page="MakeDefaultPriority.jspa"><webwork:param name="'make'" value="string('id')" /></webwork:url>"><webwork:text name="'admin.common.words.default'"/></a>
                </webwork:if>
            </td>
        </tr>
        </webwork:iterator>
    </table>
    </td></tr></table>

    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddPriority.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.issuesettings.priorities.add.new.priority'"/></page:param>
        <page:param name="helpURL">priorities</page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" >
            <ui:param name="'mandatory'" value="'true'" />
        </ui:textfield>

        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />

        <ui:component label="text('admin.common.phrases.icon.url')" name="'iconurl'" template="textimagedisabling.jsp">
    	    <ui:param name="'imagefunction'">openWindow()</ui:param>
    	    <ui:param name="'size'">60</ui:param>
    	    <ui:param name="'mandatory'">true</ui:param>
    	    <ui:param name="'description'"><webwork:text name="'admin.common.phrases.relative.to.jira'"/></ui:param>
        </ui:component>

        <ui:component label="text('admin.issuesettings.priorities.status.color')" name="'statusColor'" template="colorpicker.jsp">
            <ui:param name="'size'">40</ui:param>
            <ui:param name="'mandatory'" value="'true'" />
        </ui:component>
        <ui:component name="'preview'" value="'false'" template="hidden.jsp" theme="'single'"  />

    </page:applyDecorator>
    </p>
</body>
</html>
