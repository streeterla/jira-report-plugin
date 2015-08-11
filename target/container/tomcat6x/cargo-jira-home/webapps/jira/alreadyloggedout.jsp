<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><ww:text name="'xsrf.logout.error.title'"/></title>
</head>
<body>

<div class="module xsrf">
    <h2><ww:text name="'xsrf.logout.error.long.title'"/></h2>

    <p class="notify info" >
        <ww:text name="'xsrf.logout.info'"/>
    </p>
    <p>
        <strong><ww:text name="'xsrf.info.admin.1'"/></strong>
        <ww:text name="'xsrf.info.admin.2'">
            <ww:param name="'value0'"><a href="<ww:property value="@helpUtil/helpPath('xsrf')/url"/>"></ww:param>
            <ww:param name="'value1'"></a></ww:param>
        </ww:text>
    </p>
</div>
</body>
</html>