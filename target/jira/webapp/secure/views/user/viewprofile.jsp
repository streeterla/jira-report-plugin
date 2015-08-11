<%@ taglib uri="webwork" prefix="webwork" %>
<html>
<head>
    <meta name="decorator" content="general" />
    <title>
        <webwork:text name="'user.profile'"/> : <webwork:property value="user/fullName"/>
    </title>
</head>

<body class="type-aa">
<jsp:include page="profile/viewprofile.jsp" />
</body>
</html>

