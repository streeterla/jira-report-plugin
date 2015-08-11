<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.services.services'"/></title>
</head>

<body>

<jsp:include page="/secure/admin/fixes/pathwarnings.jsp"/>


<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.services.services'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">services</page:param>
</page:applyDecorator>

<p></p>

<table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=95%><tr><td>
<table id="tbl_services" border="0" cellpadding="3" cellspacing="1" width=100%>
	<tr bgcolor=#f0f0f0>
		<td class="colHeaderLink" width="30%">
			<b><webwork:text name="'admin.common.phrases.name.class'"/></b>
		</td>
		<td class="colHeaderLink" width="50%">
			<b><webwork:text name="'admin.common.words.properties'"/></b>
		</td>
        <td class="colHeaderLink" width="15%">
			<b><webwork:text name="'admin.services.delay.mins'"/></b>
		</td>
		<td class="colHeaderLink" width="5%">
			<b><webwork:text name="'common.words.operations'"/></b>
		</td>
	</tr>

	<webwork:iterator value="services" status="'status'">
    <tr <webwork:if test="./usable == false">class="disabled"</webwork:if> bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
		<td valign=top>
            <b><webwork:property value="./name"/></b><br>
    		<font size=1><webwork:property value="./serviceClass"/></font>
        </td>
		<td valign=top>
        <%-- get the property set for this service, and then get all the keys where the propertyset is of type String ('5') --%>
			<table cellpadding=2 cellspacing=0 border=0>
                <webwork:iterator value="/propertyMap(.)/keySet">
                    <tr><td><b><webwork:property value="." />:</b></td><td><webwork:property value="/text(/propertyMap(..)/(.))" /></td></tr>
                </webwork:iterator>
			</table>
		</td>
        <td valign=top><webwork:property value="delayInMins(.)"/></td>
		<td valign=top <webwork:if test="./usable == false">class="disabled"</webwork:if>>
            <webwork:if test="./usable == true">
                <a id="edit_<webwork:property value="id"/>" href="<webwork:url page="EditService!default.jspa"><webwork:param name="'id'" value="id"/></webwork:url>"><webwork:text name="'common.words.edit'"/></a><br>
                <webwork:if test="./internal == false">
                    <a id="del_<webwork:property value="id"/>" href="<webwork:url page="ViewServices.jspa"><webwork:param name="'delete'" value="id"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
                </webwork:if>
            </webwork:if>
            <webwork:else>
                <a id="del_<webwork:property value="id"/>" href="<webwork:url page="ViewServices.jspa"><webwork:param name="'delete'" value="id"/></webwork:url>"><webwork:text name="'common.words.delete'"/></a>
            </webwork:else>
		</td>
	</tr>
	</webwork:iterator>
</table>
</td></tr></table>

<p>
<script type="text/javascript">
  function showServices() {
        var servicesDiv = document.getElementById("builtinServices");
        var servicesArrow = document.getElementById("builtinServicesArrow");
        if (servicesDiv.style.display == 'none') {
          servicesDiv.style.display = '';
          servicesArrow.src='<%= request.getContextPath() %>/images/icons/navigate_down.gif';
        } else {
          servicesDiv.style.display='none';
          servicesArrow.src='<%= request.getContextPath() %>/images/icons/navigate_right.gif';
        }
  }
  function setService(clazz) {
        var classField = document.getElementById("serviceClass");
        var nameField = document.getElementById("serviceName");
        classField.value = clazz;
        nameField.focus();
  }
</script>

<page:applyDecorator name="jiraform">
	<page:param name="action">ViewServices.jspa</page:param>
	<page:param name="submitId">addservice_submit</page:param>
	<page:param name="submitName"><webwork:text name="'admin.services.add.service'"/></page:param>
	<page:param name="title"><webwork:text name="'admin.services.add.service'"/></page:param>
	<page:param name="width">100%</page:param>
    <page:param name="helpURL">services</page:param>
    <page:param name="helpURLFragment">#Registering+a+Service</page:param>
<%--	<page:param name="helpDescription">with Services</page:param>--%>
	<page:param name="description"><webwork:text name="'admin.services.add.service.instruction'"/></page:param>

	<ui:textfield label="text('common.words.name')" name="'name'" size="'30'">
        <ui:param name="'cssId'">serviceName</ui:param>
    </ui:textfield>

	<ui:textfield label="text('admin.services.class')" name="'clazz'" size="'60'">
        <ui:param name="'cssId'">serviceClass</ui:param>
        <ui:param name="'description'">

        <img id="builtinServicesArrow" src="<%= request.getContextPath() %>/images/icons/navigate_right.gif" width=8 height=8 border=0>
        <a href="#"  onclick="showServices(); return false;"><webwork:text name="'admin.services.built.in.services'"/></a>

              <div id="builtinServices" style="font-size: 90%; display: none">
                  <ul>
                      <li> <a href="#" onclick="setService('com.atlassian.jira.service.services.export.ExportService');"><webwork:text name="'admin.services.backup.service'"/></a> </li>
                      <li> <a href="#" onclick="setService('com.atlassian.jira.service.services.pop.PopService');"><webwork:text name="'admin.services.create.issues.from.pop'"/></a> </li>
                      <li> <a href="#" onclick="setService('com.atlassian.jira.service.services.imap.ImapService');"><webwork:text name="'admin.services.create.issues.from.imap'"/></a> </li>
                      <li> <a href="#" onclick="setService('com.atlassian.jira.service.services.file.FileService');"><webwork:text name="'admin.services.create.issues.from.local.files'"/></a> </li>
                      <li> <a href="#" onclick="setService('com.atlassian.jira.jelly.service.JellyService');"><webwork:text name="'admin.services.jelly.service'"/></a> </li>
                      <li> <a href="#" onclick="setService('com.atlassian.jira.service.services.DebugService');"><webwork:text name="'admin.services.debugging.service'"/></a> </li>
                  </ul>
              </div>

        </ui:param>
    </ui:textfield>
	<ui:textfield label="text('admin.services.delay')" name="'delay'" size="'30'">
        <ui:param name="'description'"><webwork:text name="'admin.services.delay.description'"/></ui:param>
    </ui:textfield>
</page:applyDecorator>
</p>

</body>
</html>
