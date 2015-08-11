<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="(applicationProperties/option('jira.option.issuelinking') == true && linkCollection/displayLinkPanel == true)">
<div class="module" id="linkingmodule">
    <div class="mod-header">
        <webwork:if test="/linkable == true">
        <ul class="ops">
            <li><a id="manage-links-link" href="<%=request.getContextPath()%>/secure/ManageLinks.jspa?id=<webwork:property value="id" />" class="icon icon-view" title="<webwork:text name="'viewissue.links.view.more.details'"/>"><span><webwork:text name="'viewissue.links.view.more.details'"/></span></a></li>
            <li><a id="add-links-link" href="<webwork:url page="/secure/LinkExistingIssue!default.jspa"><webwork:param name="'id'" value="../long('id')" /></webwork:url>" class="icon icon-add16" title="<webwork:text name="'viewissue.links.addlink'"/>"><span><webwork:text name="'viewissue.links.addlink'"/></span></a></li>
        </ul>
        </webwork:if>
        <webwork:if test="/linkable == true">
            <h3><a id="manage-links-header-link" href="<%=request.getContextPath()%>/secure/ManageLinks.jspa?id=<webwork:property value="id" />" title="<webwork:text name="'viewissue.links.view.more.details'"/>"><webwork:text name="'common.concepts.issuelinks'"/></a></h3>
        </webwork:if>
        <webwork:else>
            <h3><webwork:text name="'common.concepts.issuelinks'"/></h3>
        </webwork:else>
    </div>
	<div class="mod-content">
        <div class="view-links-wrap">
        <webwork:iterator value="linkCollection/linkTypes" status="'itLinkTypeStatus'">
            <webwork:if test="/linkCollection/outwardIssues(./name)/empty == false || /linkCollection/inwardIssues(./name)/empty == false">
            <table class="issue-links<webwork:if test="@itLinkTypeStatus/last == true"> last</webwork:if>" cellpadding="0" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th colspan="2"><webwork:property value="./name" /></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="50%">
                            <div class="link-wrap">
                                <jsp:include page="/includes/panels/issue/linking/outward.jsp" />
                            </div>
                        </td>
                        <td width="50%">
                            <jsp:include page="/includes/panels/issue/linking/inward.jsp" />
                        </td>
                    </tr>
                </tbody>
            </table>
            </webwork:if>
        </webwork:iterator>
            </div>
    </div>
</div>
</webwork:if>
