<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.listeners.listeners'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.listeners.listeners'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">listeners</page:param>
    <page:param name="description"><webwork:text name="'admin.listeners.description'"/>
        <p>
        <webwork:text name="'admin.listeners.some.listeners.are.internal'"/>
    </page:param>
</page:applyDecorator>

<p>

<table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="90%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width=100%>
	<tr bgcolor="#f0f0f0">
		<th>
			<b><webwork:text name="'admin.common.phrases.name.class'"/></b>
		</th>
		<th>
			<b><webwork:text name="'admin.common.words.properties'"/></b>
		</th>
		<th>
			<b><webwork:text name="'common.words.operations'"/></b>
		</th>
	</tr>

	<webwork:iterator value="listeners" status="'status'">
    <tr bgcolor="#<webwork:if test="@status/odd == true">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
		<td valign=top>
            <webwork:if test="listenerImplementation(.)/internal == true"><span class="hiddenField">
                <b><webwork:property value="string('name')"/></b> <font size=1>(<webwork:text name="'admin.listeners.internal'"/>)</font><br>
                <font size=1><webwork:property value="string('clazz')"/></font></span>
            </webwork:if>
            <webwork:else>
                <b><webwork:property value="string('name')"/></b><br>
                <font size=1><webwork:property value="string('clazz')"/></font>
            </webwork:else>
        </td>
		<td valign=top>

			<webwork:property value="propertySet(.)/keys('',5)">
			<table cellpadding=2 cellspacing=0 border=0>
				<webwork:if test=". != null">
					<webwork:iterator value=".">
						<tr>
							<td><b><webwork:property value="." /></b></td>
							<td><webwork:property value="propertySet(../..)/string(.)"/></td>
						</tr>
					</webwork:iterator>
				</webwork:if>
			</table>
			</webwork:property>
		</td>
		<td valign=top>
            <webwork:if test="/listenerEditable(.) == true">
			<a href="<webwork:url page=" EditListener!default.jspa"><webwork:param name="'id'" value="long('id')"/></webwork:url>"><webwork:text name="'common.words.edit'"/></a>
            </webwork:if>
            <webwork:if test="/listenerEditable(.) == true && /listenerDeletable(.) == true">
            |
            </webwork:if>
            <webwork:if test="/listenerDeletable(.) == true">
            <a href="<webwork:url page="ViewListeners!delete.jspa"><webwork:param name="'delete'" value="long('id')"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
            </webwork:if>
		</td>
	</tr>
	</webwork:iterator>
</table>
</td></tr></table>

<p>
<script type="text/javascript">
  function showListeners() {
        var listenersDiv = document.getElementById("builtinListeners");
        var listenersArrow = document.getElementById("builtinListenersArrow");
        if (listenersDiv.style.display == 'none') {
          listenersDiv.style.display = '';
          listenersArrow.src='<%= request.getContextPath() %>/images/icons/navigate_down.gif';
        } else {
          listenersDiv.style.display='none';
          listenersArrow.src='<%= request.getContextPath() %>/images/icons/navigate_right.gif';
        }
  }
  function setListener(clazz) {
        var classField = document.getElementById("listenerClass");
        var nameField = document.getElementById("listenerName");
        classField.value = clazz;
        nameField.focus();
  }
</script>

<page:applyDecorator name="jiraform">
	<page:param name="action">ViewListeners.jspa</page:param>
	<page:param name="submitId">add_submit</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
	<page:param name="width">100%</page:param>
	<page:param name="title"><webwork:text name="'admin.listeners.add.listener'"/></page:param>
	<page:param name="helpURL">listeners</page:param>
<%--	<page:param name="helpDescription">with Listeners</page:param>--%>
	<page:param name="description">
  <webwork:text name="'admin.listeners.add.instruction'"/></page:param>

	<ui:textfield label="text('common.words.name')" name="'name'" size="'30'">
        <ui:param name="'cssId'">listenerName</ui:param>
    </ui:textfield>
	<ui:textfield label="text('admin.listeners.class')" name="'clazz'" size="'60'">
        <ui:param name="'cssId'">listenerClass</ui:param>
        <ui:param name="'description'">

        <img id="builtinListenersArrow" src="<%= request.getContextPath() %>/images/icons/navigate_right.gif" width="8" height="8" border="0" alt="">
        <a href="#"  onclick="showListeners(); return false;"><webwork:text name="'admin.listeners.built.in.listeners'"/></a>

              <div id="builtinListeners" style="font-size: 90%; display: none">
                  <ul>
                      <li> <a href="#" onclick="setListener('com.atlassian.jira.event.listeners.mail.DebugMailListener');"><webwork:text name="'admin.listeners.debug.maillistener'"/></a> </li>
                      <li> <a href="#" onclick="setListener('com.atlassian.jira.event.listeners.DebugListener');"><webwork:text name="'admin.listeners.print.events.to.sout'"/> </a> </li>
                      <li> <a href="#" onclick="setListener('com.atlassian.jira.event.listeners.DebugParamListener');"><webwork:text name="'admin.listeners.print.events.to.sout.with.params'"/></a> </li>
                  </ul>
              </div>
        </ui:param>
    </ui:textfield>

</page:applyDecorator>
</p>

</body>
</html>
