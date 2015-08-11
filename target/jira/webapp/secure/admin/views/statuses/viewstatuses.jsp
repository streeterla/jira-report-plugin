<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.issuesettings.statuses.view.statuses'"/></title>
</head>
<body>

<script language="JavaScript">
    function openWindow()
    {
        var vWinUsers = window.open('<%= request.getContextPath() %>/secure/popups/IconPicker.jspa?fieldType=status&formName=jiraform','IconPicker', 'status=no,resizable=yes,top=100,left=200,width=580,height=650,scrollbars=yes');
        vWinUsers.opener = self;
	    vWinUsers.focus();
    }
</script>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.issuesettings.statuses.view.statuses'"/></page:param>
    <page:param name="width">100%</page:param>
    <p>
    <webwork:text name="'admin.issuesettings.statuses.the.table.below'"/>
    </p>
    <p>
        <webwork:text name="'admin.issuesettings.statuses.all.statuses.have.one.of.two.modes'"/>
        <ul>
            <li><webwork:text name="'admin.issuesettings.statuses.active'">
                <webwork:param name="'value0'"><font color="darkgreen"><b><webwork:text name="'admin.common.words.active'"/></b></font></webwork:param>
            </webwork:text>
            <li><webwork:text name="'admin.issuesettings.statuses.inactive'">
                <webwork:param name="'value0'"><font color="darkred"><b><webwork:text name="'admin.common.words.inactive'"/></b></font></webwork:param>
            </webwork:text>
        </ul>
        <webwork:text name="'admin.issuesettings.statuses.to.delete.a.status'"/>
    </p>
    <webwork:if test="/translatable == true">
        <p>
        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle>
        <b><webwork:text name="'admin.issuesettings.statuses.translate.statuses'">
            <webwork:param name="'value0'"><a href="ViewTranslations!default.jspa?issueConstantType=status" id="view-translation"/></webwork:param>
            <webwork:param name="'value1'"></a></b></webwork:param>
        </webwork:text>
        </p>
    </webwork:if>
</page:applyDecorator>
<p>
    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.issuesettings.statuses.status.details'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.issuesettings.statuses.mode'"/></b>
            </td>
            <webwork:if test="professionalFeatureEnabled == true">
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.issuesettings.statuses.workflows'"/></b>
            </td>
            </webwork:if>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:iterator value="/constantsManager/statuses" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
             <td valign=top>
                <webwork:component name="'status'" template="constanticon.jsp">
                    <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                    <webwork:param name="'iconurl'" value="./string('iconurl')" />
                    <webwork:param name="'alt'"><webwork:property value="./string('name')" /></webwork:param>
                </webwork:component>

                <b><span style="vertical-align:middle;"><webwork:property value="string('name')"/></span></b>

                <webwork:if test="string('description')/length > 1">
                    <br>
                    <webwork:property value="string('description')"/>
                </webwork:if>

            </td>

            <!-- Mode column - is staus active? -->
            <td nowrap>
                <webwork:if test="/associatedWorkflows(.)/empty == false">
                    <span class="green-highlight"><webwork:text name="'admin.common.words.active'"/></span>
                </webwork:if>
                <webwork:else>
                    <span class="red-highlight"><webwork:text name="'admin.common.words.inactive'"/></span>
                </webwork:else>
            </td>

            <!-- Workflows column - display associated workflows -->
            <webwork:if test="professionalFeatureEnabled == true">
            <td nowrap>
                <webwork:if test="/associatedWorkflows(.)/empty == false">
                    <%--<webwork:iterator value="associatedWorkflows(.)" status="'iteratorStatus'">
                        <a href="ViewWorkflowSteps.jspa?workflowName=<webwork:property value="." />">
                            <webwork:property value="."/></a><webwork:if test="@iteratorStatus/last == false">, </webwork:if>
                    </webwork:iterator>--%>
                    <webwork:iterator value="associatedWorkflows(.)" status="'iteratorStatus'">
                        <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height="8" width="8" border="0" align="absmiddle" alt="" />
                        <a href="<webwork:url page="ViewWorkflowSteps.jspa"><webwork:param name="'workflowMode'" value="'live'" /><webwork:param name="'workflowName'" value="." /></webwork:url>">
                            <webwork:property value="."/></a>
                        <br>
                    </webwork:iterator>
                </webwork:if>
            </td>
            </webwork:if>

            <td nowrap>
                <a href="EditStatus!default.jspa?id=<webwork:property value="string('id')"/>"><webwork:text name="'common.words.edit'"/></a>
                <webwork:if test="/associatedWorkflows(.)/empty == true">
                | <a id="del_<webwork:property value="string('id')"/>"href="DeleteStatus!default.jspa?id=<webwork:property value="string('id')"/>"><webwork:text name="'common.words.delete'"/></a>
                </webwork:if>
            </td>
        </tr>
        </webwork:iterator>
    </table>
    </td></tr></table>

    <webwork:if test="professionalFeatureEnabled == true">
        <p>
        <page:applyDecorator name="jiraform">
            <page:param name="action">AddStatus.jspa</page:param>
            <page:param name="submitId">add_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
            <page:param name="helpURL">statuses</page:param>
            <page:param name="title"><webwork:text name="'admin.issuesettings.statuses.add.new.status'"/></page:param>
            <page:param name="width">100%</page:param>

            <ui:textfield label="text('common.words.name')" name="'name'" size="'30'" />

            <ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />

        <ui:component label="text('admin.common.phrases.icon.url')" name="'iconurl'" template="textimagedisabling.jsp">
    	    <ui:param name="'imagefunction'">openWindow()</ui:param>
    	    <ui:param name="'size'">60</ui:param>
    	    <ui:param name="'mandatory'">true</ui:param>
    	    <ui:param name="'description'"><webwork:text name="'admin.common.phrases.relative.to.jira'"/></ui:param>
        </ui:component>
        </page:applyDecorator>
        </p>
    </webwork:if>

</body>
</html>
