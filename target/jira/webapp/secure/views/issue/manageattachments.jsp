<%@ page import="com.atlassian.jira.web.util.CookieUtils"%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<webwork:bean name="'com.atlassian.core.user.UserUtils'" id="userUtils" />
<% request.setAttribute("contextPath", request.getContextPath()); %>
<html>
<head>
    <meta content="issuesummary" name="decorator" />
    <title>[#<webwork:property value="/issueObject/key" />] <webwork:property value="/issueObject/summary" /></title>
</head>
<body>
<jsp:include page="/includes/errormessages.jsp" />
<div class="item-header">
    <webwork:property value="issue">
        <jsp:include page="/includes/panels/issue_headertable.jsp" />
    </webwork:property>
</div>
<div id="main-content">
    <div class="active-area">
        <webwork:if test="/attachable == true || /screenshotAttachable == true">
            <div class="command-bar">
                <div class="ops-cont">
                    <ul class="ops">
                        <li id="back-lnk-section" class="last">
                            <a id="back-lnk" class="button first last" href="<%= request.getContextPath() %>/browse/<webwork:property value="/issueObject/key" />"><span class="icon icon-back"><span><webwork:text name="'opsbar.back.to.issue'"/></span></span><webwork:text name="'opsbar.back.to.issue'"/></a>
                        </li>
                    </ul>
                    <ul class="ops">
                        <webwork:if test="/attachable == true">
                            <li><a id="attach-more-files-link" class="button first<webwork:if test="/screenshotAttachable == false"> last</webwork:if>" href="<webwork:url page="AttachFile!default.jspa"><webwork:param name="'id'" value="/issueObject/id" /><webwork:param name="'returnUrl'" value="'ManageAttachments.jspa?id=' + /issueObject/id" /></webwork:url>"><webwork:text name="'manageattachments.attach.more.files'"/></a></li>
                            <webwork:if test="/zipSupport == true">
                                <li><a id="aszipbutton" class="button" href="<webwork:property value="@contextPath"/>/secure/attachmentzip/<webwork:property value="/issueObject/id"/>.zip" title="<webwork:text name="'common.concepts.attachments.as.a.zip'"/>"><webwork:text name="'common.concepts.attachments.as.a.zip.short'"/></a></li>
                            </webwork:if>
                        </webwork:if>

                        <webwork:if test="/screenshotAttachable == true">
                            <li>
                                <a class="button<webwork:if test="/attachable == false"> first</webwork:if> last" href="<webwork:url value="'AttachFile!screenshot.jspa'" >
                                    <webwork:param name="'id'" value="/issueObject/id" />
                                    <%
                                        String sessionId = CookieUtils.getSingleSessionId(request.getCookies());
                                        if (sessionId != null) {
                                    %>
                                        <webwork:param name="'sessionId'"><%= sessionId %></webwork:param>
                                    <%
                                        }
                                    %>
                                    </webwork:url>" onclick="window.open(this.href, 'screenshot', 'width=800,height=700,scrollbars=yes,status=yes'); return false;">
                                    <webwork:text name="'manageattachments.attach.another.screenshot'"/>
                                </a>
                            </li>
                        </webwork:if>
                    </ul>
                </div>
            </div>
        </webwork:if>
        <h2><webwork:text name="'manageattachments.title'"/></h2>
        <div class="content">
            <div class="module" id="issue-attachments-table">
                <div class="mod-content">
                    <p><webwork:text name="'manageattachments.description'"/></p>
                    <webwork:property value="/issueObject">
                        <webwork:if test="attachments != null && attachments/empty == false">
                            <table class="typeA" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>
                                            &nbsp;
                                        </th>
                                        <th>
                                            &nbsp;
                                        </th>
                                        <th>
                                            <webwork:text name="'manageattachments.file.name'"/>
                                        </th>
                                        <th>
                                            <webwork:text name="'manageattachments.size'"/>
                                        </th>
                                        <th>
                                            <webwork:text name="'manageattachments.mime.type'"/>
                                        </th>
                                        <th>
                                            <webwork:text name="'manageattachments.date.attached'"/>
                                        </th>
                                        <th>
                                            <webwork:text name="'manageattachments.author'"/>
                                        </th>
                                        <th>
                                            &nbsp;
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <webwork:bean name="'com.atlassian.core.util.FileSize'" id="sizeFormatter" />
                                    <webwork:iterator value="attachments" status="'status'">
                                    <tr<webwork:if test="@status/odd == false"> class="alt"</webwork:if>>
                                        <td><webwork:property value="@status/count"/></td>
                                        <td><%@ include file="/includes/icons/attachment.jsp" %></td>
                                        <td><a href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="id" />/<webwork:property value="urlEncoded(filename)" />"><webwork:property value="filename" /></a></td>
                                        <td><webwork:property value="@sizeFormatter/format(filesize)"/></td>
                                        <td><webwork:property value="mimetype"/></td>
                                        <td><webwork:property value="/outlookDate/formatDMYHMS(created)"/></td>
                                        <td><webwork:if test="@userUtils/existsUser(author) == true"><webwork:property value="@userUtils/user(author)/fullName"/></webwork:if><webwork:else><span title="<webwork:text name="'admin.viewuser.user.does.not.exist.title'" />"><webwork:property value="author"/></span></webwork:else></td>
                                        <td class="icon">
                                            <webwork:if test="/hasDeleteAttachmentPermission(./id) == true"> <a href="<webwork:url page="DeleteAttachment!default.jspa"><webwork:param name="'id'" value="/issueObject/id" /><webwork:param name="'deleteAttachmentId'" value="./id" /></webwork:url>" id="del_<webwork:property value="./id" />" class="icon icon-delete"><span><webwork:text name="'common.words.delete'"/></span></a></webwork:if>
                                        </td>
                                    </tr>
                                    </webwork:iterator>
                                </tbody>
                            </table>
                        </webwork:if>
                        <webwork:else>
                            <div class="notify info"><webwork:text name="'manageattachments.no.attachments.notification'"/></div>
                        </webwork:else>
                    </webwork:property>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
