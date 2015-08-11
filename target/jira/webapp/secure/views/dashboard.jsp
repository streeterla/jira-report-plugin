<%@ page import="com.atlassian.jira.web.util.ExternalLinkUtilImpl" %>
<%@ taglib prefix="webwork" uri="webwork" %>
<html>
<head>
    <content tag="section">home_link</content>
    <script type="text/javascript">
        AJS.$(document).ready(function() {
            AJS.warnAboutFirebug(AJS.params.firebugWarning);
        });
    </script>
</head>
    <body>
        <fieldset class="hidden parameters">
            <input type="hidden" id="firebugWarning" value="<webwork:text name="'firebug.performance.warning'">
            <webwork:param name="'value0'"><a href='<%=ExternalLinkUtilImpl.getInstance().getProperty("external.link.jira.firebug.warning")%>'></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>">
        </fieldset>
        <webwork:if test="/warningMessage != null && /warningMessage/length != 0">
            <div id="dashmsg" class="notify info">
                <webwork:property value="/warningMessage" escape="false"/>
            </div>
        </webwork:if>
        <div class="dashboard-contents">
            <webwork:property value="/dashboardHtml" escape="false"/>
        </div>
    </body>    
</html>