<%@ page import="com.atlassian.jira.bc.JiraServiceContext" %>
<%@ page import="com.atlassian.jira.bc.JiraServiceContextImpl" %>
<%@ page import="com.atlassian.jira.util.system.ExtendedSystemInfoUtils" %>
<%@ page import="webwork.action.CoreActionContext" %>
<%@ page import="java.util.Set" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="webwork" prefix="ui" %>
<ww:bean id="math" name="'com.atlassian.core.bean.MathBean'"/>

<html>
<head>
	<title><ww:text name="'admin.systeminfo.system.info'"/></title>
</head>

<body>

<ww:if test="/warningMessages/size() > 0">
    <p>
    <table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width="100%" id="environment_warnings">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.environment.warnings'"/></h3>
		</td>
	</tr>
    <ww:iterator value="/warningMessages" status="'status'">
        <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
            <td valign="top" width="100%" style="color: #bb0000;"><ww:property value="." escape="false" /></td>
        </tr>
    </ww:iterator>
    </table>
    </td></tr></table>
    </p>
</ww:if>

<p>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%" id="system_info_table">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.system.info'"/></h3>
		</td>
	</tr>

    <tr bgcolor="#ffffff">
        <td valign="top" width="40%">&nbsp; <strong><ww:text name="'admin.generalconfiguration.base.url'"/></strong></td>
        <td valign="top" width="60%"><ww:property value="/extendedSystemInfoUtils/baseUrl"/></td>
    </tr>

    <ww:iterator value="/extendedSystemInfoUtils/props(true)" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#fffff0</ww:if><ww:else>#ffffff</ww:else>">
		<td valign="top" width="40%">&nbsp; <b><ww:property value="key" /></b></td>
		<td valign="top" width="60%"><ww:property value="value" /></td>
	</tr>
    </ww:iterator>
</table>
</td></tr></table>
</p>


<ww:if test="appliedPatches/size() > 0">
    <%--
    This is never shown unless we have an actual set of patches, which most of the time is not the case.
    --%>
    <p>
    <table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
    <table border="0" cellpadding="3" cellspacing="1" width="100%" id="applied_patches">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.applied.patches'"/></h3>
		</td>
	</tr>
    <ww:iterator value="appliedPatches" status="'status'">
        <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
            <td valign="top" width="40%">&nbsp; <b><ww:property value="issueKey" /></b></td>
            <td valign="top" width="60%"><ww:property value="description" /></td>
        </tr>
    </ww:iterator>
    </table>
    </td></tr></table>
    </p>
</ww:if>

