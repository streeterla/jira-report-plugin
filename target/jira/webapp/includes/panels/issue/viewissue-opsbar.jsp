<%@ page import="com.atlassian.seraph.util.RedirectUtils" %>
<%@ taglib prefix="webwork" uri="webwork" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib prefix="ui" uri="webwork" %>
<webwork:if test="/showOpsBar() == true">
    <div class="command-bar">
        <div class="ops-cont">
            <div class="ops-menus">
                <webwork:if test="/showEdit() == true">
                    <ul id="opsbar-edit" class="first ops">
                        <li class="last">
                            <a id="editIssue" title="<webwork:text name="'admin.issue.operations.plugin.edit.issue.name'"/>" class="button edit first last" href="<%=request.getContextPath()%>/secure/EditIssue!default.jspa?id=<webwork:property value="/issueObject/id" />"><span class="icon butt-edit"><span><webwork:text name="'common.forms.edit'"/> - <webwork:property value="/issueObject/key" /></span></span><webwork:text name="'common.forms.edit'"/></a>
                        </li>
                    </ul>
                </webwork:if>
                <webwork:elseIf test="/showLogin() == true">
                    <ul id="opsbar-login" class="first ops">
                        <li id="ops-login" class="last">
                            <a id="ops-login-lnk" class="button first last" href="<%= RedirectUtils.getLinkLoginURL(request)%>"><webwork:text name="'common.concepts.login'"/></a>
                        </li>
                    </ul>
                </webwork:elseIf>
                <webwork:iterator value="/opsBarUtil/groups" id="group" status="'groupStatus'">
                    <webwork:property value="/opsBarUtil/promotedLinks(.)">
                        <webwork:if test="./empty == false">
                            <ul id="opsbar-<webwork:property value="@group/id"/>" class="ops <webwork:if test="@groupStatus/first = true && /showEdit() == false && /showLogin == false()"> first</webwork:if>">
                                <webwork:iterator value="." status="'status'" id="curLink" >
                                    <li <webwork:if test="@status/last == true && /opsBarUtil/showMoreLinkforGroup(@group) == false">class="last"</webwork:if>>
                                        <a id="<webwork:property value="./id"/>" title="<webwork:property value="/opsBarUtil/titleForLink(.)"/>" class="button <webwork:property value="@group/id"/><webwork:if test="@status/first == true"> first</webwork:if><webwork:if test="@status/last == true && /opsBarUtil/showMoreLinkforGroup(@group) == false"> last</webwork:if>" href="<webwork:property value="./url"/>"><webwork:property value="/opsBarUtil/labelForLink(.)"/></a>
                                    </li>
                                </webwork:iterator>
                                <webwork:property value="/opsBarUtil/nonEmptySectionsForGroup(@group)">
                                    <webwork:if test="./empty == false">
                                        <li class="last">
                                            <div class="aui-dd-parent">
                                                <a id="<webwork:property value="@group/id"/>_more" class="button more last drop" href="#"><webwork:if test="@group/label != null"><webwork:property value="@group/label"/></webwork:if><webwork:else><webwork:text name="'common.concepts.more'"/></webwork:else><span class="icon drop-menu"><span><webwork:text name="'common.concepts.more'"/></span></span></a>
                                                <div class="aui-dropdown standard hidden">
                                                <webwork:iterator value="." id="section" status="'sectionStatus'">
                                                    <ul class="<webwork:if test="@sectionStatus/first == true">first</webwork:if><webwork:if test="@sectionStatus/last == true"> last</webwork:if>">
                                                        <webwork:iterator value="/opsBarUtil/nonPromotedLinksForSection(@group, @section)" id="curLink">
                                                            <li>
                                                                <a id="<webwork:property value="./id"/>" title="<webwork:property value="/opsBarUtil/titleForLink(.)"/>" class="<webwork:property value="@group/id"/>" href="<webwork:property value="./url"/>"><webwork:property value="/opsBarUtil/labelForLink(.)"/></a>
                                                            </li>
                                                        </webwork:iterator>
                                                    </ul>
                                                </webwork:iterator>
                                                </div>
                                            </div>
                                        </li>
                                    </webwork:if>
                                    <webwork:else>
                                        <webwork:if test="@group/label != null">
                                            <li class="last">
                                                <div>
                                                    <span id="<webwork:property value="@group/id"/>_more" class="button disabled more last drop" ><webwork:property value="@group/label"/><span class="icon drop-menu"><span><webwork:text name="'common.concepts.more'"/></span></span></span>
                                                </div>
                                            </li>
                                        </webwork:if>
                                    </webwork:else>
                                </webwork:property>
                            </ul>
                        </webwork:if>
                    </webwork:property>
                </webwork:iterator>
                <webwork:property value="/issueViews">
                    <webwork:if test=".">
                        <ul class="ops" id="view-drop">
                            <li>
                                <div class="aui-dd-parent">
                                    <a href="#" title="<webwork:text name="'admin.issue.views.plugin.tooltip'"/>" class="drop"><span class="icon icon-view"><span><webwork:text name="'admin.issue.views.plugin.tooltip'"/></span></span><webwork:text name="'common.concepts.view'"/><span class="icon drop-menu"><span><webwork:text name="'common.concepts.view'"/></span></span></a>
                                    <div class="aui-dropdown standard hidden">
                                        <ul class="first last">
                                            <webwork:iterator value=".">
                                                <li>
                                                    <a rel="nofollow" href="<%=request.getContextPath()%><webwork:property value="/urlForIssueView(.)"/>"><webwork:property value="./name"/></a>
                                                </li>
                                            </webwork:iterator>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </webwork:if>
                </webwork:property>
            </div>


        </div>
    </div>
</webwork:if>