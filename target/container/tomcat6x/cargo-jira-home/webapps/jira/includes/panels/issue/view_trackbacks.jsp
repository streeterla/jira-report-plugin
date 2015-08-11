<%@ taglib uri="webwork" prefix="webwork" %>

<webwork:if test="applicationProperties/option('jira.option.trackback.receive') == true && trackbacks/size > 0">
<div class="module" id="trackbacksmodule">
    <div class="mod-header">
        <webwork:if test="/hasIssuePermission('delete', /issue) == true">
        <ul class="ops">
            <li><a href="<%=request.getContextPath()%>/secure/ManageTrackbacks.jspa?id=<webwork:property value="id" />" class="icon icon-edit-sml" title="<webwork:text name="'trackback.manage.title'"/>"><span><webwork:text name="'trackback.manage.title'"/></span></a></li>
        </ul>
        </webwork:if>
		<h3><webwork:text name="'common.concepts.trackbacks'"/></h3>
    </div>
	<div class="mod-content">
        <webwork:iterator value="trackbacks">
        <div class="trackback">
            <div class="trackbackheader">
                <img border="0" src="<%=request.getContextPath()%>/images/icons/document_exchange.gif" width=16 height=16 align=absmiddle>
                <span class="trackbacklink"><a href="<webwork:property value="url"/>"><webwork:property value="title"/></a></span>
                <span class="trackbackblogname">(<webwork:property value="blogName"/>)</span>
            </div>
        <webwork:if test="excerpt">
            <div class="trackbackexcerpt"><webwork:property value="excerpt" /></div>
        </webwork:if>
        </div>
        </webwork:iterator>
	</div>
</div>
</webwork:if>