<p>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.java.vm.memory.statistics'"/></h3>
		</td>
	</tr>

    <ww:iterator value="/extendedSystemInfoUtils/jvmStats" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
		<td valign="top" width="40%">&nbsp; <b><ww:property value="key" /></b></td>
		<td valign="top" width="60%"><ww:property value="value" /></td>
	</tr>
    </ww:iterator>
    <tr bgcolor="#ffffff">
		<td valign="top" width="40%">&nbsp; <b><ww:text name="'admin.systeminfo.memory.graph'"/></b></td>
		<td valign="top" width="60%">
            <table  border="0" cellpadding="0" cellspacing="0" style="float:left;" width="40%">
                <ww:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/usedMemory, /extendedSystemInfoUtils/systemInfoUtils/totalMemory)">
                    <td bgcolor="#CC3333" width="<ww:property value="."/>%">
                        <a title="<ww:text name="'admin.systeminfo.used.memory'"/>" >
                            <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                                 alt=""
                                 height="15"
                                 width="100%"
                                 border="0" title="<ww:text name="'admin.systeminfo.used.memory.percent'">
                                             <ww:param name="'value0'"><ww:property value="."/></ww:param>
                                         </ww:text>">
                        </a>
                    </td>
                </ww:property>

                <ww:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/freeMemory, /extendedSystemInfoUtils/systemInfoUtils/totalMemory)">
                <td bgcolor="#00CC00" width="<ww:property value="."/>%">
                    <a title="<ww:text name="'admin.systeminfo.free.memory'"/>" >
                        <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                             alt=""
                             height="15"
                             width="100%"
                             border="0" title="<ww:text name="'admin.systeminfo.free.memory.percent'">
                                             <ww:param name="'value0'"><ww:property value="."/></ww:param>
                                         </ww:text>">
                    </a>
                </td>
            </table>
            <b>&nbsp;&nbsp;<ww:text name="'admin.systeminfo.memory.percent.free'">
                <ww:param name="'value0'"><ww:property value="."/> </ww:param>
            </ww:text> </b>
            (<ww:text name="'common.words.total'"/>: <ww:property value="/extendedSystemInfoUtils/systemInfoUtils/totalMemory"/> MB)
            &nbsp;&nbsp;<span class="small">(<a href="ViewSystemInfo!garbageCollection.jspa"><ww:text name="'admin.systeminfo.force.garbage.collection'"><ww:param name="value0">garbage collection</ww:param></ww:text></a>)</span>
        </td>
                </ww:property>
        </td>
    </tr>
    <ww:if test="/extendedSystemInfoUtils/jvmJava5OrGreater == true">
        <ww:if test="/extendedSystemInfoUtils/systemInfoUtils/usedPermGenMemory != 0">
        <tr bgcolor="#fffff0">
            <td valign="top" width="40%">&nbsp; <b><ww:text name="'admin.systeminfo.perm.gen.memory.graph'"/></b></td>
            <td valign="top" width="60%">
                <table  border="0" cellpadding="0" cellspacing="0" style="float:left;" width="40%">
                    <ww:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/usedPermGenMemory, /extendedSystemInfoUtils/systemInfoUtils/totalPermGenMemory)">
                        <td bgcolor="#CC3333" width="<ww:property value="."/>%">
                            <a title="<ww:text name="'admin.systeminfo.used.memory'"/>" >
                                <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                                     alt=""
                                     height="15"
                                     width="100%"
                                     border="0" title="<ww:text name="'admin.systeminfo.used.memory.percent'">
                                                 <ww:param name="'value0'"><ww:property value="."/></ww:param>
                                             </ww:text>">
                            </a>
                        </td>
                    </ww:property>

                    <ww:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/freePermGenMemory, /extendedSystemInfoUtils/systemInfoUtils/totalPermGenMemory)">
                    <td bgcolor="#00CC00" width="<ww:property value="."/>%">
                        <a title="<ww:text name="'admin.systeminfo.free.memory'"/>" >
                            <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                                 alt=""
                                 height="15"
                                 width="100%"
                                 border="0" title="<ww:text name="'admin.systeminfo.free.memory.percent'">
                                                 <ww:param name="'value0'"><ww:property value="."/></ww:param>
                                             </ww:text>">
                        </a>
                    </td>
                </table>
                <b>&nbsp;&nbsp;<ww:text name="'admin.systeminfo.memory.percent.free'">
                    <ww:param name="'value0'"><ww:property value="."/> </ww:param>
                </ww:text> </b>
                (<ww:text name="'common.words.total'"/>: <ww:property value="/extendedSystemInfoUtils/systemInfoUtils/totalPermGenMemory"/> MB)
            </td>
            </ww:property>
            </td>
        </tr>
        </ww:if>
        <ww:if test="/extendedSystemInfoUtils/systemInfoUtils/usedNonHeapMemory != 0">
        <tr bgcolor="#ffffff">
            <td valign="top" width="40%">&nbsp; <b><ww:text name="'admin.systeminfo.nonheap.memory.graph'"/></b></td>
            <td valign="top" width="60%">
                <table  border="0" cellpadding="0" cellspacing="0" style="float:left;" width="40%">
                    <ww:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/usedNonHeapMemory, /extendedSystemInfoUtils/systemInfoUtils/totalNonHeapMemory)">
                        <td bgcolor="#CC3333" width="<ww:property value="."/>%">
                            <a title="<ww:text name="'admin.systeminfo.used.memory'"/>" >
                                <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                                     alt=""
                                     height="15"
                                     width="100%"
                                     border="0" title="<ww:text name="'admin.systeminfo.used.memory.percent'">
                                                 <ww:param name="'value0'"><ww:property value="."/></ww:param>
                                             </ww:text>">
                            </a>
                        </td>
                    </ww:property>

                    <ww:property value="@math/percentage(/extendedSystemInfoUtils/systemInfoUtils/freeNonHeapMemory, /extendedSystemInfoUtils/systemInfoUtils/totalNonHeapMemory)">
                    <td bgcolor="#00CC00" width="<ww:property value="."/>%">
                        <a title="<ww:text name="'admin.systeminfo.free.memory'"/>" >
                            <img src="<%= request.getContextPath() %>/images/border/spacer.gif"
                                 alt=""
                                 height="15"
                                 width="100%"
                                 border="0" title="<ww:text name="'admin.systeminfo.free.memory.percent'">
                                                 <ww:param name="'value0'"><ww:property value="."/></ww:param>
                                             </ww:text>">
                        </a>
                    </td>
                </table>
                <b>&nbsp;&nbsp;<ww:text name="'admin.systeminfo.memory.percent.free'">
                    <ww:param name="'value0'"><ww:property value="."/> </ww:param>
                </ww:text> </b>
                (<ww:text name="'common.words.total'"/>: <ww:property value="/extendedSystemInfoUtils/systemInfoUtils/totalNonHeapMemory"/> MB)
            </td>
            </ww:property>
            </td>
        </tr>
        </ww:if>
        <tr bgcolor="#fffff0">
            <td valign="top" width="40%">&nbsp;</td>
            <td valign="top" width="60%">
                <ww:text name="'admin.systeminfo.java.vm.memory.statistics.more.url'">
                    <ww:param name="'value0'"><a href="ViewMemoryInfo.jspa"></ww:param>
                    <ww:param name="'value1'"></a></ww:param>
                </ww:text></strong> <ww:text name="'admin.systeminfo.java.vm.memory.statistics.more.info'"/></td>
            </td>
        </tr>
    </ww:if>
