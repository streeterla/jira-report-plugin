<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.externalimport.external.import'"/></title>
</head>

<body>
    <page:applyDecorator name="jirapanel">
        <page:param name="title"><webwork:text name="'admin.externalimport.import.data'"/></page:param>
        <page:param name="width">100%</page:param>
        <p>
            <webwork:text name="'admin.externalimport.please.choose.a.system'"/>
        </p>
        <ul class="square">
            <li><a id="import_bugzilla" href="BugzillaImport!default.jspa"><webwork:text name="'admin.externalimport.bugzilla'"/></a></li>
            <li><a id="import_mantis" href="MantisImport!default.jspa"><webwork:text name="'admin.externalimport.mantis'"/></a></li>
            <li><a id="import_fogbugz" href="FogBugzImport!default.jspa"><webwork:text name="'admin.externalimport.fogbugz'"/></a></li>
            <li><a id="import_csv" href="CsvImporter!default.jspa"><webwork:text name="'admin.externalimport.csv'"/></a></li>
        </ul>
        <p><webwork:text name="'admin.externalimport.other.possibilities'"/></p>
        <ul class="square">
            <li><b><a id="import_jelly" href="<webwork:component name="'external.link.jira.doc.jelly'" template="externallink.jsp" />"><webwork:text name="'admin.externalimport.custom.written.jelly.scripts'"/></a></b></li>
        </ul>
        <p><webwork:text name="'admin.externalimport.contact.atlassian'">
            <webwork:param name="'value0'"><a href="<webwork:component name="'external.link.jira.product.site'" template="externallink.jsp" />"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text></p>
    </page:applyDecorator>
</body>
</html>
