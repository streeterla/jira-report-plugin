<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.externalimport.users.do.not.exist.title'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="cancelURI"><%= request.getContextPath() %>/secure/admin/views/ExternalImport.jspa</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.users.do.not.exist.title'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="description">
        <webwork:text name="'admin.externalimport.users.do.not.exist.desc'">
           <webwork:param name="'value0'"><strong></webwork:param>
           <webwork:param name="'value1'"></strong></webwork:param>
           <webwork:param name="'value2'"><p/></webwork:param>
           <webwork:param name="'value3'"><webwork:property value="/unknownUsers/size"/></webwork:param>
        </webwork:text>
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
            <webwork:iterator value="/unknownUsers">
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