</table>
</td></tr></table>
</p>

<p>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table id="jirainfo" border="0" cellpadding="3" cellspacing="1" width="100%">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.jira.info'"/></h3>
		</td>
	</tr>

    <ww:iterator value="/extendedSystemInfoUtils/buildStats" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
		<td valign="top" width="40%">&nbsp; <b><ww:property value="key" /></b></td>
		<td valign="top" width="60%"><ww:property value="value" /></td>
	</tr>
    </ww:iterator>
    <ww:if test="/extendedSystemInfoUtils/upgradeHistory/empty == false">
        <tr bgcolor="#ffffff">
            <td valign="top" width="40%">&nbsp;</td>
            <td valign="top" width="60%">
                <ww:text name="'admin.systeminfo.upgrade.history.more.url'">
                    <ww:param name="'value0'"><a id="view_upgrade_history" href="ViewUpgradeHistory.jspa"></ww:param>
                    <ww:param name="'value1'"></a></ww:param>
                </ww:text> <ww:text name="'admin.systeminfo.upgrade.history.more.info'"/></td>
        </tr>
    </ww:if>

    <tr bgcolor="#fffff0">
        <td valign="top">&nbsp;&nbsp;<b><ww:text name="'admin.generalconfiguration.installed.languages'"/></b></td>
        <td valign="top">
        <ww:iterator value="/localeManager/installedLocales" status="'status'">
            <ww:property value="/displayNameOfLocale(.)"/><ww:if test="@status/last == false"><br></ww:if>
        </ww:iterator>
        </td>
    </tr>

    <tr bgcolor="#ffffff">
        <td valign="top">&nbsp;&nbsp;<b><ww:text name="'admin.generalconfiguration.default.language'"/></b></td>
        <td valign="top"><ww:property value="/extendedSystemInfoUtils/defaultLanguage" /><ww:if test="/extendedSystemInfoUtils/usingSystemLocale == true"> - <ww:text name="'admin.systeminfo.system.default.locale'"/></ww:if></td>
    </tr>

