<%@ page import="com.atlassian.core.util.FileSize" %>
<%@ page import="com.atlassian.jira.config.properties.APKeys" %>
<%@ page import="webwork.config.Configuration" %>

<%@ taglib uri="sitemesh-page" prefix="page" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<html>
<head>
    <webwork:if test="/issueValid == true && ableToAttach == true">
        <meta content="issuesummary" name="decorator" />
    </webwork:if>
    <webwork:else>
        <meta content="notitle" name="decorator" />
    </webwork:else>
    <title><webwork:text name="'attachfile.title.multiple'"/></title>
</head>
<body class="type-a">

<webwork:if test="/issueValid == true && ableToAttach == true">
    <div class="item-header">
        <webwork:property value="issue">
            <jsp:include page="/includes/panels/issue_headertable.jsp" />
        </webwork:property>
    </div>
    <div id="main-content">
        <div class="active-area">
            <div id="primary" class="column">
                <div class="content intform">
                <page:applyDecorator name="jiraform">
                    <page:param name="title"><webwork:text name="'attachfile.title.multiple'"/></page:param>
                    <page:param name="description"><webwork:text name="'attachfile.desc.multiple'"/></page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="action">AttachFile.jspa</page:param>
                    <page:param name="cancelURI"><webwork:property value="issuePath" /></page:param>
                    <page:param name="submitId">attachfile_submit</page:param>
                    <page:param name="submitName"><webwork:property value="text('attachfile.submitname')"/></page:param>
                    <page:param name="multipart">true</page:param>
                    <page:param name="autoSelectFirst">false</page:param>
                    <webwork:if test="/issueExists == true">
                        <tr>
                            <td class="fieldLabelArea"><webwork:text name="'attachfile.attachment.label'"/>:</td>
                            <td>
                                <script type="text/javascript" language="JavaScript">
                                    function openAnother(inputId, index)
                                    {
                                        var currentBox = document.getElementById(inputId);
                                        var currentValue = currentBox.value;
                                        if (currentValue != null)
                                        {
                                            currentValue = currentValue.replace(/^[\s]+/g, "").replace(/[\s]+$/g, "");
                                            if (currentValue.length > 0)
                                            {
                                                var nextDiv = document.getElementById("attachment_div." + (index + 1));
                                                if (nextDiv != null)
                                                {
                                                    nextDiv.style.display = 'block';
                                                }
                                            }
                                        }
                                    }
                                </script>

                                <webwork:iterator value="paramNames" status="'status'">
                                    <%-- always display first input box --%>
                                    <webwork:if test="@status/first == true">
                                        <webwork:property id="divStyle" value="'margin: 0 0 0.75em 0;'" />
                                    </webwork:if>
                                    <%-- otherwise hide the input box --%>
                                    <webwork:else>
                                        <webwork:property id="divStyle" value="'margin: 0 0 0.75em 0; display: none;'" />
                                    </webwork:else>
                                    <div id="attachment_div.<webwork:property value="@status/index"/>" style="<webwork:property value="@divStyle"/>">
                                        <%-- display error if any --%>
                                        <webwork:if test="errors/containsKey(.) == true">
                                            <span class="errMsg"><webwork:property value="errors[.]"/></span>
                                            <br/>
                                        </webwork:if>
                                        <webwork:if test="@status/last == true">
                                            <input type="file" size="50"
                                                   id="<webwork:property value="."/>"
                                                   name="<webwork:property value="."/>"><%-- last one does not need handlers --%>
                                        </webwork:if>
                                        <webwork:else>
                                            <input type="file" size="50"
                                                   id="<webwork:property value="."/>"
                                                   name="<webwork:property value="."/>"
                                                   onChange="openAnother('<webwork:property value="."/>', <webwork:property value="@status/index"/>);"
                                                   onKeyPress="openAnother('<webwork:property value="."/>', <webwork:property value="@status/index"/>);">
                                        </webwork:else>
                                        <br/>
                                    </div>
                                </webwork:iterator>
                                <span class="small" style="padding-bottom: 4px;"><webwork:text name="'attachfile.filebrowser.warning'"><webwork:param name="'value0'"><%= FileSize.format(new Long(Configuration.getString(APKeys.JIRA_ATTACHMENT_SIZE))) %></webwork:param></webwork:text></span>
                            </td>
                        </tr>
                        <%@include file="/includes/panels/updateissue_comment.jsp" %>
                        <ui:component name="'id'" template="hidden.jsp" />
                    </webwork:if>
                </page:applyDecorator>
                </div>
            </div>
        </div>
    </div>
</webwork:if>
<webwork:else>
<div id="main-content">
    <div class="active-area">
        <div class="intform">
        <page:applyDecorator name="jiraform">
            <page:param name="title"><webwork:text name="'attachfile.title.multiple'"/></page:param>
            <%@include file="/includes/attachfile-notloggedin.jsp" %>
        </page:applyDecorator>
        </div>
    </div>
</div>
</webwork:else>

</body>
</html>
