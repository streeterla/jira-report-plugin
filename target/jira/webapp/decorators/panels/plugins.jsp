<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="sitemesh-decorator" prefix="decorator" %>

<table width=100% cellpadding=0 cellspacing=0 border=0>
    <tr>
        <td valign=top width=25%>
            <table width=100% cellpadding=4 cellspacing=0 border=0 style="border-collapse: collapse;">
                <tr><th colspan=2><webwork:text name="'admin.plugins.installed.plugins'"/></th></tr>

                <webwork:iterator value="plugins">
                    <tr>
                        <webwork:if test="key == /selectedPlugin/key">
                            <td style="border-width: 1px 0 1px 1px; border-style: solid; border-color: #ccc; background: #f0f0f0;" colspan=2>
                        </webwork:if>
                        <webwork:else>
                            <td width=1><img src="<%= request.getContextPath() %>/images/border/spacer.gif" height=1 width=1></td>
                            <td style="border-width: 1px 0 1px 1px; border-style: solid; border-color: #ccc; background: #fff;">
                        </webwork:else>

                        <webwork:if test="/pluginEnabled(.) == true">
                            <div style="color: #666;">
                        </webwork:if>

                        <webwork:if test="key == /selectedPlugin/key"><b></webwork:if>

                    <a href="<webwork:url page="ViewPlugins.jspa"><webwork:param name="'pluginKey'" value="key"/></webwork:url>"
                        <webwork:if test="/pluginEnabled(.) == false">
                            style="color: #666666;"
                        </webwork:if>
                    ><webwork:property value="pluginName(.)" /></a><br>
                    <webwork:if test="/pluginEnabled(.) == true">
                        <span class="small">
                            <webwork:text name="'admin.plugins.modules'">
                                <webwork:param name="'value0'"><webwork:property value="moduleDescriptors/size()" /></webwork:param>
                            </webwork:text>
                        </span>
                    </webwork:if>
                    <webwork:elseIf test="/pluginUnloadable(.) == true">
                        <span class="small errMsg"><webwork:text name="'admin.plugin.error.unloadable'"/></span>
                    </webwork:elseIf>
                    <webwork:else>
                        <span class="smallgrey"><webwork:text name="'admin.plugins.disabled'"/></span>
                    </webwork:else>

                    <webwork:if test="key == /selectedPlugin/key"><b></webwork:if>

                    <br>

                    <webwork:if test="/pluginEnabled(.) == true">
                        </div>
                    </webwork:if>
                    </td></tr>
                </webwork:iterator>
                <tr><td colspan=2>&nbsp;</td></tr>
            </table>
        </td>
    <td width=75% style="border: 1px solid #ccc;" valign=top>
    	<decorator:body />
    </td>
    </tr>

</table>
