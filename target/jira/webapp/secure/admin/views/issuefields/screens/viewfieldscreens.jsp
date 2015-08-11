<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuefields.screens.view.screens'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuefields.screens.view.screens'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">fieldscreens</page:param>
    <p>
        <webwork:text name="'admin.issuefields.screens.the.table.below'"/>
    </p>
    <p>
        <webwork:text name="'admin.issuefields.screens.description'"/>
        <webwork:if test="/standard == false">
            <ul>
                <li>
                    <webwork:text name="'admin.issuefields.screens.to.choose.screens'">
                        <webwork:param name="'value0'"><b></webwork:param>
                        <webwork:param name="'value1'"></b></webwork:param>
                        <webwork:param name="'value2'"><b></webwork:param>
                        <webwork:param name="'value3'"></b></webwork:param>
                        <webwork:param name="'value4'"><a href="ViewFieldScreenSchemes.jspa"></webwork:param>
                        <webwork:param name="'value5'"></a></webwork:param>
                    </webwork:text>
                </li>
                <li>
                    <webwork:text name="'admin.issuefields.screens.to.select.screens'">
                        <webwork:param name="'value0'"><b></webwork:param>
                        <webwork:param name="'value1'"></b></webwork:param>
                        <webwork:param name="'value2'"><a href="ListWorkflows.jspa"></webwork:param>
                        <webwork:param name="'value3'"></a></webwork:param>
                    </webwork:text>
                </li>
            </ul>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.issuefields.screens.to.choose.screens.that.are.displayed'"/>
            <webwork:if test="/standard == true">
                the <a href="ConfigureFieldScreenScheme.jspa"><webwork:text name="'admin.menu.issuefields.screen.scheme'"/></a>.
            </webwork:if>
            <webwork:else>
                <a href="ViewFieldScreenSchemes.jspa"><webwork:text name="'admin.menu.issuefields.screen.schemes'"/></a>.
            </webwork:else>
        </webwork:else>
    </p>
    <p>
        <webwork:if test="/standard == false">
            <webwork:text name="'admin.issuefields.screens.note1'">
                <webwork:param name="'value0'"><span class="note"></webwork:param>
                <webwork:param name="'value1'"></span></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.issuefields.screens.note2'">
                <webwork:param name="'value0'"><span class="warning"></webwork:param>
                <webwork:param name="'value1'"></span></webwork:param>
                <webwork:param name="'value2'"><font color="darkred"><b></webwork:param>
                <webwork:param name="'value3'"></b></font></webwork:param>
                <webwork:param name="'value4'"><font color="darkgreen"><b></webwork:param>
                <webwork:param name="'value5'"></b></font></webwork:param>
            </webwork:text>
        </webwork:else>
    </p>
