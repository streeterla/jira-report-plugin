<%@ taglib uri="webwork" prefix="webwork" %>

<webwork:property value="parameters['sharesview']">
<webwork:if test="./private == true">
    <webwork:property value="parameters['privatemessage']">
    <span>
        <table class="shareList" cellpadding="0" cellspacing="0" border="0"><tbody>
            <tr title="<webwork:text name="'common.sharing.shared.display.private.desc'"/>">
                <td>
                    <img src="<%= request.getContextPath() %>/images/icons/filter_private.gif" height="16px" width="16px" border="0" alt="<webwork:property value="."/>"/>
                </td>
                <td width="100%">
                    <webwork:property value="."/>
                </td>
            </tr>
        </tbody></table>
    </span>
    </webwork:property>
</webwork:if>
<webwork:else>
    <webwork:property value="./sharePermissions">
        <webwork:if test="./size > 2">
            <span id="share_list_summary_<webwork:property value="../id"/>" onclick="atlassian.jira.share.toggleElements('share_list_complete_<webwork:property value="../id"/>', 'share_list_summary_<webwork:property value="../id"/>')">
                <table class="shareList" cellpadding="0" cellspacing="0" border="0"><tbody><tr>
                    <td>
                        <img src="<%= request.getContextPath() %>/images/icons/filter_public.gif" height="16px" width="16px" border="0" title="<webwork:property value="parameters['sharedmessage']"/>" alt="<webwork:property value="parameters['sharedmessage']"/>"/>
                    </td>
                    <td width="100%">
                    <webwork:text name="'common.sharing.shared.share.count'">
                        <webwork:param name="'value0'"><b></webwork:param>
                        <webwork:param name="'value1'"><webwork:property value="./size"/></webwork:param>
                        <webwork:param name="'value2'"></b></webwork:param>
                    </webwork:text><span class="smallgrey shareLink"> [<webwork:text name="'common.concepts.show'"/>]</span>
                    </td>
                </tr></tbody></table>

            </span>
            <span id="share_list_complete_<webwork:property value="../id"/>" style="display: none;" onclick="atlassian.jira.share.toggleElements('share_list_summary_<webwork:property value="../id"/>', 'share_list_complete_<webwork:property value="../id"/>')">
        </webwork:if>
        <webwork:else>
            <span>
        </webwork:else>
                <table class="shareList" cellpadding="0" cellspacing="0" border="0"><tbody>
                    <webwork:iterator value=".">
                        <tr title="<webwork:property value="../simpleDescription(.)" escape="false"/>">
                            <td>
                                <img src="<%= request.getContextPath() %>/images/icons/filter_public.gif" height="16px" width="16px" border="0" alt="<webwork:property value="parameters['sharedmessage']"/>"/>
                            </td>
                            <td width="100%">
                                <webwork:property value="../shareView(.)" escape="false"/>
                            </td>
                        </tr>
                    </webwork:iterator>
                </tbody></table>
                <webwork:if test="./size > 2">
                    <div class="smallgrey shareLink shareRight">[<webwork:text name="'common.concepts.hide'"/>]</div>
                </webwork:if>
            </span>
    </webwork:property>
</webwork:else>
</webwork:property>
