<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schemes.issuesecurity.delete.level'"/>:</title>
</head>

<body>
    <page:applyDecorator name="jiraform">
        <page:param name="title"><webwork:text name="'admin.schemes.issuesecurity.delete.level'"/>: <webwork:property value="issueSecurityName" /></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.schemes.issuesecurity.delete.level.confirmation'"/></p>
            <webwork:if test="affectedIssues/size > 0">
                <webwork:text name="'admin.schemes.issuesecurity.delete.issues.currently.set'"/>
            </webwork:if>

            <webwork:if test="default(levelId)== true">
                <p><font color=#cc0000><webwork:text name="'admin.schemes.issuesecurity.delete.level.warning'"/> </font> <p>
            </webwork:if>
        </page:param>

        <page:param name="action">DeleteIssueSecurityLevel.jspa</page:param>
        <page:param name="submitId">delete_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="cancelURI"><webwork:url page="EditIssueSecurities!default.jspa"><webwork:param name="'schemeId'" value="schemeId"/></webwork:url></page:param>
        <webwork:if test="affectedIssues/size > 0">
            <ui:component label="text('admin.schemes.issuesecurity.delete.level.issues.with.this.level')" name="'affectedIssues/size'" template="textlabel.jsp" >
                <ui:param name="'description'">

                    <webwork:iterator value="affectedIssues" >
                        <a href="<%= request.getContextPath() %>/browse/<webwork:property value="string('key')" />"><webwork:property value="string('key')" /></a>
                        <webwork:property value="string('summary')" /> <br>
                    </webwork:iterator>

                </ui:param>
            </ui:component>
            <webwork:if test="otherLevels/size > 0">
                <tr>
                    <td bgcolor=#ffffff>&nbsp;</td>
                    <td bgcolor=#ffffff>
                        <input type="radio" name="affectsAction" value="swap" checked>
                        <webwork:text name="'admin.schemes.issuesecurity.delete.level.swap.to'"/>:
                        <webwork:property value="otherLevels">
                            <select name="swapLevel">
                                <option value=-1><webwork:text name="'common.words.none'"/></option>
                                <webwork:iterator value="./keySet">
                                    <option value="<webwork:property value="." />" >
                                        <webwork:property value="../(.)" />
                                    </option>
                                </webwork:iterator>
                            </select>
                         </webwork:property>
                    </td>
                </tr>
            </webwork:if>
            <webwork:else>
                <tr>
                    <td bgcolor=#ffffff>&nbsp;</td>
                    <td bgcolor=#ffffff>
                        <input type="hidden" name="affectsAction" value="remove">
                        <webwork:text name="'admin.schemes.issuesecurity.delete.level.no.other.levels'"/>
                    </td>
                </tr>
            </webwork:else>
        </webwork:if>

        <input type="hidden" name="schemeId" value="<webwork:property value="schemeId" />">
        <input type="hidden" name="levelId" value="<webwork:property value="levelId" />">
        <input type="hidden" name="confirm" value="true">

    </page:applyDecorator>
</body>
</html>
