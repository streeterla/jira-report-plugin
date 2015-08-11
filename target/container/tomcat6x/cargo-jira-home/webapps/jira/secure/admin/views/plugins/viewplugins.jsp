<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.plugins.current.plugins'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.plugins.current.plugins'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">plugins</page:param>
    <webwork:text name="'admin.plugins.extentions'">
          <webwork:param name="'value0'"><strong class="icon-tools-small"><a href="<webwork:component name="'external.link.jira.extensions'" template="externallink.jsp" />"></webwork:param>
          <webwork:param name="'value1'"></a></strong></webwork:param>
    </webwork:text>
</page:applyDecorator>
<p></p>
<page:applyDecorator name="plugins">
    <webwork:if test="selectedPlugin">
        <webwork:property value="selectedPlugin">
        <div id="plugin-info" style="background: #f0f0f0; padding: 4px 4px 2px 4px;">
        <h3 style="margin:0 0 10px 0; padding: 0 0 0 0;"><webwork:property value="/pluginName(selectedPlugin)" /></h3>
            <webwork:property value="pluginInformation">
                <webwork:if test="pluginDesc(selectedPlugin)">
                    <b><webwork:text name="'common.words.description'"/>:</b> <webwork:property value="/pluginDesc(selectedPlugin)" /><br>
                </webwork:if>
                <webwork:if test="vendorName">
                    <b><webwork:text name="'admin.plugins.vendor'"/>:</b>
                    <webwork:if test="vendorUrl"><a href="<webwork:property value="vendorUrl" />"></webwork:if><webwork:property value="vendorName" /><br><webwork:if test="vendorUrl"></a></webwork:if>
                </webwork:if>
                <webwork:if test="version">
                    <b><webwork:text name="'admin.plugins.plugin.version'"/>:</b> <webwork:property value="version" /><br>
                </webwork:if>
                <webwork:if test="maxVersion">
                    <b><webwork:if test="maxVersion != minVersion"><webwork:text name="'admin.plugins.jira.versions'"/></webwork:if><webwork:else><webwork:text name="'admin.plugins.jira.version'"/></webwork:else>:</b> <webwork:property value="minVersion" /><webwork:if test="maxVersion != minVersion"> - <webwork:property value="maxVersion" /></webwork:if><br>
                </webwork:if>
            </webwork:property>
            <b><webwork:text name="'admin.plugins.installation.mode'"/>:</b> <webwork:property value="/installationMode(selectedPlugin)"/><br/>

            <webwork:if test="/pluginUnloadable(.) == false">
                <webwork:if test="./pluginInformation/satisfiesMinJavaVersion() == true">
                    <webwork:if test="/pluginEnabled(.) == true">
                        <webwork:if test="./containsSystemModule() == false && ./systemPlugin == false">
                           <webwork:property id="configUrlString" value="'configure.url'" />
                               <webwork:if test="pluginInformation/parameters/containsKey(@configUrlString) != false">
                                   <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" alt=""/>
                                   <a href="<webwork:url value="pluginInformation/parameters/(@configUrlString)" />"><webwork:text name="'admin.plugins.configure.plugin'"/></a><br>
                               </webwork:if>
                            <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" alt=""/>
                            <a href="<webwork:url page="ViewPlugins.jspa?mode=disable"><webwork:param name="'pluginKey'" value="key" /></webwork:url>"><webwork:text name="'admin.plugins.disable.plugin'"/></a>
                        </webwork:if>
                    </webwork:if>
                    <webwork:else>
                        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height="8" width="8" border="0" alt=""/>
                        <a href="<webwork:url page="ViewPlugins.jspa?mode=enable"><webwork:param name="'pluginKey'" value="key" /></webwork:url>"><webwork:text name="'admin.plugins.enable.plugin'"/></a>
                    </webwork:else>
                </webwork:if>
                <webwork:else>
                    <font color="red"><webwork:text name="'admin.plugins.requires.java'">
                        <webwork:param name="'value0'"><webwork:property value="./pluginInformation/minJavaVersion" /></webwork:param>
                    </webwork:text></font>
                </webwork:else>
            </webwork:if>
            <webwork:else>
                <div class="errorbox">
                    <span class="errMsg"><webwork:text name="'admin.plugin.error.unloadable.desc'"/>:<br/><webwork:property value="/errorText(.)"/></span>
                </div>
            </webwork:else>

        </div>
        <div class="padded">

            <table class="grid" width="95%">
            <webwork:iterator value="moduleDescriptors">
                <tr <webwork:if test="/pluginEnabled(..) == true && /moduleEnabled(.) == true">style="background: #ddffdd;"</webwork:if><webwork:else>style="background: #ffdddd;"</webwork:else>>
                    <td valign="top" align="left">
                        <b><webwork:property value="name" /></b> (<webwork:property value="key" />)
                        <webwork:if test="description">
                            <br>
                            <webwork:property value="description" />
                        </webwork:if>
                        <webwork:if test="/pluginUnloadable(..) == true || /unrecognisedModule(.) == true">
                            <webwork:if test="./errorText">
                                <br/>
                                <strong><webwork:text name="'admin.errors.general.error.occurred'">
                                    <webwork:param name="'value0"><span class="small errMsg"><webwork:property value="./errorText"/></span></webwork:param>
                                </webwork:text></strong>
                            </webwork:if>
                        </webwork:if>

                    </td>
                    <td valign="top" class="smallfont" nowrap width=16 align="center">
                        <webwork:if test="/pluginEnabled(..) == true">
                            <webwork:if test="./satisfiesMinJavaVersion() == true">
                                <webwork:if test="./systemModule == false && ../systemPlugin == false">
                                    <webwork:if test="unrecognisedModule(.) == true">
                                        <span class="small errMsg"><webwork:text name="'admin.plugins.unrecognised.module'"/></span>
                                    </webwork:if>
                                    <webwork:else>
                                        <webwork:if test="/moduleEnabled(.) == true">
                                            <a id="disable-<webwork:property value="completeKey" />" href="<webwork:url page="ViewPlugins.jspa?mode=disable"><webwork:param name="'moduleKey'" value="completeKey" /></webwork:url>"><webwork:text name="'admin.plugins.disable.module'"/></a>
                                        </webwork:if>
                                        <webwork:else>
                                            <a id="enable-<webwork:property value="completeKey" />" href="<webwork:url page="ViewPlugins.jspa?mode=enable"><webwork:param name="'moduleKey'" value="completeKey" /></webwork:url>"><webwork:text name="'admin.plugins.enable.module'"/></a>
                                        </webwork:else>
                                    </webwork:else>
                                </webwork:if>
                            </webwork:if>
                            <webwork:else>
                                <font color="red"><webwork:text name="'admin.plugins.requires.java'">
                                    <webwork:param name="'value0'"><webwork:property value="./minJavaVersion" /></webwork:param>
                                </webwork:text></font>
                            </webwork:else>
                        </webwork:if>
                        <webwork:else>&nbsp;</webwork:else>
                    </td>
                </tr>
            </webwork:iterator>
            </table>
        </div>
        </webwork:property>
    </webwork:if>
    <webwork:else>
        <div class="errorbox"><webwork:text name="'admin.plugins.select.a.plugin'"/></div>
    </webwork:else>
</page:applyDecorator>

</body>
</html>
