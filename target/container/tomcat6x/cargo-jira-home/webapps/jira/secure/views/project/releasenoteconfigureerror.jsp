<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><webwork:text name="'releasenotes.configure'" /></title>
</head>
<body>
    <page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'common.concepts.releasenotes'"/></page:param>
    <page:param name="description">
        <webwork:if test="versions/size <= 0 && styleNames/size <=0">
        <webwork:text name="'releasenotes.generate.note'"/>
        </webwork:if>
        <webwork:elseIf test="versions/size <= 0">
        <webwork:text name="'releasenotes.generate.versions'"/>
        </webwork:elseIf>
        <webwork:elseIf test="styleNames/size <= 0">
        <webwork:text name="'releasenotes.generate.styles'"/>
        </webwork:elseIf>
    </page:param>
    <page:param name="submitId">cancel_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.cancel'"/></page:param>
    <page:param name="action">Dashboard.jspa</page:param>
</page:applyDecorator>
</body>
</html>
