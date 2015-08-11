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
        <webwork:if test="errorMessages/empty == true && targetWorkflow != null">
        <table width="100%" cellpadding="10" cellspacing="0" border="0">
            <page:applyDecorator name="jiraform">
                <page:param name="title">
                    <webwork:text name="textKey('title')"/>: <webwork:property value="issue/key" />
                </page:param>
                <page:param name="description">
                    <webwork:text name="textKey('step2.desc.ent')">
                        <webwork:param name="value0"><strong></webwork:param>
                        <webwork:param name="value1"></strong></webwork:param>
                    </webwork:text>
                </page:param>
                <page:param name="columns">1</page:param>
                <page:param name="width">100%</page:param>
                <page:param name="action"><webwork:property value="/actionPrefix"/>SetStatus.jspa</page:param>
                <page:param name="autoSelectFirst">false</page:param>
                <page:param name="cancelURI"><%= request.getContextPath() %>/secure/<webwork:property value="/actionPrefix"/>!cancel.jspa?id=<webwork:property value="issue/id" /></page:param>
                <page:param name="submitId">next_submit</page:param>
                <page:param name="submitName"><webwork:property value="text('common.forms.next')"/> &gt;&gt;</page:param>

        <tr>
            <td class="rowClear">
                <br/>
                <table class="centred" width="75%" align="center" style="border: 1px solid #bbbbbb; padding: 2px;">
                <tr>
                    <td align="center">
                        <table width="100%">
                            <tr class="wizardRow">
                                <td class="wizardCell" width="20%"><strong><webwork:text name="'convert.issue.to.subtask.selectstatus'"/>:</strong></td>
                                <%-- Current Issue Status --%>
                                <td class="wizardCell" style="padding-bottom:0; padding-top:0;">
                                    <table width="100%" >
                                        <tr>
                                            <td class="wizardCell" style="padding-bottom:0; padding-top:0;" width="20%">
                                                <webwork:component name="'status'" template="constanticon.jsp">
                                                    <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                                                    <webwork:param name="'iconurl'" value="issue/statusObject/iconUrl" />
                                                    <webwork:param name="'alt'"><webwork:property value="/issue/statusObject/nameTranslation(.)" /></webwork:param>
                                                    <webwork:param name="'title'"><webwork:property value="/issue/statusObject/nameTranslation(.)" /> - <webwork:property value="/issue/statusObject/descTranslation(.)" /></webwork:param>
                                                    <webwork:param name="'class'">wizardCell</webwork:param>
                                                </webwork:component>
                                                <strong><webwork:property value="/issue/statusObject/nameTranslation(.)"/></strong>
                                                <span class=smallgrey>(<strong><webwork:text name="'convert.issue.to.subtask.workflow'"/></strong>:&nbsp;<webwork:property value="currentWorkflow/name"/>)</span>
                                            </td>
                                            <td class="wizardCell" style="text-align:center; padding-bottom:0; padding-top:0;"><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height="16" width="16" border="0" align="middle" alt=""></td>
                                            <%-- Target Status --%>
                                            <td class="wizardCell" style="padding-bottom:0; padding-top:0;" >
                                                <table>
                                                    <tr>
                                                        <ui:select label="" name="'targetStatusId'" list="./targetWorkflow/linkedStatusObjects" value="./targetStatusId" listKey="'id'"  listValue="'nameTranslation(../..)'" theme="'single'">
                                                            <ui:param name="'mandatory'" value="true"/>
                                                            <ui:param name="'class'">wizardCell</ui:param>
                                                        </ui:select>
                                                        <td class="wizardCell" style="padding-left:0;">
                                                        <span class=smallgrey>(<strong><webwork:text name="'convert.issue.to.subtask.workflow'"/></strong>:&nbsp;<webwork:property value="targetWorkflow/name"/>)</span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </table>

            </td>
        </tr>

        <ui:component name="'id'" template="hidden.jsp" theme="'single'"/>
        <ui:component name="'guid'" template="hidden.jsp"  theme="'single'" />

            </page:applyDecorator>
        </table>
        </webwork:if>

        <webwork:else>
            <%-- display error message --%>
            <page:applyDecorator name="jiraform">
                <%-- Must have body, else NullPointer is thrown --%>
            </page:applyDecorator>
        </webwork:else>
    </td>
</tr>
</table>

</body>
</html>
