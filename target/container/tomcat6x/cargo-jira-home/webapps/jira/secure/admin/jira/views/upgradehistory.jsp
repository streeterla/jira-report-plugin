<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:bean id="math" name="'com.atlassian.core.bean.MathBean'"/>

<html>
<head>
	<title><webwork:text name="'admin.systeminfo.upgrade.history'"/></title>
</head>

<body>

<table class="jiraform maxWidth">

    <tr>
        <td class="jiraformheader">
            <h3 class="formtitle"><webwork:text name="'admin.systeminfo.upgrade.history'"/></h3>
        </td>
    </tr>
    <tr>
        <td class="jiraformbody"><p><webwork:text name="'admin.systeminfo.upgrade.history.description'"/></p></td>
    </tr>
</table>
<p></p>
<table id="upgradehistory" class="grid maxWidth">
    <tr>
        <th width="33%"><webwork:text name="'admin.systeminfo.upgrade.history.target.version'"/></th>
        <th width="33%"><webwork:text name="'admin.systeminfo.upgrade.history.target.build'"/></th>
        <th width="33%"><webwork:text name="'admin.systeminfo.upgrade.history.time.performed'"/></th>
    </tr>
    <webwork:iterator value="/upgradeHistory" status="'status'">
    <tr>
        <td valign="top"><webwork:property value="./targetVersion"/></td>
        <td valign="top"><webwork:property value="./targetBuildNumber"/>
        <webwork:if test="./inferred == true">
            <webwork:if test="./originalBuildNumber/equals(./targetBuildNumber) == false">
                <webwork:text name="'admin.systeminfo.upgrade.history.inferred.from'"><webwork:param name="'value0'"><webwork:property value="./originalBuildNumber"/></webwork:param></webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.systeminfo.upgrade.history.inferred'"/>
            </webwork:else>
        </webwork:if>
        </td>
        <td valign="top"><webwork:property value="/formattedTimePerformed(./timePerformed)"/></td>
    </tr>
    </webwork:iterator>
</table>

</body>
</html>
