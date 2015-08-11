<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<style>
.fieldAreaCell, .fieldAreaCell td
{
    background-color: #fffff0;
}
</style>

    <page:applyDecorator name="jirapanel">
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.issuesettings.translations'">
            <webwork:param name="'value0'"><webwork:property value="/issueConstantName" /></webwork:param>
        </webwork:text></page:param>
        <page:param name="action">ViewTranslations.jspa</page:param>
        <page:param name="instructions"><webwork:text name="'admin.issuesettings.translations.page.description'">
            <webwork:param name="'value0'">'<b><webwork:property value="/issueConstantName" /></b>'</webwork:param>
        </webwork:text>
        <form name="refresh" method="post" action="ViewTranslations!default.jspa">
            <table cellpadding="3" cellspacing="1" border="0">
                <tr>
                <td nowrap valign="top" width="1%"><img alt="" src="<webwork:url page="/images/icons/bullet_creme.gif"/>" height="8" width="8" border="0"> <webwork:text name="'admin.issuesettings.translations.view'">
                    <webwork:param name="'value0'"><b><a href="<webwork:property value="redirectPage" />"></webwork:param>
                    <webwork:param name="'value1'"></a></b></webwork:param>
                    <webwork:param name="'value2'"><webwork:property value="/linkName" /></webwork:param>
                </webwork:text></td>
                </tr>
                <tr>
                    <td nowrap valign="top" width="1%"><img alt="" src="<webwork:url page="/images/icons/bullet_creme.gif"/>" height="8" width="8" border="0"> <webwork:text name="'admin.issuesettings.translations.view.locale.translations'"/>:</td>
                    <ui:select label="text('admin.issuesettings.translations.view.locale.translations')" 
                            name="'selectedLocale'" theme="'single'"
                            list="installedLocales" listKey="'key'" listValue="'value'" />
                    <td width="100%" align="left" valign="top"><input type="submit" name="<webwork:text name="'admin.issuesettings.translations.view.button'"/>" value="View"></td>
                </tr>
            </table>
            <ui:component name="'issueConstantType'" template="hidden.jsp" theme="'single'"  />
            <ui:component name="'selectedLocale'" template="hidden.jsp" theme="'single'"  />
        </form>
        </page:param>

        <tr bgcolor="#ffffff"><td>
            <form name="update" method="post" action="ViewTranslations.jspa">
            <webwork:component name="'atl_token'" value="/xsrfToken" template="hidden.jsp"/>

            <table border="0" cellpadding="3" cellspacing="1" width=100% align="center" class="grid">
                <tr width="100%" bgcolor="#f0f0f0">
                    <td align=left class="colHeaderLink" width="25%">
                        <b><webwork:property value="/issueConstantName" /></b>
                    </td>
                    <td align=left class="colHeaderLink" width="75%">
                        <b><webwork:text name="'admin.issuesettings.translation'"/></b>&nbsp;&nbsp;&nbsp;<span class="small"><webwork:text name="'admin.issuesettings.translations.locale'"/>: <webwork:property value="/selectedLocaleDisplayName" /> </span>
                    </td>
                    </tr>
                    <webwork:property value="/issueConstants">
                    <%/*counter used to alternate background row colors*/%>
                    <webwork:bean name="'webwork.util.Counter'" id="rowCount">
                        <webwork:param name="'wrap'" value="true"/>
                        <webwork:param name="'last'" value="2"/>
                    </webwork:bean>

                    <webwork:iterator value="." status="'status'">

                        <tr>
                            <td align=left>
                                <b><webwork:property value="./name" /></b>
                                <br><span class="small"><webwork:property value="./description" /></span>
                            </td>
                            <td class="fieldAreaCell">
                                <table class="blank">
                                <ui:textfield label="text('common.words.name')" name="/nameKey(.)" size="'60'" value="/translatedName(.)">
                                </ui:textfield>
                                <ui:textfield label="text('common.words.description')" name="/descKey(.)" size="'60'" value="/translatedDesc(.)">
                                </ui:textfield>
                                </table>
                            </td>
                        </tr>
                    </webwork:iterator>
                    </webwork:property>
            </table>
            <tr>
            <td width="100%" align="center" valign="top" bgcolor="#ffffff"><input type="submit" name="update" value="<webwork:text name="'common.forms.update'"/>">
            </td>
            </tr>
                <ui:component name="'issueConstantType'" template="hidden.jsp" theme="'single'"  />
                <ui:component name="'selectedLocale'" template="hidden.jsp" theme="'single'"  />                
            </form>
        </td></tr>


    </page:applyDecorator>
