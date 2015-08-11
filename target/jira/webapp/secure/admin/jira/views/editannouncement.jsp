<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.announcement.edit.announcement.banner'"/></title>
</head>
<body>
    <page:applyDecorator name="jiraform">
        <page:param name="action">EditAnnouncementBanner.jspa</page:param>
        <page:param name="submitId">set_banner</page:param>
        <page:param name="submitName"><webwork:text name="'admin.announcement.set.banner'"/></page:param>
        <page:param name="buttons"><webwork:if test="/preview == true">&nbsp;<input type="button" value="<webwork:text name="'admin.announcement.reset'"/>" onclick="location.href='EditAnnouncementBanner!default.jspa'"/></webwork:if></page:param>

        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="title"><webwork:text name="'admin.announcement.edit.announcement.banner'"/></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.announcement.description'"/></p>
        </page:param>

        <ui:textarea label="text('admin.announcement')" name="'announcement'" rows="'8'" cols="'60'">
            <ui:param name="'description'"><webwork:text name="'admin.announcement.close.tags'"/></ui:param>
            <ui:param name="'cssId'">announcement</ui:param>
        </ui:textarea>
        <ui:radio label="text('admin.announcement.level')" name="'bannerVisibility'" list="visibilityModes" listKey="'id'" listValue="'name'"/>
    </page:applyDecorator>
    <script type="text/javascript">
        AJS.$(function() {
            AJS.$("#previewButton").click(function(e) {
                e.preventDefault();
                AJS.$("form[name=jiraform]").append(
                    AJS.$("<input/>").attr("name", "announcement_preview_banner_st").attr("type", "hidden").val(AJS.$("#announcement").val()));
                AJS.$("form[name=jiraform]").attr("action", "EditAnnouncementBanner!default.jspa").submit();
            });
        });
    </script>
</body>
</html>
