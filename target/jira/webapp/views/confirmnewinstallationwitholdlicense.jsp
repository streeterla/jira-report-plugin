<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<body>

<webwork:if test="licenseUpdated == true">
    <page:applyDecorator name="jirapanel">
	    <page:param name="width">100%</page:param>
	    <page:param name="title"><webwork:text name="'admin.license.update.license'"/></page:param>
        <page:param name="description">
            <font color="#cc0000"><b><webwork:text name="'system.error.license.updated.please.restart'"/>
            <p>
            <webwork:text name="'system.error.restart.for.changes'"/></b></font>
            <p><webwork:text name="'system.error.click.here.after.restart'">
                   <webwork:param name="value0"><a href="<%= request.getContextPath() %>/"></webwork:param>
                   <webwork:param name="value0"></a></webwork:param>
               </webwork:text>
        </page:param>
    </page:applyDecorator>
</webwork:if>
<webwork:elseIf test="installationConfirmed == true">
    <page:applyDecorator name="jirapanel">
	    <page:param name="width">100%</page:param>
	    <page:param name="title"><webwork:text name="'admin.license.update.license'"/></page:param>
        <page:param name="description">
            <font color="#cc0000"><b><webwork:text name="'system.error.installation.complete.please.restart'"/>
            <p>
            <webwork:text name="'system.error.restart.for.changes'"/></b></font>
            <p><webwork:text name="'system.error.click.here.after.restart'">
                   <webwork:param name="value0"><a href="<%= request.getContextPath() %>/"></webwork:param>
                   <webwork:param name="value0"></a></webwork:param>
               </webwork:text>
        </page:param>
    </page:applyDecorator>
</webwork:elseIf>
<webwork:else>
    <page:applyDecorator name="jiraform">
        <page:param name="action">ConfirmNewInstallationWithOldLicense.jspa</page:param>
        <page:param name="submitId">proceed_submit</page:param>
        <page:param name="submitName"><webwork:text name="'common.words.proceed'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'system.error.confirm.new.installation'"/></page:param>
        <page:param name="description">
            <p><webwork:text name="'system.error.this.jira.was.created.on'">
                    <webwork:param name="value0"><webwork:property value="/buildUtilsInfo/version"/></webwork:param>
                    <webwork:param name="value1"><font size="1"></webwork:param>
                    <webwork:param name="value2"><webwork:property value="/buildUtilsInfo/currentBuildNumber"/></webwork:param>
                    <webwork:param name="value3"></font></webwork:param>
                    <webwork:param name="value4"><webwork:property value="/currentBuildDate"/></webwork:param>
                </webwork:text></p>
            <p><webwork:property value="licenseStatusMessage" escape="false"/></p>
            <p style="color:#f00;"><webwork:text name="'system.error.or'"/></p>
            <p><webwork:text name="'system.error.proceed.under.evaluation.terms'">
                    <webwork:param name="value0"><b></webwork:param>
                    <webwork:param name="value1"></b></webwork:param>
                </webwork:text></p>
        </page:param>

        <ui:component label="text('system.error.admin.username')" name="'userName'" template="userselect.jsp">
            <ui:param name="'formname'" value="'jiraform'" />
            <ui:param name="'imageName'" value="'userImage'"/>
            <ui:param name="'size'" value="40"/>
        </ui:component>

        <ui:component label="text('common.words.password')" name="'password'" template="password.jsp">
            <ui:param name="'size'">40</ui:param>
            <ui:param name="'description'"><webwork:text name="'system.error.admin.username.password.desc'"/></ui:param>
        </ui:component>


        <tr>
            <td style="background-color:#fffff0;">&nbsp;</td>
            <td style="background-color:#fff;">&nbsp;</td>
        </tr>

        <tr>
            <td style="background-color:#fffff0;">&nbsp;</td>
            <td style="background-color:#fff; color:#f00; font-weight:bold;">
                <webwork:text name="'system.error.either.enter.license.key'"/>
            </td>
        </tr>

        <page:param name="license"><webwork:text name="'system.error.copy.and.paste.license.key.below'"/></page:param>

        <ui:component template="textlabel.jsp" label="text('admin.server.id')" value="/serverId"/>

        <ui:textarea label="text('admin.license')" name="'license'" cols="50" rows="10" >
            <ui:param name="'description'">
                <webwork:text name="'system.error.license.line1.desc'" /><br>
                <webwork:text name="'system.error.license.line2.desc'">
                    <webwork:param name="'value0'"><a target="_blank" href="<webwork:component name="'external.link.jira.license.view'" template="externallink.jsp" >
                        <webwork:param name="'value0'"><webwork:property value="/buildUtilsInfo/version"/></webwork:param>
                        <webwork:param name="'value1'"><webwork:property value="/buildUtilsInfo/currentBuildNumber"/></webwork:param>
                        <webwork:param name="'value2'">Enterprise</webwork:param>
                        <webwork:param name="'value3'"><webwork:property value="/serverId"/></webwork:param>
                        </webwork:component>"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </ui:param>
        </ui:textarea>


        <tr>
            <td style="background-color:#fffff0;">&nbsp;</td>
            <td style="background-color:#fff; color:#f00; font-weight:bold;">
                <webwork:text name="'system.error.or.confirm.evaluation.period'"/>
            </td>
        </tr>

        <ui:checkbox label="text('admin.evaluation')" name="'confirm'" fieldValue="'confirmed'" >
            <ui:param name="'description'"><webwork:text name="'system.error.check.box.to.agree.evaluation.terms'"/></ui:param>
        </ui:checkbox>

    </page:applyDecorator>
</webwork:else>

</body>
</html>
