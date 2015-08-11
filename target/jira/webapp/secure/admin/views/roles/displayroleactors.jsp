<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<script type="text/javascript">
function toggle(mode, elementId)
{
    var hideElement;
    var showElement;

    if (mode == "hide")
    {
        hideElement = document.getElementById('long_' + elementId);
        showElement = document.getElementById('short_' + elementId);
    }
    else
    {
        hideElement = document.getElementById('short_' + elementId);
        showElement = document.getElementById('long_' + elementId);
    }

    if (hideElement && showElement)
    {
        hideElement.style.display = 'none';
        showElement.style.display = '';
    }
}
</script>

<webwork:iterator value="roleActorTypes">
    <td valign=top>
        <webwork:if test="/roleActorTypes(.., ./type, -1)/size() != 0">
            <span id="short_<webwork:property value="../name"/>_<webwork:property value="./type"/>"  onclick="toggle('expand', '<webwork:property value="../name"/>_<webwork:property value="./type"/>');">
                <webwork:iterator value="/roleActorTypes(.., ./type, 3)" status="'liststatus'">
                    <webwork:property value="descriptor" /><webwork:if test="@liststatus/last == false">, </webwork:if>
                </webwork:iterator>
                <webwork:if test="/roleActorTypes(.., ./type, -1)/size() > 3"><span style="cursor:pointer;" class="smallgrey" >[<webwork:text name="'common.concepts.more'" />]</span></webwork:if>
            </span>
            <webwork:if test="/roleActorTypes(.., ./type, -1)/size() > 3">
                <span style="display:none; cursor:pointer;" id="long_<webwork:property value="../name"/>_<webwork:property value="./type"/>" onclick="toggle('hide', '<webwork:property value="../name"/>_<webwork:property value="./type"/>');">
                    <webwork:iterator value="/roleActorTypes(.., ./type, -1)" status="'liststatus'">
                        <webwork:property value="descriptor" /><webwork:if test="@liststatus/last == false">, </webwork:if>
                    </webwork:iterator>
                <span class="smallgrey">[<webwork:text name="'admin.deleteuser.hide'" />]</span>
                </span>
            </webwork:if>
        </webwork:if>
        <webwork:else>
            <i><webwork:text name="'admin.projectroles.view.none.selected'"/></i>
        </webwork:else>
        <!-- get projectRoleModuleDescriptor for the type then get projectRoleModuleDescriptor.getParams().get("ConfigurationURL") -->
        <webwork:if test="/configurationUrl(./type) != null">
            <a id="edit_<webwork:property value="../name"/>_<webwork:property value="./type"/>" href="<webwork:property value="/configurationUrl(./type)"/>.jspa?projectRoleId=<webwork:property value="../id"/><webwork:if test="projectId != null" >&projectId=<webwork:property value="projectId"/></webwork:if>"><webwork:text name="'common.words.edit'"/></a>
        </webwork:if>
    </td>
</webwork:iterator>
