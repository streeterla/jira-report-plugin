<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:property value="/title"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="buttons">
        <input id="backButton" type="button" accesskey="<webwork:text name="'common.forms.cancel.accesskey'" />"
               title="<webwork:property value="text('admin.common.words.back')"/> (Alt + <webwork:text name="'common.forms.cancel.accesskey'" />)"
               name="backButton"
               value="<webwork:property value="text('admin.common.words.back')"/>"
               onclick="location.href='<%= request.getContextPath() %>/secure/admin/ProjectImportSummary!default.jspa'" />
    </page:param>
    <page:param name="title"><webwork:property value="/title"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">restore_project</page:param>
    <page:param name="description">
        <webwork:property value="/description" escape="false"/>
        <webwork:property value="/userCountLimitMessage" escape="false"/>
        <p/>
            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0 align=absmiddle> <a href='<webwork:property value="/actionName" />!xmlExport.jspa'><webwork:text name="'admin.project.import.users.xml.export'"/></a>
        <p/>
    </page:param>

    <table id="usersdonotexist" class="grid defaultWidth centered">
        <thead>
            <tr>
                <th><webwork:text name="'common.words.username'"/></th>
                <th><webwork:text name="'common.words.fullname'"/></th>
                <th><webwork:text name="'common.words.email'"/></th>
            </tr>
        </thead>
        <tbody>
            <webwork:iterator value="/limitedUsers">
                <tr>
                    <td><webwork:property value="./name"/><br/></td>
                    <td><webwork:property value="./fullname"/><br/></td>
                    <td><webwork:property value="./email"/><br/></td>
                </tr>
            </webwork:iterator>
        </tbody>
    </table>

</page:applyDecorator>

</body>
</html>