</table>
</td></tr></table>
</p>

<p>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table id="license_info" border="0" cellpadding="3" cellspacing="1" width="100%">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.license.info'"/></h3>
		</td>
	</tr>

    <ww:iterator value="/extendedSystemInfoUtils/licenseInfo" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
		<td valign="top" width="40%">&nbsp; <b><ww:property value="key" /></b></td>
		<td valign="top" width="60%"><ww:property value="value" /></td>
	</tr>
    </ww:iterator>

</table>
</td></tr></table>
</p>

<p>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table id="common_config_info" border="0" cellpadding="3" cellspacing="1" width="100%">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.common.config.info'"/></h3>
		</td>
	</tr>

    <ww:iterator value="/extendedSystemInfoUtils/commonConfigProperties" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
		<td valign="top" width="40%">&nbsp; <b><ww:property value="key" /></b></td>
		<td valign="top" width="60%"><ww:property value="value" /></td>
	</tr>
    </ww:iterator>

</table>
</td></tr></table>
</p>


<p>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.database.statistics'"/></h3>
		</td>
	</tr>

    <ww:iterator value="/extendedSystemInfoUtils/usageStats" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
		<td valign="top" width="40%">&nbsp; <b><ww:property value="key" /></b></td>
		<td valign="top" width="60%"><ww:property value="value" /></td>
	</tr>
    </ww:iterator>
</table>
</td></tr></table>
</p>

<p>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table id="file_paths" border="0" cellpadding="3" cellspacing="1" width="100%">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.file.paths'"/></h3>
		</td>
	</tr>

    <tr bgcolor="#ffffff">
		<td valign="top" width="40%">&nbsp; <b><ww:text name="'admin.systeminfo.location.of.jira.home'"/></b></td>
		<td valign="top" width="60%"><ww:property value="/extendedSystemInfoUtils/jiraHomeLocation" /></td>
	</tr>
    <tr bgcolor="#fffff0">
		<td valign="top" width="40%">&nbsp; <b><ww:text name="'admin.systeminfo.location.of.entity.engine'"/></b></td>
		<td valign="top" width="60%"><ww:property value="/extendedSystemInfoUtils/entityEngineXmlPath" /></td>
	</tr>
    <tr bgcolor="#ffffff">
		<td valign="top" width="40%">&nbsp; <b><ww:text name="'admin.systeminfo.location.of.atlassian.jira.log'"/></b></td>
		<td valign="top" width="60%"><ww:property value="/extendedSystemInfoUtils/logPath" /></td>
	</tr>
    <tr bgcolor="#fffff0">
		<td valign="top" width="40%">&nbsp; <b><ww:text name="'admin.systeminfo.location.of.indexes'"/></b></td>
		<td valign="top" width="60%"><ww:property value="/extendedSystemInfoUtils/indexLocation" /></td>
	</tr>

</table>
</td></tr></table>
</p>

<p>
<%-- LISTENERS --%>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">
    <tr bgcolor="#f0f0f0">
        <td class="colHeaderLink" colspan="2">
            <h3 class="formtitle"><ww:text name="'admin.systeminfo.listeners'"/></h3>
        </td>
    </tr>
    <ww:iterator value="/extendedSystemInfoUtils/listeners" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
        <td width="40%" valign="top">
            <span style="font-weight:bold;"><ww:property value="string('name')" /></span><br />
            <span style="font-size:smaller;"><ww:property value="string('clazz')" /></span>
        </td>
        <td width="60%" valign="top">
            <ww:property value="propertySet(.)/keys('',5)">
			<table cellpadding="2" cellspacing="0" border="0">
				<ww:if test=". != null">
					<ww:iterator value=".">
						<tr>
							<td><span style="font-weight:bold;"><ww:property value="." />:</span></td>
							<td><ww:property value="propertySet(../..)/string(.)"/></td>
						</tr>
					</ww:iterator>
				</ww:if>
			</table>
			</ww:property>
        </td>
    </tr>
    </ww:iterator>
