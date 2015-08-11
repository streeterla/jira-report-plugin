<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <meta content="issuesummary" name="decorator" />
	<title><webwork:text name="'trackback.delete.title'"/></title>
</head>
<body class="type-a">
<div class="item-header">
    <webwork:property value="issue">
        <jsp:include page="/includes/panels/issue_headertable.jsp" />
    </webwork:property>
</div>
<div id="main-content">
    <div class="active-area">
        <div id="primary" class="column">
            <div class="content intform">
                <page:applyDecorator name="jiraform">
                    <page:param name="title"><webwork:text name="'trackback.delete.title'"/>: <webwork:property value="/trackback(trackbackId)/title" /></page:param>
                    <page:param name="autoSelectFirst">false</page:param>
                    <page:param name="description">
                        <p><webwork:text name="'trackback.delete.desc'"/></p>
                    </page:param>
                    <page:param name="width">100%</page:param>
                    <page:param name="action"><webwork:url page="DeleteTrackback.jspa"><webwork:param name="'id'" value="/id"/><webwork:param name="'trackbackId'" value="trackbackId"/></webwork:url></page:param>
                    <page:param name="submitId">delete_submit</page:param>
                    <page:param name="submitName">Delete</page:param>
                    <page:param name="cancelURI"><webwork:url page="ManageTrackbacks.jspa"><webwork:param name="'id'" value="/id" /></webwork:url></page:param>
                    <input type="hidden" name="confirm" value="true">
                </page:applyDecorator>
            </div>
        </div>
    </div>
</div>
</body>
</html>
