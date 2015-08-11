
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.issuelinking.view.issue.link.types'"/></title>
</head>

<body>

<webwork:if test="issueLinking == true">
    <page:applyDecorator name="jiraform">
        <page:param name="action">IssueLinkingDeActivate.jspa</page:param>
        <page:param name="submitId">deactivate_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.common.words.deactivate'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuelinking.issue.linking'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="description">
            <webwork:text name="'admin.issuelinking.status'">
                <webwork:param name="'value0'"><font color="#009900"><b><webwork:text name="'admin.common.words.on'"/></b></font></webwork:param>
            </webwork:text>
            <p>
            <webwork:text name="'admin.issuelinking.instruction2'">
                <webwork:param name="'value0'"><b><webwork:text name="'admin.permissions.LINK_ISSUE'"/></b></webwork:param>
            </webwork:text>
            <p>
            <webwork:text name="'admin.issuelinking.instruction3'"/>
        </page:param>
        <page:param name="helpURL">issuelinking</page:param>
    </page:applyDecorator>
    <br/>
    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.issuelinking.outward.description'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.issuelinking.inward.description'"/></b>
            </td>
            <td class="colHeaderLink">
               <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <%/*counter used to alternate background row colors*/%>
        <webwork:bean name="'webwork.util.Counter'" id="rowCount">
            <webwork:param name="'wrap'" value="true"/>
            <webwork:param name="'last'" value="2"/>
        </webwork:bean>

        <webwork:iterator value="linkTypes">
        <tr
            <webwork:if test="@rowCount/next == 1">
                bgcolor="#ffffff"
            </webwork:if>
            <webwork:if test = "@rowCount/next == 0"/>
            <webwork:if test = "@rowCount/next == 2">
                bgcolor="#fffff0"
            </webwork:if>
        >
            <td valign=top><b><webwork:property value="./name"/></b></td>
            <td valign=top><webwork:property value="./outward"/></td>
            <td valign=top><webwork:property value="./inward"/></td>
            </td>
            <td valign=top width=1% nowrap>
                <a href="EditLinkType!default.jspa?id=<webwork:property value="./id"/>"><webwork:text name="'common.words.edit'"/></a>
                |
                <a id="del_<webwork:property value="./name"/>" href="DeleteLinkType!default.jspa?id=<webwork:property value="./id"/>"><webwork:text name="'common.words.delete'"/></a>
            </td>
        </tr>
        </webwork:iterator>
    </table>
    </td></tr></table>

    <br/>
    <page:applyDecorator name="jiraform">
        <page:param name="action">ViewLinkTypes.jspa</page:param>
        <page:param name="submitId">add_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.issuelinking.add.new.link.type'"/></page:param>
        <page:param name="description"><webwork:text name="'admin.issuelinking.add.a.new.link.type'"/></page:param>
        <page:param name="autoSelectFirst">false</page:param>

        <ui:textfield label="text('common.words.name')" name="'name'" size="'30'">
            <ui:param name="'description'"><webwork:text name="'admin.issuelinking.name.description'"/></ui:param>
        </ui:textfield>

        <ui:textfield label="text('admin.issuelinking.outward.link.description')" name="'outward'" size="'30'">
            <ui:param name="'description'"><webwork:text name="'admin.issuelinking.outward.link.example'"/></ui:param>
        </ui:textfield>

        <ui:textfield label="text('admin.issuelinking.inward.link.description')" name="'inward'" size="'30'">
            <ui:param name="'description'"><webwork:text name="'admin.issuelinking.inward.link.example'"/></ui:param>
        </ui:textfield>
    </page:applyDecorator>

</webwork:if>
<webwork:else>
    <page:applyDecorator name="jiraform">
        <page:param name="action">IssueLinkingActivate.jspa</page:param>
        <page:param name="submitId">activate_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.common.words.activate'"/></page:param>
        <page:param name="title"><webwork:text name="'admin.issuelinking.issue.linking'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description">
            <webwork:text name="'admin.issuelinking.status'">
                <webwork:param name="'value0'"><font color="#990000"><b><webwork:text name="'admin.common.words.off'"/></b></font></webwork:param>
            </webwork:text>
            <p>
            <webwork:text name="'admin.issuelinking.instruction'"/>
        </page:param>
    </page:applyDecorator>
</webwork:else>

</body>
</html>
