<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%
    WebResourceManager webResourceManager = ComponentManager.getInstance().getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:share-types");
%>
<jsp:include page="/template/standard/controlheader.jsp" />
<div>
    <webwork:property value="parameters['shareTypeList']">
        <div id="share_div" style="display:none">
            <select id="share_type_selector" name="searchShareType">
                <option value="any"><webwork:text name="'common.sharing.shared.description.anyone'"/></option>
                <webwork:iterator value=".">
                    <option value="<webwork:property value="./shareType"/>">
                        <webwork:property value="./shareTypeLabel"/></option>
                </webwork:iterator>
            </select>
            <span id="share_any" style="display:none"></span>
            <webwork:iterator value="." status="'typeStatus'">
                    <span id="share_<webwork:property value="./shareType"/>" style="display:none"><webwork:property value="./shareTypeSelector" escape="false"/></span>
            </webwork:iterator>
        </div>
        <div class="fieldDescription" id="share_type_description"></div>
        <span id="shares_data" style="display:none;"><webwork:property value="parameters['dataString']"/></span>
        <script type="text/javascript">
        <webwork:iterator value=".">
            <webwork:iterator value="./translatedTemplates">
                atlassian.jira.share.i18n["<webwork:property value="key"/>"] = "<webwork:property value="value" escape="false"/>";
            </webwork:iterator>
            atlassian.jira.share.i18n["share_any_description"] = "<webwork:property value="parameters['anyDescription']"/>";
        </webwork:iterator>
        atlassian.jira.share.registerSelectShareTypes();
        </script>
    </webwork:property>
</div>
<jsp:include page="/template/standard/controlfooter.jsp" />
