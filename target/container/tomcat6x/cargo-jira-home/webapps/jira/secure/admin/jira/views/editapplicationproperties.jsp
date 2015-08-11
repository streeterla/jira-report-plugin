<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'admin.editapplicationproperties.title'"/></title>
</head>
<body>
<page:applyDecorator name="jiraform">
	<page:param name="action">EditApplicationProperties.jspa</page:param>
	<page:param name="submitId">edit_property</page:param>
	<page:param name="submitName"><webwork:text name="'common.forms.update'"/></page:param>
	<page:param name="cancelURI">ViewApplicationProperties.jspa</page:param>
	<page:param name="title"><webwork:text name="'admin.common.words.settings'"/></page:param>
	<page:param name="width">100%</page:param>

	<ui:textfield label="text('admin.generalconfiguration.application.title')" name="'title'">
		<ui:param name="'size'">40</ui:param>
		<ui:param name="'description'">
			<webwork:text name="'admin.generalconfiguration.application.title.description'"/>
		</ui:param>
	</ui:textfield>

	<ui:select label="text('admin.common.words.mode')" name="'mode'"
		list="allowedModes" listKey="'key'" listValue="'value'">
		<ui:param name="'description'">
			<webwork:text name="'admin.generalconfiguration.mode.description'">
			    <webwork:param name="'value0'"><br></webwork:param>
			    <webwork:param name="'value1'"><br></webwork:param>
			</webwork:text>
		</ui:param>
	</ui:select>

    <ui:textfield label="text('admin.generalconfiguration.maximum.authentication.attempts.allowed')" name="'maximumAuthenticationAttemptsAllowed'">
        <ui:param name="'size'">8</ui:param>
        <ui:param name="'description'">
            <webwork:text name="'admin.generalconfiguration.maximum.authentication.attempts.allowed.description'"/>
        </ui:param>
    </ui:textfield>

    <tr>
        <td align="right" valign="top" bgcolor="#fffff0"><span class="label">
            <webwork:text name="'admin.generalconfiguration.captcha.on.signup'"/>
        </span></td>
        <td bgcolor="#ffffff">
            <input type="radio" value="true" name="captcha" <webwork:if test="captcha == true">checked</webwork:if>> <webwork:text name="'admin.common.words.on'"/>
            &nbsp;
            <input type="radio" value="false" name="captcha" <webwork:if test="captcha == false">checked</webwork:if>> <webwork:text name="'admin.common.words.off'"/>
            <br><span class="subText">
                <webwork:text name="'admin.generalconfiguration.captcha.on.signup.description'"/>
            </span>
        </td>
    </tr>

	<ui:textfield label="text('admin.generalconfiguration.base.url')" name="'baseURL'">
        <ui:param name="'size'">40</ui:param>
		<ui:param name="'description'">
			<webwork:text name="'admin.generalconfiguration.base.url.description'"/>
		</ui:param>
	</ui:textfield>

	<ui:textfield label="text('admin.generalconfiguration.email.from.header')" name="'emailFromHeaderFormat'">
        <ui:param name="'size'">40</ui:param>
		<ui:param name="'description'">
			<webwork:text name="'admin.generalconfiguration.email.from.header.description'">
                <webwork:param name="value0">From:</webwork:param>
            </webwork:text>
        </ui:param>
	</ui:textfield>

    <ui:textarea label="text('admin.common.words.introduction')" name="'introduction'" rows="8" cols="60">
		<ui:param name="'description'">
			<webwork:text name="'admin.generalconfiguration.introduction.description'">
			    <webwork:param name="'value0'"><br></webwork:param>
			</webwork:text>
		</ui:param>
	</ui:textarea>


    <tr>
		<td align="right" bgcolor="#fffff0">&nbsp;</td>
		<td bgcolor="#ffffff">&nbsp;</td>
	</tr>

	<tr>
		<td colspan="2" bgcolor="#f0f0f0"><h3 class="formtitle"><webwork:text name="'admin.generalconfiguration.internationalisation'"/></h3></td>
	</tr>

    <ui:textfield label="text('admin.generalconfiguration.character.encoding')" name="'encoding'">
        <ui:param name="'size'">40</ui:param>
		<ui:param name="'description'">
			<webwork:text name="'admin.generalconfiguration.character.encoding.description'">
			    <webwork:param name="'value0'"><br></webwork:param>
			</webwork:text>
		</ui:param>
	</ui:textfield>

    <ui:select label="text('admin.generalconfiguration.indexing.language')" name="'language'"
		list="allowedLanguages" listKey="'key'" listValue="'value'">
		<ui:param name="'description'">
			<webwork:text name="'admin.generalconfiguration.indexing.language.description'">
			    <webwork:param name="'value0'"><br></webwork:param>
			    <webwork:param name="'value1'"><br></webwork:param>
                <webwork:param name="'value2'"><a href="IndexAdmin.jspa"></webwork:param>
			    <webwork:param name="'value3'"></a></webwork:param>
                <webwork:param name="'value4'"><br></webwork:param>
            </webwork:text>
		</ui:param>
	</ui:select>

    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.installed.languages'"/>:
        </span></td>
		<td bgcolor="#ffffff">
            <webwork:iterator value="/localeManager/installedLocales" status="'status'">
                <webwork:property value="/displayNameOfLocale(.)"/><webwork:if test="@status/last == false">, </webwork:if>
            </webwork:iterator><br>
			<span class="subText">
				<webwork:text name="'admin.generalconfiguration.installed.languages.description'"/>
                <webwork:component template="help.jsp" name="'i18n'">
                    <webwork:param name="'align'">middle</webwork:param>
                </webwork:component>
			</span>
		</td>
	</tr>


    <ui:select label="text('admin.generalconfiguration.default.language')" name="'defaultLocale'"
		list="/installedLocales" listKey="'key'" listValue="'value'">
		<ui:param name="'description'">
            <webwork:text name="'admin.generalconfiguration.default.language.description'">
                <webwork:param name="'value0'"><br></webwork:param>
            </webwork:text>
		</ui:param>
	</ui:select>

	<tr>
		<td align="right" bgcolor="#fffff0">&nbsp;</td>
		<td bgcolor="#ffffff">&nbsp;</td>
	</tr>

	<tr>
		<td colspan="2" bgcolor="#f0f0f0"><h3 class="formtitle"><webwork:text name="'admin.common.words.options'"/></h3></td>
	</tr>

	<tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.voting'"/>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="voting" <webwork:if test="voting == true">checked</webwork:if>> <webwork:text name="'admin.common.words.on'"/>
			&nbsp;
			<input type="radio" value="false" name="voting" <webwork:if test="voting == false">checked</webwork:if>> <webwork:text name="'admin.common.words.off'"/>
			<br><span class="subText">
				<webwork:text name="'admin.generalconfiguration.voting.description'"/>
			</span>
		</td>
	</tr>

	<tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.watching'"/>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="watching" <webwork:if test="watching == true">checked</webwork:if>> <webwork:text name="'admin.common.words.on'"/>
			&nbsp;
			<input type="radio" value="false" name="watching" <webwork:if test="watching == false">checked</webwork:if>> <webwork:text name="'admin.common.words.off'"/>
			<br><span class="subText">
				<webwork:text name="'admin.generalconfiguration.watching.description'"/>
			</span>
		</td>
	</tr>

	<tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.allow.unassigned.issues'"/>
        </span></td>
		<td bgcolor="#ffffff">
            <webwork:if test="allowUnassigned == false || canSwitchUnassignedOff == true">
                <input type="radio" value="true" name="allowUnassigned" <webwork:if test="allowUnassigned == true">checked</webwork:if>> <webwork:text name="'admin.common.words.on'"/>
                &nbsp;
                <input type="radio" value="false" name="allowUnassigned" <webwork:if test="allowUnassigned == false">checked</webwork:if>> <webwork:text name="'admin.common.words.off'"/>
                <br><span class="subText">
                    <webwork:text name="'admin.generalconfiguration.allow.unassigned.issues.description'"/>
                </span>
            </webwork:if>
            <webwork:else>
                <webwork:if test="unassignedIssueCount > 0">
                    <p>
                    <span class="subText">
                    <webwork:text name="'admin.generalconfiguration.allow.unassigned.issues.error1'">
                        <webwork:param name="'value0'"><webwork:text name="'admin.generalconfiguration.allow.unassigned.issues'"/></webwork:param>
                        <webwork:param name="'value1'"><webwork:property value="unassignedIssueCount"/> <a href="<webwork:url page="/secure/IssueNavigator.jspa"><webwork:param name="'assigneeSelect'" value="'unassigned'"/><webwork:param name="'reset'" value="'true'"/></webwork:url>"></webwork:param>
                        <webwork:param name="'value2'"></a></webwork:param>
                        <webwork:param name="'value3'"><br></webwork:param>
                        <webwork:param name="'value4'"><br></webwork:param>
                    </webwork:text>
                    </span>
                    </p>
                </webwork:if>
                <webwork:if test="projectsWithDefaultUnassignedCount > 0">
                    <p>
                    <span class="subText">
                    <webwork:text name="'admin.generalconfiguration.allow.unassigned.issues.error2'">
                        <webwork:param name="'value0'"><webwork:text name="'admin.generalconfiguration.allow.unassigned.issues'"/></webwork:param>
                        <webwork:param name="'value1'"><webwork:property value="projectsWithDefaultUnassignedCount"/> <a href="<webwork:url page="ViewProjects.jspa"/>"></webwork:param>
                        <webwork:param name="'value2'"></a></webwork:param>
                        <webwork:param name="'value3'"><br></webwork:param>
                        <webwork:param name="'value4'"><br></webwork:param>
                    </webwork:text>
                    </span>
                    </p>
                </webwork:if>
            </webwork:else>
		</td>
	</tr>

	<tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.external.user.management'"/>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="externalUM" <webwork:if test="externalUM == true">checked</webwork:if>> <webwork:text name="'admin.common.words.on'"/>
			&nbsp;
			<input type="radio" value="false" name="externalUM" <webwork:if test="externalUM == false">checked</webwork:if>> <webwork:text name="'admin.common.words.off'"/>
			<br><span class="subText">
			<webwork:text name="'admin.generalconfiguration.external.user.management.description'">
                <webwork:param name="'value0'"><br><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
                <webwork:param name="'value2'"><b></webwork:param>
                <webwork:param name="'value3'"></b></webwork:param>
            </webwork:text>
			</span>
		</td>
	</tr>

	<tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.external.password.management'"/>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="externalPM" <webwork:if test="externalPM == true">checked</webwork:if>> <webwork:text name="'admin.common.words.on'"/>
			&nbsp;
			<input type="radio" value="false" name="externalPM" <webwork:if test="externalPM == false">checked</webwork:if>> <webwork:text name="'admin.common.words.off'"/>
			<br><span class="subText">
            <webwork:text name="'admin.generalconfiguration.external.password.management.description'">
                <webwork:param name="'value0'"><br><b></webwork:param>
                <webwork:param name="'value1'"></b></webwork:param>
                <webwork:param name="'value2'"><b></webwork:param>
                <webwork:param name="'value3'"></b></webwork:param>
            </webwork:text>
            </span>
		</td>
	</tr>

    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
            <webwork:text name="'admin.generalconfiguration.logout.confirmation'"/>
        </span></td>
		<td bgcolor="#ffffff">
        <input type="radio" value="never" id="logout_never" name="logoutConfirm" <webwork:if test="logoutConfirm == 'never'">checked</webwork:if>>
            <label for="logout_never"><webwork:text name="'admin.common.words.never'"/></label> &nbsp;
        <input type="radio" value="cookie" id="logout_cookie" name="logoutConfirm" <webwork:if test="logoutConfirm == 'cookie'">checked</webwork:if>>
            <label for="logout_cookie"><webwork:text name="'admin.common.words.cookie'"/></label> &nbsp;
		<input type="radio" value="always" id="logout_always" name="logoutConfirm" <webwork:if test="logoutConfirm == 'always'">checked</webwork:if>>
            <label for="logout_always"><webwork:text name="'admin.common.words.always'"/></label> &nbsp;
			<br><span class="subText">
                <webwork:text name="'admin.generalconfiguration.logout.confirmation.description'"/>
			</span>
		</td>
	</tr>

    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.use.gzip.compression'"/>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="useGzip" id="useGzipOn" <webwork:if test="useGzip == true">checked</webwork:if>> <label for="useGzipOn"><webwork:text name="'admin.common.words.on'"/></label>
			&nbsp;
			<input type="radio" value="false" name="useGzip" id="useGzipOff" <webwork:if test="useGzip == false">checked</webwork:if>> <label for="useGzipOff"><webwork:text name="'admin.common.words.off'"/></label>
			<br><span class="subText">
                <webwork:text name="'admin.generalconfiguration.use.gzip.compression.confirmation'"/>
                </span>
		</td>
	</tr>

    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.accept.remote.api.calls'"/>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="allowRpc" id="allowRpcOn" <webwork:if test="allowRpc == true">checked</webwork:if>> <label for="allowRpcOn"><webwork:text name="'admin.common.words.on'"/></label>
			&nbsp;
			<input type="radio" value="false" name="allowRpc" id="allowRpcOff" <webwork:if test="allowRpc == false">checked</webwork:if>> <label for="allowRpcOff"><webwork:text name="'admin.common.words.off'"/></label>
			<br><span class="subText">
                <webwork:text name="'admin.generalconfiguration.accept.remote.api.calls.description'"/>
                </span>
		</td>
	</tr>

        <tr>
    		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
                <webwork:text name="'admin.generalconfiguration.user.email.visibility'"/>
            </span></td>
    		<td bgcolor="#ffffff">
            <input type="radio" value="show" id="email_show" name="emailVisibility" <webwork:if test="emailVisibility == 'show'">checked</webwork:if>>
                <label for="email_show"><webwork:text name="'admin.generalconfiguration.public'"/></label> &nbsp;
            <input type="radio" value="hide" id="email_hide" name="emailVisibility" <webwork:if test="emailVisibility == 'hide'">checked</webwork:if>>
                <label for="email_hide"><webwork:text name="'admin.generalconfiguration.hidden'"/></label> &nbsp;
            <input type="radio" value="mask" id="email_mask" name="emailVisibility" <webwork:if test="emailVisibility == 'mask'">checked</webwork:if>>
                <label for="email_mask"><webwork:text name="'admin.generalconfiguration.masked'"><webwork:param name="value0">user at example dot com</webwork:param></webwork:text></label> &nbsp;
            <input type="radio" value="user" id="email_user" name="emailVisibility" <webwork:if test="emailVisibility == 'user'">checked</webwork:if>>
                <label for="email_user"><webwork:text name="'admin.generalconfiguration.logged.in.only'"/></label> &nbsp;
    			<br><span class="subText">
                <webwork:text name="'admin.generalconfiguration.user.email.visibility.description'"/>
    			</span>
    		</td>
    	</tr>


    <tr>
        <td align="right" valign="top" bgcolor="#fffff0"><span class="label">
            <webwork:text name="'admin.generalconfiguration.commentlevel.visibility'"/>
        </span></td>
        <td bgcolor="#ffffff">
        <input type="radio" value="true" id="groupVisibilityOn" name="groupVisibility" <webwork:if test="groupVisibility == true">checked</webwork:if>>
            <label for="groupVisibilityOn"><webwork:text name="'admin.generalconfiguration.commentlevel.visibility.both'"/></label> &nbsp;
        <input type="radio" value="false" id="groupVisibilityOff" name="groupVisibility" <webwork:if test="groupVisibility == false">checked</webwork:if>>
            <label for="groupVisibilityOff"><webwork:text name="'admin.generalconfiguration.commentlevel.visibility.rolesonly'"/></label> &nbsp;
            <br><span class="subText">
            <webwork:text name="'admin.generalconfiguration.commentlevel.visibility.description'"/>
            </span>
        </td>
    </tr>

    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.enable.email.header'">
			    <webwork:param name="'value0'"><br>&nbsp;&nbsp;</webwork:param>
			    <webwork:param name="'value1'">Precedence: bulk</webwork:param>
			</webwork:text>
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="excludePrecedenceHeader" id="excludePrecedenceHeaderOn" <webwork:if test="excludePrecedenceHeader == true">checked</webwork:if>> <label for="excludePrecedenceHeaderOn"><webwork:text name="'admin.common.words.on'"/></label>
			&nbsp;
			<input type="radio" value="false" name="excludePrecedenceHeader" id="excludePrecedenceHeaderOff" <webwork:if test="excludePrecedenceHeader == false">checked</webwork:if>> <label for="excludePrecedenceHeaderOff"><webwork:text name="'admin.common.words.off'"/></label>
			<br><span class="subText">
                <webwork:text name="'admin.generalconfiguration.enable.email.header.description'">
                    <webwork:param name="'value0'"><br></webwork:param>
                    <webwork:param name="'value1'">Precedence: bulk</webwork:param>
                </webwork:text>
                </span>
		</td>
	</tr>

    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.enable.ajax.issue.picker'" />
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="ajaxIssuePicker" id="ajaxIssuePickerOn" <webwork:if test="ajaxIssuePicker == true">checked</webwork:if>> <label for="ajaxIssuePickerOn"><webwork:text name="'admin.common.words.on'"/></label>
			&nbsp;
			<input type="radio" value="false" name="ajaxIssuePicker" id="ajaxIssuePickerOff" <webwork:if test="ajaxIssuePicker == false">checked</webwork:if>> <label for="ajaxIssuePickerOff"><webwork:text name="'admin.common.words.off'"/></label>
			<br/><span class="subText">
                <webwork:text name="'admin.generalconfiguration.enable.ajax.issue.picker.description'">
                    <webwork:param name="'value0'"><br></webwork:param>
                </webwork:text>
                </span>
		</td>
	</tr>
    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.enable.ajax.user.full.search'" />
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="true" name="ajaxUserPicker" id="ajaxUserPickerOn" <webwork:if test="ajaxUserPicker == true">checked</webwork:if>> <label for="ajaxUserPickerOn"><webwork:text name="'admin.common.words.on'"/></label>
			&nbsp;
			<input type="radio" value="false" name="ajaxUserPicker" id="ajaxUserPickerOff" <webwork:if test="ajaxUserPicker == false">checked</webwork:if>> <label for="ajaxUserPickerOff"><webwork:text name="'admin.common.words.off'"/></label>
			<br/><span class="subText">
                <webwork:text name="'admin.generalconfiguration.enable.ajax.user.full.search.description'">
                    <webwork:param name="'value0'"><br/></webwork:param>
                </webwork:text>
                </span>
		</td>
	</tr>
    <tr>
		<td align="right" valign="top" bgcolor="#fffff0"><span class="label">
			<webwork:text name="'admin.generalconfiguration.enabled.jql.autocomplete'" />
        </span></td>
		<td bgcolor="#ffffff">
			<input type="radio" value="false" name="jqlAutocompleteDisabled" id="jqlAutocompleteOn" <webwork:if test="jqlAutocompleteDisabled == false">checked</webwork:if>> <label for="jqlAutocompleteOn"><webwork:text name="'admin.common.words.on'"/></label>
			&nbsp;
			<input type="radio" value="true" name="jqlAutocompleteDisabled" id="jqlAutocompleteOff" <webwork:if test="jqlAutocompleteDisabled == true">checked</webwork:if>> <label for="jqlAutocompleteOff"><webwork:text name="'admin.common.words.off'"/></label>
			<br/><span class="subText">
                <webwork:text name="'admin.generalconfiguration.enabled.jql.autocomplete.description'"/>
                </span>
		</td>
	</tr>

    <ui:select label="text('admin.generalconfiguration.ie.mime.sniffing')" name="'ieMimeSniffer'" template="radiomap.jsp"
        list="/validMimeSnifferOptions" listKey="'key'" listValue="'value'">
        <ui:param name="'checkRadio'" value="ieMimeSniffer" />
        <ui:param name="'description'"><webwork:text name="'admin.generalconfiguration.ie.mime.sniffing.description'"/></ui:param>
    </ui:select>
	<tr>
		<td align="right" bgcolor="#fffff0">&nbsp;</td>
		<td bgcolor="#ffffff">&nbsp;</td>
	</tr>
</page:applyDecorator>
</body>
</html>