</page:applyDecorator>
<p>
    <table class="gridBox" cellpadding="3" cellspacing="1" width="90%" align="center">
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink" width="15%">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink" width="30%">
                <b><webwork:text name="'common.words.description'"/></b>
            </td>
            <webwork:if test="/standard == false">
            <td class="colHeaderLink" width="20%">
                <b><webwork:text name="'admin.menu.issuefields.screen.schemes'"/></b>
            </td>
            <td class="colHeaderLink" width="20%">
                <b><webwork:text name="'admin.menu.globalsettings.workflows'"/></b>
            </td>
            </webwork:if>
            <webwork:else>
                <td class="colHeaderLink" width="20%">
                    <b><webwork:text name="'admin.common.phrases.active.inactive'"/></b>
                </td>
            </webwork:else>
            <td class="colHeaderLink" width="15%" align="left">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:if test="/fieldScreens/empty == false">
            <webwork:iterator value="/fieldScreens" status="'status'">
            <tr bgcolor="#<webwork:if test="@status/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                    <td valign=top>
                        <webwork:property value="./name" />
                    </td>
                    <td valign=top>
                        <webwork:property value="./description" />
                    </td>
                    <webwork:if test="/standard == false">
                    <td valign=top>
                        <webwork:iterator value="/fieldScreenSchemes(.)" status="'schemeStatus'">
                            <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height=8 width=8 border=0 align=absmiddle>
                            <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreenScheme.jspa?id=<webwork:property value="./id" />"><webwork:property value="./name" /></a>
                            <webwork:if test="@schemeStatus/last == false"><br></webwork:if>
                        </webwork:iterator>
                    </td>
                    <td valign=top>
                        <webwork:property value="/workflows(.)">
                            <webwork:if test=". && ./empty == false">
                                <webwork:iterator value="./keySet" status="'workflowStatus'">
                                    <webwork:iterator value="../(.)" status="'transitionStatus'">
                                        <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height=8 width=8 border=0 align=absmiddle>
                                        <%-- If the action is global then no need to pass the step id in teh link --%>
                                        <webwork:if test="../globalAction(.) == true">
                                            <a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="../mode" /><webwork:param name="'workflowName'" value="../name" /><webwork:param name="'workflowTransition'" value="id" /></webwork:url>"><webwork:property value="../name" /></a>
                                        </webwork:if>
                                        <webwork:else>
                                            <webwork:property value="../stepsForTransition(.)/iterator/next" id="step" />
                                            <a href="<webwork:url page="ViewWorkflowTransition.jspa"><webwork:param name="'workflowMode'" value="../mode" /><webwork:param name="'workflowName'" value="../name" /><webwork:param name="'workflowStep'" value="@step/id" /><webwork:param name="'workflowTransition'" value="./id" /></webwork:url>"><webwork:property value="../name" /></a>
                                        </webwork:else>
                                        <span class="small">(<webwork:property value="./name" />)</span>
                                        <webwork:if test="@workflowStatus/last == false || @transitionStatus/last == false"><br></webwork:if>
                                    </webwork:iterator>
                                </webwork:iterator>
                            </webwork:if>
                            <webwork:else>
                                &nbsp;
                            </webwork:else>
                        </webwork:property>
                    </td>
                    </webwork:if>
                    <webwork:else>
                        <td valign=top>
                            <webwork:if test="/deletable(.) == false"><font color="darkgreen"><b><webwork:text name="'admin.common.words.active'"/></b></font></webwork:if>
                            <webwork:else><font color="darkred"><b><webwork:text name="'admin.common.words.inactive'"/></b></font></webwork:else>
                        </td>
                    </webwork:else>
                    <td valign=top nowrap align="left">
                        <a id="configure_fieldscreen_<webwork:property value="./name" />" href="ConfigureFieldScreen.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.screens.configure.tabs.and.fields'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'admin.common.words.configure'"/></a>
                        | <a id="edit_fieldscreen_<webwork:property value="./name" />" href="EditFieldScreen!default.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.screens.edit.value'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'common.words.edit'"/></a>
                        | <a id="copy_fieldscreen_<webwork:property value="./name" />" href="CopyFieldScreen.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.screens.copy.value'">
                            <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                        </webwork:text>"><webwork:text name="'common.words.copy'"/></a>
                        <webwork:if test="/deletable(.) == true">
                            | <a id="delete_fieldscreen_<webwork:property value="./name" />" href="DeleteFieldScreen.jspa?id=<webwork:property value="./id" />" title="<webwork:text name="'admin.issuefields.screens.delete.value'">
                                <webwork:param name="'value0'"><webwork:property value="./name" /></webwork:param>
                            </webwork:text>"><webwork:text name="'common.words.delete'"/></a>
                        </webwork:if>
                    </td>
            </tr>
            </webwork:iterator>
        </webwork:if>
        <webwork:else>
            <tr><td colspan="5" bgcolor="#ffffff"><webwork:text name="'admin.issuefields.screens.no.screens.configured'"/></td></tr>
        </webwork:else>
    </table>
</p>
<p>
<page:applyDecorator name="jiraform">
    <page:param name="action">AddFieldScreen.jspa</page:param>
    <page:param name="submitId">add_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
    <page:param name="title"><webwork:text name="'admin.issuefields.screens.add.screen'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <webwork:text name="'admin.issuefields.screens.add.screen.instruction'">
            <webwork:param name="'value0'"><b><webwork:text name="'common.forms.add'"/></b></webwork:param>
        </webwork:text>
    </page:param>

    <ui:textfield label="text('common.words.name')" name="'fieldScreenName'" size="'30'">
        <ui:param name="'mandatory'">true</ui:param>
    </ui:textfield>

    <ui:textfield label="text('common.words.description')" name="'fieldScreenDescription'" size="'60'" />
</page:applyDecorator>
</p>
</body>
</html>
