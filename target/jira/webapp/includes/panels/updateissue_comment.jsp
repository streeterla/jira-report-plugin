<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<webwork:if test="/issueExists == true && hasIssuePermission('comment', /issue) == true">

    <tr class="form-comment-header"><td colspan="2">
        <b><webwork:text name="'comment.update.title'"/></b>: (<webwork:text name="'comment.update.desc'"/>)
    </td></tr>

    <webwork:property value="/fieldScreenRendererLayoutItemForField(/field('comment'))/fieldLayoutItem/orderableField/editHtml(/fieldScreenRendererLayoutItemForField(/field('comment'))/fieldLayoutItem, /, /, /issueObject, null)" escape="'false'" />
</webwork:if>