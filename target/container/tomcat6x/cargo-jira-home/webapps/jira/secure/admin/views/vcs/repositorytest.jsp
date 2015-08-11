<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.cvsmodules.test.cvs.repository'"/></title>
</head>
<body>

    <p>
    <table width=100% cellpadding=10 cellspacing=0 border=0>
    <page:applyDecorator name="jiraform">
        <page:param name="action">ViewRepositories.jspa</page:param>
        <page:param name="submitId">ok_submit</page:param>
        <page:param name="submitName"> <webwork:text name="'admin.common.words.ok'"/> </page:param>
        <page:param name="title"><webwork:text name="'admin.cvsmodules.test.repository'"/></page:param>
        <page:param name="autoSelectFirst">false</page:param>
        <page:param name="description"><webwork:text name="'admin.cvsmodules.test.page.description'"/></page:param>
        <page:param name="width">100%</page:param>


        <webwork:if test="/message || /invalidInput == true">
            <tr>
                <td class="formErrors"><pre><webwork:property value="/message" /></pre></td>
            </tr>
        </webwork:if>
        <webwork:else>
            <tr>
                <td bgcolor=#ffffff><webwork:text name="'admin.cvsmodules.test.no.problems'"/></td>
            </tr>
        </webwork:else>

        <tr>
            <td bgcolor=#ffffff>&nbsp;</td>
        </tr>

    </page:applyDecorator>
    </table>
    </p>

</body>
</html>
