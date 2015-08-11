<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head><title><webwork:text name="'admin.email.send.email'"/></title>
</head>

<body>

<table width="100%" cellpadding="10" cellspacing="0" border="0"><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="action">ViewProjects.jspa</page:param>
        <page:param name="submitId">ok_submit</page:param>
        <page:param name="submitName"> <webwork:text name="'admin.common.words.ok'"/> </page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="title"><webwork:text name="'admin.email.send.email'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="description"><p><webwork:property value="/status" escape="'false'" /></p></page:param>
            <tr><td bgcolor="#ffffff">
                <br>
                <table border="0" class="grid" width="100%">
                    <tr>
                        <th>
                            <b><webwork:text name="'common.words.username'"/></b>
                        </th>
                        <th>
                            <b><webwork:text name="'common.words.email'"/></b>
                        </th>
                        <th>
                            <b><webwork:text name="'common.words.fullname'"/></b>
                        </th>
                    </tr>

                    <webwork:iterator value="users" status="'status'">
                    <tr <webwork:if test="@status/modulus(2) == 0">bgcolor="#fffff0"</webwork:if>
                            <webwork:else>bgcolor="#ffffff"</webwork:else>>
                        <td><a id="<webwork:property value="name"/>" href="<webwork:url page="ViewUser.jspa"><webwork:param name="'name'" value="name"/></webwork:url>"><webwork:property value="name"/></a></td>
                        <td><a href="<webwork:url page="ViewUser.jspa"><webwork:param name="'name'" value="name"/></webwork:url>"><webwork:property value="email"/></a></td>
                        <td><webwork:property value="fullName"/></td>
                    </tr>
                    </webwork:iterator>
                </table>
                <br>
            </td></tr>
    </page:applyDecorator>

</td></tr></table>

</body>
</html>
