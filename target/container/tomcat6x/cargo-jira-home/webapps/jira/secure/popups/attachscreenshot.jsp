<%@ page import="com.opensymphony.util.TextUtils" %>
<%@ page import="com.atlassian.jira.ComponentManager" %>
<%@ taglib uri="webwork" prefix="webwork" %>
<% ComponentManager.getInstance().getWebResourceManager().requireResource("jira.webresources:jira-global"); %>
<html>
<head>
    <title><webwork:text name="'attachscreenshot.title'"/></title>
    <meta name="decorator" content="popup">
</head>
<body>
    <h3><webwork:text name="'attachscreenshot.title'"/></h3>
    <p>
	    <webwork:text name="'attachscreenshot.description.line1'"/><br>
	    <webwork:text name="'attachscreenshot.description.line2'"/>
	</p>
    <p>
<PARAM NAME = ARCHIVE VALUE = "<%= request.getContextPath() %>/secure/applet/screenshot.jar"/>

<ul id="applet-params" style="display:none">
        <li id="user-agent"><%= TextUtils.htmlEncode(request.getHeader("User-Agent")) %></li>

        <webwork:iterator value="/groupLevels" status="'paramStatus'">
            <li id="comment-group-name-<webwork:property value="@paramStatus/index"/>"><webwork:text name="." /></li>
        </webwork:iterator>

        <webwork:iterator value="/roleLevels" status="'paramStatus'">
        <li id="comment-role-<webwork:property value="@paramStatus/index"/>"><webwork:text name="./name" /></li>
        </webwork:iterator>
</ul>

<script type="text/javascript" src="<%= request.getContextPath() %>/includes/deployJava.js"></script>
<script type="text/javascript">
    var version = '1.5';
    var attributes = {
        codebase:"<%= request.getContextPath() %>/secure/",
    	code:"com.atlassian.jira.screenshot.applet.ScreenshotApplet.class",
        archive:"applet/screenshot.jar",
        width:710,
        height:540
    };
    var parameters = {
        scriptable:"false",
        post:"AttachFile.jspa;jsessionid=<%= request.getSession().getId() %>?attachScreenshot=true&atl_token=<webwork:property value="/xsrfToken"/>",
        issue:<webwork:property value="id" />,
        screenshotname:"<webwork:property value="nextScreenshotName"/>",
        after:"ManageAttachments!default.jspa?id=<webwork:property value="id" />",
        encoding:"<webwork:property value="/applicationProperties/encoding" />",
        useragent: jQuery("#user-agent").text(),
        <webwork:iterator value="/groupLevels" status="'paramStatus'">
        'comment.group.name.<webwork:property value="@paramStatus/index"/>': jQuery("#comment-group-name-<webwork:property value="@paramStatus/index"/>").text().replace(/"/g, '&quot;'),
        </webwork:iterator>
        <webwork:iterator value="/roleLevels" status="'paramStatus'">
        'comment.role.<webwork:property value="@paramStatus/index"/>':"<webwork:text name="./id/toString()" />|" + jQuery("#comment-role-<webwork:property value="@paramStatus/index"/>").text().replace(/"/g, '&quot;'),
        </webwork:iterator>
        'paste.text':"<webwork:property value="/encode(/text('attachfile.paste.label'))" />",
        'filename.text':"<webwork:property value="/encode(/text('attachfile.filename.label'))" />",
        'errormsg.filename.text':"<webwork:property value="/encode(/text('attachfile.applet.filename.error'))" />",
        'comment.text':"<webwork:property value="/encode(/text('attachfile.comment.update.label'))" />",
        'attach.text':"<webwork:property value="/encode(/text('attachfile.submitname'))" />",
        'cancel.text':"<webwork:property value="/encode(/text('common.words.cancel'))" />",
        'badconfiguration.text':"<webwork:property value="/encode(/text('attachfile.applet.configuration.error'))" />",
        'comment.level.text':"<webwork:property value="/encode(/text('comment.update.viewableby.label'))" />",
        'allusers.text':"<webwork:property value="/encode(/text('comment.constants.allusers'))" />",
        'projectroles.text':"<webwork:property value="/encode(/text('common.words.project.roles'))" />",
        'groups.text':"<webwork:property value="/encode(/text('common.words.groups'))" />",
        'security.text':"<webwork:property value="/encode(/text('attachfile.applet.security.problem'))" />"
    };
    
    deployJava.runApplet(attributes, parameters, version);
</script>
    <input type="submit" accesskey="<webwork:text name="'common.forms.cancel.accesskey'" />" onclick="window.close();" class="hiddenButton" name="randombutton" />
</p>
</body>
</html>

 