<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:bean id="fieldVisibility" name="'com.atlassian.jira.web.bean.FieldVisibilityBean'" />
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
                <webwork:text name="textKey('title')"/>: <webwork:property value="issue/key"/>
            </page:param>
            <page:param name="description">
                <webwork:if test="enterprise == true">
                    <webwork:text name="textKey('step4.desc.ent')">
                        <webwork:param name="value0"><strong></webwork:param>
                        <webwork:param name="value1"></strong></webwork:param>
                    </webwork:text>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="textKey('step3.desc.pro')">
                        <webwork:param name="value0"><strong></webwork:param>
                        <webwork:param name="value1"></strong></webwork:param>
                    </webwork:text>
                </webwork:else>
            </page:param>
            <page:param name="columns">1</page:param>
            <page:param name="width">100%</page:param>
            <page:param name="action"><webwork:property value="/actionPrefix" />Convert.jspa</page:param>
            <page:param name="autoSelectFirst">false</page:param>
            <page:param name="cancelURI"><%= request.getContextPath() %>/secure/<webwork:property value="/actionPrefix" />!cancel.jspa?id=<webwork:property value="issue/id"/></page:param>
            <page:param name="submitId">finish_submit</page:param>
            <page:param name="submitName"><webwork:property value="text('common.forms.finish')"/></page:param>

        <tr><td colspan="2" bgcolor="#ffffff">
        <br/>
        <table class="centred" width="75%" align="center" style="border: 1px solid #bbbbbb; padding: 2px;">
            <tr>
                <td align="center">
                    <table id="convert_confirm_table" class="gridTabBox" cellpadding="3" cellspacing="1" align="center" width="100%">
                        <tr>
                            <td bgcolor="#dddddd" width="20%"><strong>&nbsp;</strong></td>
                            <td bgcolor="#dddddd" width="40%"><strong><webwork:text name="textKey('originalvalue')"/></strong></td>
                            <td bgcolor="#dddddd" width="40%"><strong><webwork:text name="textKey('newvalue')"/></strong></td>
                        </tr>

                        <%-- Breaking page into smaller parts - JRA-5059 --%>
                        <%-- this displays type, status and security level --%>
                        <jsp:include page="/secure/views/issue/convertissuetosubtask-confirm-part1.jsp" flush="false" />

                        <%-- Show all the fields that have changed for the move --%>
                        <webwork:iterator value="convertFieldLayoutItems">
                            <tr>
                                <td bgcolor="#f0f0f0" width="20%" valign="top"><webwork:property value="/fieldName(./orderableField)" /></td>
                                <td bgcolor="#ffffff" class="red-highlight" width="40%" valign="top"><webwork:property value="oldViewHtml(./orderableField)" escape="'false'" /></td>
                                <td bgcolor="#ffffff" class="green-highlight" width="40%" valign="top"><webwork:property value="newViewHtml(./orderableField)" escape="'false'" /></td>
                            </tr>
                        </webwork:iterator>
                        <%-- Show all the fields that will be removed --%>
                        <webwork:iterator value="removeFields">
                            <tr>
                                <td bgcolor="#f0f0f0" width="20%" valign="top"><webwork:property value="/fieldName(.)" /></td>
                                <td bgcolor="#ffffff" class="red-highlight" width="40%" valign="top"><webwork:property value="oldViewHtml(.)" escape="'false'" /></td>
                                <td bgcolor="#ffffff" class="green-highlight" width="40%" valign="top">&nbsp;</td>
                            </tr>
                        </webwork:iterator>
                    </table>
                </td>
            </tr>
        </table>
        <ui:component name="'id'" template="hidden.jsp"  theme="'single'" />
        <ui:component name="'guid'" template="hidden.jsp"  theme="'single'" />

        </td></tr>
        </page:applyDecorator>
        </table>
        </webwork:if>

        <webwork:else>
            <page:applyDecorator name="jiraform">

            </page:applyDecorator>
        </webwork:else>
    </td>
</tr>
</table>

</body>
</html>
