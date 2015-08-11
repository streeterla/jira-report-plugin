<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:share-types");
%>
<jsp:include page="/template/standard/controlheader.jsp" />
    <script type="text/javascript">
        document.write('<img id="share_busy" src="<%=request.getContextPath()%>/images/icons/wait.gif" alt="<webwork:text name="'common.sharing.loading.share'"/>"/>');
    </script>
    <noscript>
        <span class="warningBox"><webwork:property value="parameters['noJavaScriptMessage']"/></span>
    </noscript>
    <div id="share_display_div"></div>
<jsp:include page="/template/standard/controlfooter.jsp" />

<tr>
    <td class="fieldLabelArea"><webwork:text name="'common.sharing.new.shares'"/>:</td>
    <td class="fieldValueArea">        
        <webwork:property value="parameters['shareTypeList']">
            <div id="share_div" style="display: none;">
                <webwork:if test="parameters['editEnabled'] == false"><div style="display:none"></webwork:if>
                    <div id="share_display_component"><webwork:if test=". != null && ./size > 0">
                        <div>
                        <select id="share_type_selector">
                            <webwork:iterator value=".">
                                <option value="<webwork:property value="./shareType"/>"><webwork:property value="./shareTypeLabel"/></option>
                            </webwork:iterator>
                        </select>
                        <webwork:iterator value="." status="'typeStatus'">
                            <span id="share_<webwork:property value="./shareType"/>" <webwork:if test="@typeStatus/first == false">style="display:none"</webwork:if>>
                                <webwork:property value="./shareTypeEditor" escape="false"/>
                                <webwork:if test="./addButtonNeeded == true">
                                    <span class="addShare" id="share_add_<webwork:property value="./shareType"/>"><img src="<%= request.getContextPath() %>/images/icons/16add_blue.png" />
                                    <webwork:text name="'common.sharing.add.share'"/></span>
                                </webwork:if>
                            </span>
                        </webwork:iterator>
                        <div class="fieldDescription" id="share_type_description"></div>
                    </webwork:if></div></div>

                <webwork:if test="parameters['editEnabled'] == false"></div></webwork:if>
            </div>
            <span id="shares_data" style="display:none;"><webwork:property value="parameters['dataString']"/></span>
            <input id="share_type_hidden" name="shareValues" type="hidden"/>
            <img id="share_trash" height="16px" width="16px" style="display: none" class="shareTrash" src="<%= request.getContextPath() %>/images/icons/trash_16.gif"
                title="<webwork:text name="'common.sharing.delete.share'"/>" alt="<webwork:text name="'common.sharing.delete.share'"/>"/>
            <img id="share_icon" height="16px" width="16px" style="display: none;" class="shareIcon" src="<%= request.getContextPath() %>/images/icons/filter_public.gif"
                 alt="<webwork:text name="'common.sharing.share'"/>"/>
            <div class="shareItem" id="empty_share" style="display:none">
                <div title="<webwork:text name="'common.sharing.shared.template.private.desc'"/>">
                    <img class="shareIcon" src="<%= request.getContextPath() %>/images/icons/filter_private.gif" height="16px" width="16px" border="0"
                         alt="<webwork:text name="'common.sharing.private'"/>"/><webwork:text name="'common.sharing.not.shared'"/>                    
                </div>
            </div>

            <script type="text/javascript">
            <webwork:iterator value=".">
                <webwork:iterator value="./translatedTemplates">
                    atlassian.jira.share.i18n["<webwork:property value="key"/>"] = "<webwork:property value="value" escape="false"/>";
                </webwork:iterator>
            </webwork:iterator>
            atlassian.jira.share.i18n["common.sharing.remove.shares"] = "<webwork:text name="'common.sharing.remove.shares'"/>";
            atlassian.jira.share.i18n["common.sharing.dirty.warning"] = "<webwork:text name="'common.sharing.dirty.warning'"/>";
            atlassian.jira.share.registerEditShareTypes("<webwork:property value="parameters['submitButtonId']"/>");
            </script>
        </webwork:property>
    </td>
</tr>


