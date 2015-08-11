<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.iss.select.issue.security.scheme'"/></title>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'admin.iss.associate.security.scheme.to.project'"/> <webwork:property value="issueSecurityName" /></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.iss.step2'">
                <webwork:param name="'value0'"><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
            </webwork:text></p>
            <font size=1><webwork:text name="'admin.iss.selecting.new.level'"/></font>
        </page:param>

        <page:param name="action">SelectProjectSecuritySchemeStep2.jspa</page:param>
        <page:param name="submitId">associate_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.projects.schemes.associate'"/></page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="cancelURI"><webwork:url page="ViewProject.jspa"><webwork:param name="'pid'" value="projectId"/></webwork:url></page:param>
            <%--if there are no previous Security levels or affected Issues --%>
            <webwork:if test="./originalSecurityLevels/size > 0 && ./totalAffectedIssues/size > 0">
                <tr bgcolor=#fffff0>
                    <td width><b><webwork:text name="'admin.iss.security.levels.for'"/> <webwork:property value="./securityScheme(origSchemeId)/string('name')"/></b></td>
                    <webwork:property value="./securityScheme(newSchemeId)/string('name')">
                    <td><b>
                        <webwork:if test="."><webwork:text name="'admin.iss.security.levels.for'"/> <webwork:property value="."/></webwork:if>
                        <webwork:else>&nbsp;</webwork:else>
                    </b></td>
                    </webwork:property>
                </tr>
                <%--Loop through each of the original schemes levels--%>
                <webwork:property value="./originalSecurityLevels">
                <webwork:iterator value="./keySet">
                    <%--If there are no affected issues for this level then dont bother --%>
                    <webwork:if test="/affectedIssues(.)/size > 0">
                        <tr bgcolor=#ffffff>
                            <%--Show the original level and the number of affected issues--%>
                            <td>
                                <%--This hidden value is used for the action --%>
                                <webwork:property value = "../(.)"/>
                                (<font size=1><webwork:text name="'admin.iss.num.affected.issues'">
                                    <webwork:param name="'value0'"><webwork:property value ="/affectedIssues(.)/size"/></webwork:param>
                                </webwork:text></font>)
                            </td>
                            <td>
                                <%--If the new scheme is set to None then inform that security will be removed--%>
                                <webwork:if test="../newSchemeId == null">
                                    <font color=#cc00000><webwork:text name="'admin.iss.security.will.be.removed'"/><font>
                                </webwork:if>
                                <webwork:else>
                                    <%--Create a select box with teh values of all the levels of the new scheme--%>
                                    <webwork:property value="/newSecurityLevels">
                                    <webwork:if test="./size > 1">
                                    <select name="<webwork:property value="/levelPrefix"/><webwork:property value=".."/>">
                                        <webwork:iterator value="./keySet">
                                            <webwork:if test="../(.)">
                                                <option value="<webwork:property value="." />"><webwork:property value="../(.)" /></option>
                                            </webwork:if>
                                            <webwork:else>
                                                <option><webwork:text name="'common.words.none'"/></option>
                                            </webwork:else>
                                        </webwork:iterator>
                                    </select>
                                    </webwork:if>
                                    <webwork:else>
                                    <font color=#cc00000><webwork:text name="'admin.iss.security.will.be.removed'"/><font>
                                    </webwork:else>
                                    </webwork:property>
                                </webwork:else>
                            </td>
                         </tr>
                     </webwork:if>
                </webwork:iterator>
                </webwork:property>
            </webwork:if>
            <webwork:else>
                <page:param name="columns">1</page:param>
                    <tr bgcolor=#fffff0>
                        <td width><webwork:text name="'admin.iss.no.previous.secured.issues'"/></td>
                    </tr>
            </webwork:else>
        <%--These hidden values are used for the action--%>
        <ui:component name="'projectId'" template="hidden.jsp"/>
        <webwork:if test="newSchemeId != null">
            <ui:component name="'newSchemeId'" template="hidden.jsp"/>
        </webwork:if>
        <webwork:if test="origSchemeId != null">
            <ui:component name="'origSchemeId'" template="hidden.jsp"/>
        </webwork:if>
    </page:applyDecorator>
</body>
</html>
