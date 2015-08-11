
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.mailservers.configure'"/></title>
</head>

<body>

    <p>
    <table width="100%" cellpadding=10 cellspacing=0 border=0>

    <script type="text/javascript">
       function submitReset()
       {
           document.jiraform.action="ProjectEmail!reset.jspa"
           document.jiraform.submit();
           return false;
       }
    </script>

    <page:applyDecorator name="jiraform">
        <page:param name="action">ProjectEmail.jspa</page:param>
        <page:param name="submitId">confirm_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.confirm'"/></page:param>
    	<page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="projectId"/></webwork:url></page:param>
        <page:param name="title"><webwork:text name="'admin.mailservers.configure'"/></page:param>
        <page:param name="description"><webwork:text name="'admin.mailservers.notification.email.description'">
            <webwork:param name="'value0'"><br></webwork:param>
        </webwork:text></page:param>
        <page:param name="buttons"><input type="submit" onclick="submitReset();" value="<webwork:text name="'admin.common.words.reset'"/>"></page:param>

        <ui:textfield label="text('admin.mailservers.sender.address')" name="'fromAddress'">
            <ui:param name="'description'"><webwork:text name="'admin.mailservers.sender.address.description'"/></ui:param>
        </ui:textfield>

        <tr>
            <td colspan=2 bgcolor=#ffffff>&nbsp;</td>
        </tr>
        <ui:component name="'projectId'" value="projectId" template="hidden.jsp" theme="'single'"  />
    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
