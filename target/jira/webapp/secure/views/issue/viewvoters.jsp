<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <meta content="issuesummary" name="decorator" />
    <title><webwork:text name="'voters.view.title'"/></title>
</head>
<body>
<webwork:if test="/issueValid == true">
    <div class="item-header">
        <webwork:property value="issue">
            <jsp:include page="/includes/panels/issue_headertable.jsp" />
        </webwork:property>
    </div>
    <div id="main-content">
        <div class="active-area">
            <div class="command-bar">
                <div class="ops-cont">
                    <ul class="ops">
                        <li id="back-lnk-section" class="last">
                            <a id="back-lnk" class="button first last" href="<%= request.getContextPath() %>/browse/<webwork:property value="/issueObject/key" />"><span class="icon icon-back"><span><webwork:text name="'opsbar.back.to.issue'"/></span></span><webwork:text name="'opsbar.back.to.issue'"/></a>
                        </li>
                    </ul>
                    <ul class="ops">
                        <webwork:if test="/issue/string('resolution') == null">
                            <webwork:if test="issueReportedByMe == false">
                                <li>
                                    <webwork:if test="votedAlready == true">
                                        <a class="button first last" href="ViewVoters!removeVote.jspa?key=<webwork:property value="/issue/string('key')"/>"><webwork:text name="'voters.vote.remove'" /></a>
                                    </webwork:if>
                                    <webwork:else>
                                        <a class="button first last" href="ViewVoters!addVote.jspa?key=<webwork:property value="/issue/string('key')"/>"><webwork:text name="'voters.vote.add'" /></a>
                                    </webwork:else>
                                </li>
                            </webwork:if>
                            <webwork:else>
                                <li class="info">
                                    <span class="warning"><webwork:text name="'common.words.note'"/></span>: <webwork:text name="'issue.operations.novote'"/>                                    
                                </li>
                            </webwork:else>
                        </webwork:if>
                        <webwork:else>
                            <li class="info">
                                <span class="warning"><webwork:text name="'common.words.note'"/></span>: <webwork:text name="'issue.operations.voting.resolved'"/>                                
                            </li>
                        </webwork:else>
                    </ul>
                </div>
            </div>
            <h2><webwork:text name="'voters.view.title'"/></h2>
            <div class="content">
                <div class="module">
                    <div class="mod-content">
                        <webwork:if test="/votingEnabled == false">
                            <p><span class="warning"><webwork:text name="'voters.voting.disabled'"/>.</span></p>
                        </webwork:if>
                        <%--We know when this is false the Issue doesn't exist and has no voters.
                        All exception handling and error rendering is done by the issuesummary decorator.--%>
                        <webwork:elseIf test="/issueValid == true">
                            <webwork:property value="voters">
                                <webwork:if test=". != null && ./empty == false">
                                    <table class="typeA" cellpadding="0" cellspacing="0" width="100%">
                                        <thead>
                                            <th><webwork:text name="'common.words.fullname'"/> (<webwork:text name="'common.words.username'"/>)</th>
                                        </thead>
                                        <tbody>
                                            <webwork:iterator status="'status'">
                                                <tr<webwork:if test="@status/odd == false"> class="alt"</webwork:if>>
                                                    <td>
                                                        <jira:formatuser user="./name" type="'profileLink'" id="'voter_link'"/> (<webwork:property value="./name" />)
                                                    </td>
                                                </tr>
                                            </webwork:iterator>
                                        </tbody>
                                    </table>
                                </webwork:if>
                                <webwork:else>
                                    <div class="notify info"><webwork:text name="'voters.novoters'"/></div>
                                </webwork:else>
                            </webwork:property>
                        </webwork:elseIf>
                    </div>
                </div>
            </div>
        </div>
    </div>
</webwork:if>
<webwork:else>
    <div class="padded">
        <div class="notify error"><webwork:text name="'issue.wasdeleted'"/></div>
    </div>
</webwork:else>
</body>
</html>
