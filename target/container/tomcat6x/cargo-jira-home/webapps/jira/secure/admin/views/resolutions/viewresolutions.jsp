<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuesettings.resolutions.view.resolutions'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuesettings.resolutions.view.resolutions'"/></page:param>
    <page:param name="width">100%</page:param>
    <p>
    <webwork:text name="'admin.issuesettings.resolutions.the.table.below'"/>
    </p>
    <ul class="square">
    <webwork:if test="/translatable == true">
        <li><webwork:text name="'admin.issuesettings.resolutions.translations'">
            <webwork:param name="'value0'"><a href="ViewTranslations!default.jspa?issueConstantType=resolution"/></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text></li>
    </webwork:if>
    <li><webwork:text name="'admin.issuesettings.resolutions.clear.defaults'">
        <webwork:param name="'value0'"><a href="MakeDefaultResolution.jspa"/></webwork:param>
        <webwork:param name="'value1'"></a></webwork:param>
    </webwork:text></li>
    </ul>
</page:applyDecorator>

<p>

    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.description'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.issuesettings.order'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:iterator value="/constantsManager/resolutions" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign=top><b><webwork:property value="string('name')"/></b><webwork:if test="../default(.) == true"> (<webwork:text name="'admin.common.words.default'"/>)</webwork:if></td>
            <td valign=top><webwork:property value="string('description')"/></td>
            <td valign=top align=center>
                <webwork:if test="@status/first != true"><a href="<webwork:url page="ResolutionUp.jspa"><webwork:param name="'up'" value="string('id')" /></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_up_blue_small.gif" class="sortArrow" alt="<webwork:text name="'admin.issuesettings.resolutions.move.up'"/>"></a></webwork:if>
                <webwork:else><image src="<%= request.getContextPath() %>/images/border/spacer.gif" class="sortArrow"></webwork:else>
                <webwork:if test="@status/last != true"><a href="<webwork:url page="ResolutionDown.jspa"><webwork:param name="'down'" value="string('id')" /></webwork:url>"><img src="<%= request.getContextPath() %>/images/icons/arrow_down_blue_small.gif" class="sortArrow" alt="<webwork:text name="'admin.issuesettings.resolutions.move.down'"/>"></a></webwork:if>
                <webwork:else><image src="<%= request.getContextPath() %>/images/border/spacer.gif" class="sortArrow"></webwork:else>
            </td>
            <td valign=top nowrap>
                <a href="EditResolution!default.jspa?id=<webwork:property value="string('id')"/>"><webwork:text name="'common.words.edit'"/></a>
                |
                <a href="DeleteResolution!default.jspa?id=<webwork:property value="string('id')"/>"><webwork:text name="'common.words.delete'"/></a>
                <webwork:if test="../default(.) == false">
                |
                <a href="<webwork:url page="MakeDefaultResolution.jspa"><webwork:param name="'make'" value="string('id')" /></webwork:url>"><webwork:text name="'admin.common.words.default'"/></a>
                </webwork:if>
            </td>
        </tr>
        </webwork:iterator>
    </table>
    </td></tr></table>

    <p>
    <page:applyDecorator name="jiraform">
        <page:param name="action">AddResolution.jspa</page:param>
        <page:param name="helpURL">resolutions</page:param>
        <page:param name="width">100%</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuesettings.resolutions.add.new.resolution'"/></page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" />

        <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />
    </page:applyDecorator>
    </p>

</body>
</html>
