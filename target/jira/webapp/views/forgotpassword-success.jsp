<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'forgotlogindetails.title'"/></title>
</head>

<body class="lp">

<div class="notify info">
    <p>
        <webwork:text name="'forgotpassword.success.line1'"/>
    </p>

    <p>
        <webwork:text name="'forgotpassword.success.line2'"/>
    </p>

    <p>
        <webwork:text name="'forgotpassword.success.line3'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
    </p>
</div>

</body>
</html>
