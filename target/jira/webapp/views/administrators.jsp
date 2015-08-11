<%@ taglib uri="webwork" prefix="webwork" %>

<html>
	<head>
		<title><webwork:text name="'administrators.title'"/></title>
	</head>
	<body>
	<div id="administrators">
    <webwork:if test="/administrators/empty == false">
        <h2><webwork:text name="'administrators.title'"/></h2>
        <p>
        <webwork:text name="'administrators.line1'"/>
        </p>

        <p>
        <webwork:text name="'administrators.line2'"/>
        </p>

        <ul id="adminlist">
        <webwork:iterator value="/administrators">
            <li>
            <webwork:if test="/adminEmail(.)">
                <a id='<webwork:property value="./name"/>' href="mailto:<webwork:property value="adminEmail(.)" />"><webwork:property value="fullName" /></a>
            </webwork:if>
            <webwork:else>
                <webwork:property value="./fullName" />
            </webwork:else>
            </li>
        </webwork:iterator>
        </ul>
    </webwork:if>
    <h2><webwork:text name="'system.administrators.title'"/></h2>
    <p>
    <webwork:text name="'system.administrators.line1'"/>
    </p>

    <p>
    <webwork:text name="'system.administrators.line2'"/>
    </p>

    <ul id="sysadminlist" >
    <webwork:iterator value="/systemAdministrators">
        <li>
        <webwork:if test="/adminEmail(.)">
            <a id='<webwork:property value="./name"/>' href="mailto:<webwork:property value="adminEmail(.)" />"><webwork:property value="fullName" /></a>
        </webwork:if>
        <webwork:else>
            <webwork:property value="./fullName" />
        </webwork:else>
        </li>
    </webwork:iterator>
    </ul>
    </div>
	</body>
</html>
