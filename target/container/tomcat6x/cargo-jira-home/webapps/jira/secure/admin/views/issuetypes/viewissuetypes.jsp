<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<%-- The page is used for the manageable option object --%>
<webwork:property value="/manageableOption" >
<html>
<head>
	<title><webwork:text name="'admin.manage.title'">
	    <webwork:param name="'value0'"><webwork:property value="title" /></webwork:param>
	</webwork:text></title>
</head>
<body>
<style>
    .jiraform .jiraform, .jiraform .grid
    {
        margin: 5px 10px 5px 10px;
    }
</style>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.manage.title'">
	    <webwork:param name="'value0'"><webwork:property value="title" /></webwork:param>
	</webwork:text></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">manageIssueTypes</page:param>
    <p>
    <webwork:text name="'admin.issuesettings.issuetypes.the.table.below'">
        <webwork:param name="'value0'"><webwork:property value="titleLowerCase" /></webwork:param>
    </webwork:text>
    <webwork:if test="/actionType == 'view'">
        <webwork:text name="'admin.issuesettings.issuetypes.alphabetical.order'">
            <webwork:param name="'value0'"><strong></webwork:param>
            <webwork:param name="'value1'"></strong></webwork:param>
        </webwork:text>
   </webwork:if>
    </p>

    <webwork:if test="/actionType == 'scheme'">
    <p>
        <webwork:text name="'admin.issuesettings.issuetypes.issue.type.schemes.determines'"/> 
    </p>
   </webwork:if>

    <webwork:if test="/professionalOrEnterprise == false">
    <ul class="square">
        <li><a href="ConfigureOptionSchemes!default.jspa?fieldId=<webwork:property value="fieldId" />&schemeId=<webwork:property value="/defaultScheme/id" />&returnUrl=ViewIssueTypes.jspa"><webwork:text name="'admin.issuesettings.issuetypes.edit.order.and.default.issue.type'"/></a></li>
    </ul>
    </webwork:if>
</page:applyDecorator>

<div class="tabContainer maxWidth centered">
    <div class="tabHeader">
        <a href="ViewIssueTypes.jspa" <webwork:if test="/actionType == 'view'">class="selected"</webwork:if>><webwork:text name="'admin.issuesettings.issuetypes.global.issue.types'">
            <webwork:param name="'value0'"><webwork:property value="title" /></webwork:param>
        </webwork:text></a>
        <webwork:if test="/professionalOrEnterprise == true">
        <a href="ManageIssueTypeSchemes!default.jspa" <webwork:if test="/actionType == 'scheme'">class="selected"</webwork:if>><webwork:text name="'admin.issuesettings.issuetypes.issue.type.scheme'">
            <webwork:param name="'value0'"><webwork:property value="title" /></webwork:param>
        </webwork:text></a>
        </webwork:if>
        <webwork:if test="/translatable == true">
            <a href="ViewTranslations!default.jspa?issueConstantType=<webwork:property value="fieldId" />" id="translate_link"  <webwork:if test="/actionType == 'translate'">class="selected"</webwork:if>><webwork:text name="'admin.issuesettings.issuetypes.translate'"/></a>
        </webwork:if>
    </div>
    <div class="tabContent jiraform">
    <webwork:if test="/actionType == 'scheme'">
        <jsp:include page="issuetypeschemes.jsp" />
    </webwork:if>
    <webwork:elseIf test="/actionType == 'translate'">
        <jsp:include page="/secure/admin/views/translations/viewtranslations.jsp" />
    </webwork:elseIf>
    <webwork:else>
        <jsp:include page="issuetypes.jsp" />
    </webwork:else>
    </div>
</div>

</body>
</html>
</webwork:property>
