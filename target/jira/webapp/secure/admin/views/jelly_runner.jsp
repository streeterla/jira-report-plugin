<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.jellyrunner.jelly.runner'"/></title>
</head>
<body>
<webwork:if test="allowedToRun == true">
    <page:applyDecorator name="jiraform">
        <page:param name="action">JellyRunner.jspa</page:param>
        <page:param name="title"><webwork:text name="'admin.jellyrunner.jelly.runner'"/></page:param>
        <page:param name="description">
            <p><webwork:text name="'admin.jellyrunner.instruction'"/></p>
            <webwork:text name="'admin.jellyrunner.note'">
                <webwork:param name="'value0'"><span class="note"></webwork:param>
                <webwork:param name="'value1'"></span></webwork:param>
            </webwork:text>
        </page:param>
        <page:param name="width">100%</page:param>
        <page:param name="helpURL">jelly</page:param>
        <page:param name="submitId">run_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.forms.run.now'"/></page:param>
        <ui:textfield label="text('admin.jellyrunner.jelly.script.file.path')" name="'filename'" size="'60'" maxlength="'255'" />
        <tr>
            <td bgcolor="#fffff0" align="right"><font color="#990000"><webwork:text name="'common.words.or'"/></font></td><td bgcolor="#ffffff">&nbsp;</td>
        </tr>
        <ui:textarea label="text('admin.jellyrunner.jelly.script.xml')" name="'script'" rows="'40'" cols="'80'"/>
    </page:applyDecorator>
</webwork:if>
<webwork:else>
    <page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.jellyrunner.jelly.runner'"/></page:param>
    <page:param name="helpURL">jelly</page:param>
    <page:param name="description">
    <p>
        <webwork:bean name="'com.atlassian.jira.web.util.HelpUtil'" id="helpUtil" />
        <webwork:property value="@helpUtil/helpPath('jelly')">
        <webwork:text name="'admin.jellyrunner.disabled'">
            <webwork:param name="'value0'"><a href="<webwork:property value="url" />" target="_jirahelp"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text><br>
        </webwork:property>
    </p>
    </page:param>
    </page:applyDecorator>
</webwork:else>
</body>
</html>
