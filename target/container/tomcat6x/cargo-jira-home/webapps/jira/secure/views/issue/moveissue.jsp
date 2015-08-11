
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="iterator" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'moveissue.title'"/>: <webwork:if test="/issueValid == 'true'"><webwork:property value="issue/string('key')" /></webwork:if></title>
</head>

<body>

<table cellpadding=0 cellspacing=0 border=0 width=100%>
<tr>
<td width=200 bgcolor="#f0f0f0" valign=top>
    <jsp:include page="/secure/views/issue/moveissuepane.jsp" flush="false" />
</td>
<td bgcolor=#ffffff valign=top>
<table width="100%" cellpadding=10 cellspacing=0 border=0><tr><td>

<webwork:if test="/issueValid == true && allowedProjects/empty == false">
    <webwork:if test="subTask == false">
        <page:applyDecorator name="jiraform">
            <page:param name="title"><webwork:text name="'moveissue.title'"/>: <webwork:property value="issue/string('key')" /></page:param>
            <page:param name="description">
                <webwork:if test="enterprise == true">
                    <webwork:text name="'moveissue.chooseproject.desc.ent'"/>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'moveissue.chooseproject.desc.pro'"/>
                </webwork:else>
            </page:param>
            <page:param name="columns">1</page:param>
            <page:param name="width">100%</page:param>
            <page:param name="action">MoveIssue.jspa</page:param>
            <page:param name="autoSelectFirst">false</page:param>
            <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
		    <page:param name="submitId">next_submit</page:param>
            <page:param name="submitName"><webwork:property value="text('common.forms.next')"/> &gt;&gt;</page:param>

            <tr><td bgcolor="#ffffff">
                <table width="75%" align="absmiddle" class="centred"><tr><td>
                <div width="80%" style="border: 1px solid #bbbbbb;padding: 2px;">
                    <table width="100%">
                        <tr bgcolor="#f0f0f0">
                            <td bgcolor="#f0f0f0" colspan="5" align="left"><b><webwork:text name="'moveissue.selectproject'"/></b></td>
                        </tr>
                        <tr>
                            <%-- Select Project --%>
                            <td align="absmiddle" width="20%" nowrap><b><webwork:text name="'moveissue.currentproject'"/></b>:</td>
                            <td align="absmiddle" nowrap>
                                <webwork:property value="project/string('name')"/>
                            </td>
                            <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
                            <%-- Target Project --%>
                            <td align="absmiddle" width="20%" nowrap><b><webwork:text name="'moveissue.newproject'"/></b>:</td>
                            <webwork:property value="/fieldHtml('project')" escape="'false'" />
                        </tr>
                        <tr>
                            <tr bgcolor="#f0f0f0">
                                <td bgcolor="#f0f0f0" colspan="5" align="left"><b><webwork:text name="'moveissue.selectissuetype'"/></b></td>
                            </tr>
                            <%-- Select Issue Type --%>
                            <td align="absmiddle" width="20%" nowrap><b><webwork:text name="'moveissue.currentissuetype'"/></b>:</td>
                            <td align="absmiddle" nowrap>
                                <webwork:property value="./constantsManager/issueType(currentIssueType)/string('name')"/>
                            </td>
                            <td align="absmiddle" nowrap><img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif" height=16 width=16 border=0 align=absmiddle></td>
                            <%-- Target Issue Type --%>
                            <td align="absmiddle" width="20%" nowrap><b><webwork:text name="'moveissue.newissuetype'"/></b>:</td>

                            <webwork:property value="/fieldHtml('issuetype')" escape="'false'" />
                        </tr>
                    </table>
                    </div>
                </td></tr>

            <ui:component name="'id'" template="hidden.jsp"  theme="'single'" />
        </page:applyDecorator>
    </webwork:if>
    <webwork:else>
        <%-- Sub Tasks cannot be moved - must move parent issue --%>
        <page:applyDecorator name="jiraform">
            <page:param name="title"><webwork:text name="'moveissue.title'"/></page:param>
            <page:param name="description">
                <span class="warning"><webwork:text name="'moveissue.subtask.cannot.move'"/></span>
            </page:param>
            <page:param name="width">100%</page:param>
            <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>

            <ui:component name="'id'" template="hidden.jsp"  theme="'single'" />
        </page:applyDecorator>
    </webwork:else>
</webwork:if>
<webwork:else>
	<page:applyDecorator name="jiraform">
		<page:param name="description">
            <webwork:if test="enterprise == true">
                <webwork:text name="'moveissue.chooseproject.desc.ent'"/>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'moveissue.chooseproject.desc.pro'"/>
            </webwork:else>
        </page:param>
		<%@ include file="/includes/noprojects.jsp" %>
	</page:applyDecorator>
</webwork:else>

    </td></tr></table>

</td></tr></table>
</td></tr></table>

</body>
</html>
