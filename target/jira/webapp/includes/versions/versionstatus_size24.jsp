<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="./released == true && ./archived == false">
    <img src="<%= request.getContextPath() %>/images/icons/package_24.gif" height="24" width="24" border="0" align="middle" title="<webwork:text name="'common.filters.versionstatus.released'" />" alt="<webwork:text name="'common.filters.versionstatus.released'" />" style="float:left; padding-right:3px;">
</webwork:if>
<webwork:elseIf test="./released == true && ./archived == true">
    <img src="<%= request.getContextPath() %>/images/icons/package_fade_24.gif" height="24" width="24" border="0" align="middle" title="<webwork:text name="'common.filters.versionstatus.released.and.archived'" />" alt="<webwork:text name="'common.filters.versionstatus.released.and.archived'" />" style="float:left; padding-right:3px;">
</webwork:elseIf>
<webwork:elseIf test="./released == false && ./archived == false">
    <img src="<%= request.getContextPath() %>/images/icons/box_24.gif" height="24" width="24" border="0" align="middle" title="<webwork:text name="'common.filters.versionstatus.unreleased'" />" alt="<webwork:text name="'common.filters.versionstatus.unreleased'" />" style="float:left; padding-right:3px;">
</webwork:elseIf>
<webwork:elseIf test="./released == false && ./archived == true">
    <img src="<%= request.getContextPath() %>/images/icons/box_fade_24.gif" height="24" width="24" border="0" align="middle" title="<webwork:text name="'common.filters.versionstatus.unreleased.and.archived'" />" alt="<webwork:text name="'common.filters.versionstatus.unreleased.and.archived'" />" style="float:left; padding-right:3px;">
</webwork:elseIf>
