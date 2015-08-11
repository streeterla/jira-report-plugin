<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.currentusers.title'"/></title>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.currentusers.title'"/></page:param>
    <page:param name="description">
        <p><webwork:text name="'admin.currentusers.desc'"/></p>
        <p><webwork:text name="'admin.currentusers.current.server.time'">
            <webwork:param value="/serverTime"/>
        </webwork:text></p>

    </page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">currentusers</page:param>
    <page:param name="helpURLFragment">#CurrentUsers</page:param>
    <div>
        <jsp:include page="currentuserslistnav.jsp"/>
        <hr/>
        <table class="grid centered maxWidth">
            <thead>
            <tr>
                <th><webwork:text name="'common.words.sessionid'"/></th>
                <th><webwork:text name="'common.words.user'"/></th>
                <th><webwork:text name="'common.words.type'"/></th>
                <th><webwork:text name="'common.words.ipaddress'"/></th>
                <th><webwork:text name="'common.words.requests'"/></th>
                <th><webwork:text name="'common.words.lastaccessed'"/></th>
                <th><webwork:text name="'admin.currentusers.creation'"/></th>
            </tr>
            </thead>
            <tbody>
            <webwork:iterator value="/pager/list" status="'status'">
                <tr class="<webwork:if test="@status/odd == true">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else>">
                    <td>
                        <webwork:property value="./ASessionId"/>
                    </td>
                    <td>
                        <webwork:if test="./validUser == true">
                            <a href="<webwork:url page="secure/ViewProfile.jspa"><webwork:param name="'name'" value="./userName"/></webwork:url>"><webwork:property value="./userName"/></a>
                        </webwork:if>
                        <webwork:else>
                            <webwork:property value="./userName"/>
                        </webwork:else>
                    </td>
                    <td>
                        <webwork:property value="./type"/>
                    </td>
                    <td>
                        <webwork:property value="./ipAddress"/>
                    </td>
                    <td align="right">
                        <webwork:property value="./requestCount"/>
                    </td>
                    <td>
                        <webwork:property value="./lastAccessTime"/>
                    </td>
                    <td>
                        <webwork:property value="./creationTime"/>
                    </td>
                </tr>
            </webwork:iterator>
            </tbody>
        </table>
        <hr/>
        <jsp:include page="currentuserslistnav.jsp"/>
    </div>
</page:applyDecorator>
</body>
</html>