</table>
</td></tr></table>
</p>
<p>
<%-- SERVICES --%>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">
    <tr bgcolor="#f0f0f0">
        <td class="colHeaderLink" colspan="2">
            <h3 class="formtitle"><ww:text name="'admin.systeminfo.services'"/></h3>
        </td>
    </tr>
    <ww:iterator value="/extendedSystemInfoUtils/services" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
        <td width="40%" valign="top">
            <span style="font-weight:bold;"><ww:property value="./name" /></span><br />
            <span style="font-size:smaller;"><ww:property value="./serviceClass" /></span>
        </td>
        <td width="60%" valign="top">
			<table cellpadding="2" cellspacing="0" border="0">
                <tr>
                    <td><span style="font-weight:bold;"><ww:text name="'admin.systeminfo.service.delay'"/>:</span></td>
                    <td><ww:property value="/extendedSystemInfoUtils/millisecondsToMinutes(./delay)"/>&nbsp;<ww:text name="'core.dateutils.minutes'"/></td>
                </tr>
                <ww:iterator value="/extendedSystemInfoUtils/servicePropertyMap(.)/entrySet">
                <tr>
                    <td><span style="font-weight:bold;"><ww:property value="./key" />:</span></td>
                    <td><ww:property value="/text(./value)" /></td>
                </tr>
                </ww:iterator>
			</table>
        </td>
    </tr>
    </ww:iterator>
</table>
</td></tr></table>
</p>
<p>
<%-- PLUGINS --%>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">
    <tr bgcolor="#f0f0f0">
        <td class="colHeaderLink" colspan="2">
            <h3 class="formtitle"><ww:text name="'admin.systeminfo.plugins'"/></h3>
        </td>
    </tr>
    <ww:iterator value="/extendedSystemInfoUtils/plugins" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
        <td width="40%" valign="top">
            <span style="font-weight:bold;"><ww:property value="./name" /></span> - <ww:property value="./pluginInformation/version" /><br />
            <span style="font-size:smaller"><ww:text name="'admin.systeminfo.plugin.by'"/>&nbsp;<ww:property value="./pluginInformation/vendorName" /></span>
        </td>
        <td width="60%" valign="top">
            <table cellpadding="2" cellspacing="0" border="0">
                <tr>
                    <td colspan="2">
                        <ww:if test="/extendedSystemInfoUtils/pluginEnabled(.) == true">
                            <ww:text name="'admin.systeminfo.plugin.enabled'"/>
                        </ww:if>
                        <ww:else>
                            <ww:text name="'admin.systeminfo.plugin.disabled'"/>
                        </ww:else>
                    </td>
                </tr>
                <ww:iterator value="./pluginInformation/parameters/entrySet">
                <tr>
                    <td><span style="font-weight:bold;"><ww:property value="./key" />:</span></td>
                    <td><ww:property value="/text(./value)" /></td>
                </tr>
                </ww:iterator>
            </table>
        </td>
    </tr>
    </ww:iterator>
</table>
</td></tr></table>
</p>

<%-- APPLICATION PROPERTIES --%>
<p>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table id="application_properties" border="0" cellpadding="3" cellspacing="1" width="100%">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.application.properties'"/></h3>
		</td>
	</tr>

    <ww:iterator value="applicationPropertiesHTML" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
		<td valign="top" width="40%">&nbsp; <b><ww:property value="key" /></b></td>
		<td valign="top" width="60%" class="small"><ww:property value="value" escape="true"/></td>
	</tr>
    </ww:iterator>

