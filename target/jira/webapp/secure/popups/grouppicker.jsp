<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'grouppicker.title'" /></title>
</head>
<body>
<h3><webwork:text name="'grouppicker.title'" /></h3>
<%@ include file="/includes/js/multipickerutils.jsp" %>

<ul id="params" style="display:none">
    <li id="formName"><webwork:property value="formName"/></li>
    <li id="openElement"><webwork:property value="$element" /></li>
</ul>

<%--d = <webwork:property value="element"/>--%>
<%--FormName = <webwork:property value="formName"/>--%>
<webwork:if test="permission==true">
    <page:applyDecorator name="jiraform">
		<%--	<page:param name="title">UserBrowser</page:param>--%>
		<page:param name="description">
            <webwork:text name="'grouppicker.displayinggroups'" value0="niceStart" value1="niceEnd" value2="groups/size" />
		</page:param>
		<page:param name="width">100%</page:param>
		<page:param name="action">GroupPickerBrowser.jspa</page:param>
		<page:param name="columns">6</page:param>
		<page:param name="autoSelectFirst">false</page:param>
		<script language="JavaScript" type="text/javascript">
			<%= "<!" + "--" %>
			function select(value)
			{
				var openerForm = opener.document.forms[AJS.$.trim(AJS.$("#formName").text())];
				var openerEl = openerForm.elements[AJS.$.trim(AJS.$("#openElement").text())];
				openerEl.value = value;
				window.close();
			}
			<%= "//--" + ">" %>
		</script>
		<webwork:property value="filter">
		<tr bgcolor="#ffffff">
			<td bgcolor="#fffff0" align="right"><b><webwork:text name="'grouppicker.groupsperpage'" />:</b></td>
                <ui:select label="'Groups Per Page'" name="'max'" theme="'single'" list="/maxValues" listKey="'.'" listValue="'.'" >
                    <ui:param name="'headerrow'" value="''" />
                </ui:select>
			<td bgcolor="#fffff0" align="right"><b><webwork:text name="'grouppicker.namecontains'" />:</b></td>
			    <ui:textfield label="'Name Contains'" name="'nameFilter'" size="15" theme="'single'" />
			<td>&nbsp;</td>
			<td>
				<input type="submit" value="<webwork:text name="'userpicker.filter'" />">
				<ui:component name="'formName'" template="hidden.jsp" />
				<ui:component name="'element'" template="hidden.jsp" />
                <ui:component name="'multiSelect'" template="hidden.jsp" />
                <ui:component name="'start'" template="hidden.jsp" />
                <ui:component name="'previouslySelected'" template="hidden.jsp" />
			</td>
		</tr>
		</webwork:property>
    </page:applyDecorator>
    <br>
    <webwork:if test="/multiSelect == true">
        <table width="100%">
            <tr><td align="center">
                <input type="submit" value="<webwork:text name="'common.words.select'"/>" onclick="selectUsers(AJS.$.trim(AJS.$('#openElement').text()))">
            </td></tr>
        <form name="selectorform">
        <tr><td>
    </webwork:if>
    <table bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=100%><tr><td>
    <table  border="0" cellpadding="1" cellspacing="1" width=100%>
        <%-- table header --%>
        <tr bgcolor="#f0f0f0">
            <webwork:if test="multiSelect == true">
                <td width="1%"><input type="checkbox" name="all" onClick="setCheckboxes()"></td>
            </webwork:if>
            <td class="colHeaderLink" style="text-align: left;"><font size=2><b><webwork:text name="'grouppicker.groupname'" /></b></font></td>
        </tr>
        <%-- table body --%>
        <webwork:iterator value="currentPage" status="'status'">

        <div id="groupname_<webwork:property value="@status/index"/>" value="<webwork:property value="name"/>" style="visibility: hidden"/>

        <tr <webwork:if test="@status/even == true">class="rowNormal"</webwork:if><webwork:else>class="rowAlternate"</webwork:else>
                onmouseover="rowHover(this)" <webwork:if test="/multiSelect == false">onclick="select(getElementById('groupname_<webwork:property value="@status/index"/>').getAttribute('value'));"</webwork:if>
                title="<webwork:text name="'picker.click.to.select'"><webwork:param name="'value0'"><webwork:property value="name"/></webwork:param></webwork:text>"
        >
            <webwork:if test="/multiSelect == true">
                <td valign="top"><input <webwork:if test="wasPreviouslySelected(.) == true"> checked="checked"</webwork:if> type=checkbox name="userchecks" value="<webwork:property value="."/>" id="group_<webwork:property value="@status/index"/>" onclick="processCBClick(event, this);"></td>
                <td valign="top" style="text-align: left;" onclick="toggleCheckBox(event, 'group_<webwork:property value="@status/index"/>')"><font size="2"><webwork:property value="name"/></font></td>
            </webwork:if>
            <webwork:else>
                <td valign="top" style="text-align: left;"><font size="2"><webwork:property value="name"/> </font></td>
            </webwork:else>
        </tr>
        </webwork:iterator>
    </table>
    </td></tr></table>
    <webwork:if test="/multiSelect == true">
        </form>
        <tr><td align="center"><input type="submit" value="<webwork:text name="'common.words.select'"/>" onclick="selectUsers(AJS.$.trim(AJS.$('#openElement').text()))"></td></tr>
        </table>
    </webwork:if>

    <jsp:include page="userpicker_navigation.jsp"/>
</webwork:if>
<webwork:else>
    <webwork:text name="'userpicker.nopermissions'" />
</webwork:else>
</body>
</html>


