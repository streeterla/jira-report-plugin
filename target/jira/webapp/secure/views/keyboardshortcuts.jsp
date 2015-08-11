<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'keyboard.shortcuts.title'"/></title>
    <meta name="decorator" content="popup">
</head>

<body>
    <fieldset class="hidden parameters">
        <input type="hidden" id="shortcutsTitle" value="<webwork:text name="'keyboard.shortcuts.title'"/>">
    </fieldset>
    <div id="shortcutsmenu">
    <webwork:iterator value="/shortcutsForContext/keySet">
        <webwork:if test="/shortcutsForContext/(.)/size > 0">
            <div class="module">
                <div class="mod-header">
                   <h3><webwork:property value="/contextName(.)"/></h3>
                </div>
                <div class="mod-content">
                    <ul class="item-details">
                        <webwork:iterator value="/shortcutsForContext/(.)">
                        <li>
                            <dl>

                                <dt><webwork:property value="/i18nHelper/text(./descriptionI18nKey)"/>:</dt>
                                <%-- webwork:text doesn't work here, since the translated text may be coming from the plugins system.
                                    The webwork stack isn't smart enough for that.  The 18nHelper is. --%>
                                <dd><webwork:property value="./prettyShortcut(/i18nHelper)" escape="false" /></dd>

                            </dl>
                        </li>
                        </webwork:iterator>
                        <webwork:if test="./toString() == 'global'">
                            <li>
                                <dl>
                                    <dt><webwork:text name="'common.forms.submit.help.label'"/>:</dt>
                                    <dd>
                                        <webwork:iterator value="/formSubmitKeys" status="'status'">
                                            <kbd><webwork:property value="."/></kbd><webwork:if test="@status/last == false"> + </webwork:if>
                                        </webwork:iterator>
                                    </dd>
                                </dl>
                            </li>
                        </webwork:if>
                    </ul>
                </div>
            </div>
        </webwork:if>
    </webwork:iterator>
    </div>
</body>
</html>