</table>
</td></tr></table>
</p>

<%-- SYSTEM PROPERTIES --%>
<p>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">

	<tr bgcolor="#f0f0f0">
		<td class="colHeaderLink" colspan="2">
			<h3 class="formtitle"><ww:text name="'admin.systeminfo.system.properties'"/></h3>
		</td>
	</tr>

    <ww:iterator value="systemPropertiesHTML" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
		<td valign="top" width="40%">&nbsp; <b><ww:property value="key" /></b></td>
		<td valign="top" width="60%" class="small"><ww:property value="value" escape="false"/></td>
	</tr>
    </ww:iterator>

</table>
</td></tr></table>
</p>

<p>
<%-- TRUSTED APPLICATIONS --%>
<table align="center" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">
    <tr bgcolor="#f0f0f0">
        <td class="colHeaderLink" colspan="2">
            <h3 class="formtitle"><ww:text name="'admin.systeminfo.trustedapps'"/></h3>
        </td>
    </tr>
    <%
        JiraServiceContext jiraServiceContext = (JiraServiceContext) CoreActionContext.getValueStack().findValue("/jiraServiceContext");
        JiraServiceContext trustedAppContext = new JiraServiceContextImpl(jiraServiceContext.getUser());
        ExtendedSystemInfoUtils sysInfo = (ExtendedSystemInfoUtils) CoreActionContext.getValueStack().findValue("/extendedSystemInfoUtils");
        Set trustedApps = sysInfo.getTrustedApplications(trustedAppContext);
        if(trustedAppContext.getErrorCollection().hasAnyErrors()) {
    %>
    <tr bgcolor="#fffff0">
        <td width="40%" valign="top"></td>
        <td valign="top" width="60%" class="small">
            [<ww:text name="'admin.errors.trustedapps.no.permission'"/>]
        </td>
    </tr>
    <% } else if(trustedApps.isEmpty()) { %>
    <tr bgcolor="#fffff0">
        <td width="40%" valign="top"></td>
        <td valign="top" width="60%" class="small">
            [<ww:text name="'admin.trustedapps.no.apps.configured'"/>]
        </td>
    </tr>
    <% } else { %>

    <ww:iterator value="/extendedSystemInfoUtils/trustedApplications(/jiraServiceContext)" status="'status'">
    <tr bgcolor="<ww:if test="@status/odd == true">#ffffff</ww:if><ww:else>#fffff0</ww:else>">
        <td width="40%" valign="top">
            <span style="font-weight:bold;"><ww:property value="./name" /></span>
        </td>
        <td width="60%" valign="top">
			<table cellpadding="2" cellspacing="0" border="0">
                <tr>
                    <td valign="top"><span style="font-weight:bold;"><ww:text name="'admin.trustedapps.field.application.id'"/>:</span></td>
                    <td valign="top"><ww:property value="./ID" /></td>
                </tr>
                <tr>
                    <td valign="top"><span style="font-weight:bold;"><ww:text name="'admin.trustedapps.field.timeout'"/>:</span></td>
                    <td valign="top"><ww:property value="./timeout" /></td>
                </tr>
                <tr>
                    <td valign="top"><span style="font-weight:bold;"><ww:text name="'admin.trustedapps.field.ip.matches'"/>:</span></td>
                    <td valign="top"><ww:iterator value="/extendedSystemInfoUtils/IPMatches(.)">
                            <ww:property value="." /><br/>
                        </ww:iterator></td>
                </tr>
                <tr>
                    <td valign="top"><span style="font-weight:bold;"><ww:text name="'admin.trustedapps.field.url.matches'"/>:</span></td>
                    <td valign="top"><ww:iterator value="/extendedSystemInfoUtils/urlMatches(.)">
                            <ww:property value="." /><br/>
                        </ww:iterator></td>
                </tr>
            </table>
        </td>
    </tr>
    </ww:iterator>
    <% } %>
</table>
</td></tr></table>
</p>

</body>
</html>
