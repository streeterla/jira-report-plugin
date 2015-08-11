<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'resetpassword.title'"/></title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'resetpassword.title'"/></page:param>
    <page:param name="width">100%</page:param>

    <page:param name="description">
        <webwork:if test="/remoteUser == null">
            <webwork:text name="'resetpassword.well.done.not.logged.in'">
                <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/login.jsp"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'resetpassword.well.done.logged.in'">
                <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </webwork:else>
    </page:param>
</page:applyDecorator>
</body>
</html>
