<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="/versionArchived(.) == true">
    <a id="unarchive_<webwork:property value="name" />" href="<webwork:url page="EditVersionArchives!unarchive.jspa"><webwork:param name="'versionId'" value="id" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>">
    <font color="#999999"><webwork:text name="'admin.manageversions.unarchive'"/></font></a>
</webwork:if>
<webwork:else>
    <a id="edit_<webwork:property value="name" />" href="<webwork:url page="EditVersionDetails!default.jspa"><webwork:param name="'versionId'" value="id" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>">
    <webwork:text name="'admin.manageversions.edit.details'"/></a> &nbsp;|&nbsp;
    <a id="merge_<webwork:property value="name" />" href="<webwork:url page="MergeVersions!default.jspa"><webwork:param name="'versionId'" value="id" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>">
    <webwork:text name="'admin.manageversions.merge'"/></a> &nbsp;|&nbsp;
    <webwork:if test="/versionReleased(.) == false">
        <a id="release_<webwork:property value="name" />" href="<webwork:url page="EditVersionReleases.jspa"><webwork:param name="'versionId'" value="id" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>">
        <webwork:text name="'admin.manageversions.release'"/></a> &nbsp;|&nbsp;
    </webwork:if>
    <webwork:else>
        <a id="unrelease_<webwork:property value="name" />" href="<webwork:url page="EditVersionReleases!checkUnrelease.jspa"><webwork:param name="'versionId'" value="id" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>">
        <webwork:text name="'admin.manageversions.unrelease'"/></a> &nbsp;|&nbsp;
    </webwork:else>
    <a id="archive_<webwork:property value="name" />" href="<webwork:url page="EditVersionArchives!archive.jspa"><webwork:param name="'versionId'" value="id" /><webwork:param name="'pid'" value="project/long('id')"/></webwork:url>">
    <webwork:text name="'admin.manageversions.archive'"/></a> &nbsp;|&nbsp;
    <a id="del_<webwork:property value="name"/>" href="<webwork:url page="DeleteVersion!default.jspa"><webwork:param name="'versionId'" value="id" /></webwork:url>">
    <webwork:text name="'common.words.delete'"/></a>
</webwork:else>
