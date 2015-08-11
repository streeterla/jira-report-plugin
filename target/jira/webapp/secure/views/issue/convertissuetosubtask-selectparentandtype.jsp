<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="textKey('title')"/>: <webwork:property value="issue/key" /></title>
</head>

<body>

<table width="100%" class="noPadding">
<tr>
    <%-- wizard steps pane --%>
    <td class="rowHeader" width="200" valign="top"><jsp:include page="/secure/views/issue/convertissuetosubtaskpane.jsp" flush="false" /></td>
    <%-- input pane --%>
    <td class="fieldValueArea rowClear" style="padding:10px;">
        <webwork:if test="errorMessages/empty == true">
        <table width="100%" cellpadding="10" cellspacing="0" border="0">
        <page:applyDecorator name="jiraform">
            <page:param name="title"><webwork:text name="textKey('title')"/>: <webwork:property value="issue/key" /></page:param>
            <page:param name="description">
                <webwork:if test="enterprise == true">
                    <webwork:text name="textKey('step1.desc.ent')">
                        <webwork:param name="value0"><strong></webwork:param>
                        <webwork:param name="value1"></strong></webwork:param>
                    </webwork:text>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="textKey('step1.desc.pro')">
                             <webwork:param name="value0"><strong></webwork:param>
                        <webwork:param name="value1"></strong></webwork:param>
                    </webwork:text>
                </webwork:else></page:param>
            <page:param name="columns">1</page:param>
            <page:param name="width">100%</page:param>
            <page:param name="action"><webwork:property value="/actionPrefix" />SetIssueType.jspa</page:param>
            <page:param name="autoSelectFirst">false</page:param>
            <page:param name="cancelURI"><%= request.getContextPath() %>/secure/<webwork:property value="/actionPrefix"/>!cancel.jspa?id=<webwork:property value="issue/id" /></page:param>
            <page:param name="submitId">next_submit</page:param>
            <page:param name="submitName"><webwork:text name="text('common.forms.next')"/> &gt;&gt;</page:param>

        <tr>
            <td class="rowClear">
                <br/>
                <table class="centred" width="75%" align="center" style="border: 1px solid #bbbbbb; padding: 2px;">
                <tr>
                    <td align="center">
                        <table width="100%" >
                            <webwork:if test="/issue/subTask == false">
                                <%-- select parent issue, Only do if the current issue is not a subtask--%>
                                <tr class="wizardRow">
                                    <td class="wizardCell" width="20%"><strong><webwork:text name="textKey('selectparentissue')"/>:</strong></td>
                                    <ui:component label="text('selectparentissue')" name="'parentIssueKey'" template="issuepicker.jsp" theme="'single'">
                                        <ui:param name="'size'" value="18"/>
                                        <ui:param name="'formname'" value="'jiraform'"/>
                                        <ui:param name="'currentissue'" value="issue/key" />
                                        <ui:param name="'showSubTasks'">false</ui:param>
                                        <ui:param name="'singleSelectOnly'">true</ui:param>
                                        <ui:param name="'sameProjectMessage'">true</ui:param>
                                        <ui:param name="'selectedProjectKey'" value="issue/projectObject/key" />
                                        <ui:param name="'selectedProjectId'" value="issue/projectObject/id" />
                                        <ui:param name="'currentJQL'" value="/currentJQL" />
                                        <ui:param name="'class'">wizardCell</ui:param>
                                    </ui:component>
                                </tr>
                            </webwork:if>


                        <tr class="wizardRow">
                                <td class="wizardCell" width="20%"><strong><webwork:text name="textKey('selectissuetype')"/>:</strong></td>
                                <%-- Current Issue Type --%>
                                <td class="wizardCell" style="padding-bottom:0; padding-top:0;">
                                    <table width="100%" >
                                        <td class="wizardCell" width="20%" style="padding-left:0;"><webwork:text name="textKey('selectissuetype.current')"/>: &nbsp;&nbsp;<strong><webwork:property value="./issue/issueTypeObject/name"/></strong></td>
                                        <td class="wizardCell" style="text-align:center;"><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height="16" width="16" align="middle" alt=""/></td>
                                        <%-- Target Issue Type --%>
                                        <td class="wizardCell" width="10%"><webwork:text name="textKey('selectissuetype.target')"/>:</td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <ui:select label="" name="'issuetype'" list="./availableIssueTypes" value="./issuetype" listKey="'id'"  listValue="'nameTranslation(../..)'" theme="'single'">
                                                        <ui:param name="'mandatory'" value="true"/>

                                                    </ui:select>
                                                    <td style="padding-left:0" >
                                                          <a  href="<%= request.getContextPath() %>/secure/ShowConstantsHelp.jspa?decorator=popup#IssueTypes" onclick="var child = window.open('<%= request.getContextPath() %>/secure/ShowConstantsHelp.jspa?decorator=popup#IssueTypes', 'jiraLocalHelp', 'width=600, height=500, resizable, scrollbars=yes'); child.focus(); return false;"><img src="<%= request.getContextPath() %>/images/icons/help_blue.gif" title="<webwork:text name="'online.help'"/> <webwork:text name="'issue.field.issuetype'"/> " /></a>
                                                    </td>
                                                </tr>
                                            </table>


                                    </table>

                                </td>
                        </tr>
                        </table>
                    </td>
                </tr>
                </table>
            </td>
        </tr>

            <ui:component name="'id'" template="hidden.jsp"  theme="'single'" />
            <ui:component name="'guid'" template="hidden.jsp"  theme="'single'" />
        </page:applyDecorator>
        </table>
        </webwork:if>

        <webwork:else>
            <%-- display error message --%>
            <page:applyDecorator name="jiraform" >
                <%-- Must have body, else NullPointer is thrown --%>
            </page:applyDecorator>

        </webwork:else>

    </td>
</tr>
</table>

</body>
</html>
