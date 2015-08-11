<%-- the reason this file looks so messed is that we are trying to avoid any spaces in the file.  WL 7.0 SP4 also can't handle any spaces at the end of closing tags eg. </webwork:else > kill it
--%><%@ taglib uri="webwork" prefix="webwork" %><webwork:if test="./releaseDate != null"
><webwork:if test="versionArchived(.) == true"
><span class="grey" title="<webwork:text name="'version.releasedate'"/>"></webwork:if><webwork:elseIf
 test="/versionManager/versionOverDue(.) == true && versionReleased(.) == false"><span
class="warning" title="<webwork:text name="'version.releasedate.past'"/>"></webwork:elseIf><webwork:else><span
title="<webwork:text name="'version.releasedate'"/>"></webwork:else><webwork:property value="/outlookDate/formatDMY(./releaseDate)" /></span></webwork:if>
