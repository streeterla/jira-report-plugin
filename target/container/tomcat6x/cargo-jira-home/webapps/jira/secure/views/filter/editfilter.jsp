<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'editfilter.title'"/></title>
    <content tag="section">find_link</content>
</head>

<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td class="filterSummaryCell">
    <jsp:include page="/includes/navigator/summary-pane.jsp" />
</td>
<td bgcolor="#ffffff" valign="top">

<table width="100%" cellpadding="10" cellspacing="0" border="0">
<tr><td>
    <webwork:if test="modified == true">
        <page:applyDecorator name="jirapanel">
            <page:param name="width">100%</page:param>
            <page:param name="title"><webwork:text name="'editfilter.title'"/></page:param>
                <webwork:text name="'editfilter.mustSaveFirst'"/>
                <ul>
                    <li><webwork:text name="'navigator.hidden.operation.savecurrent'">
                        <webwork:param name="'value0'"><a class="bolded" href="<webwork:url value="'SaveFilter!default.jspa'"/>"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text></li>
                    <li><webwork:text name="'editfilter.reloadfilter'">
                        <webwork:param name="'value0'"><a class="bolded" href="<webwork:url page="IssueNavigator.jspa?mode=hide"><webwork:param name="'requestId'" value="searchRequest/id" /></webwork:url>"></webwork:param>
                        <webwork:param name="'value1'"></a></webwork:param>
                    </webwork:text></li>
                </ul>
        </page:applyDecorator>
    </webwork:if>
    <webwork:else>
        <page:applyDecorator name="jiraform">
            <page:param name="action">EditFilter.jspa</page:param>
            <page:param name="cancelURI"><webwork:property value="cancelURL"/></page:param>
            <page:param name="submitId">save_submit</page:param>
            <page:param name="submitName"><webwork:text name="'common.words.save'"/></page:param>
            <page:param name="width">100%</page:param>
            <page:param name="title"><webwork:text name="'editfilter.title'"/></page:param>
            <page:param name="helpURL">issue_filters</page:param>
            <page:param name="helpURLFragment">#editing_filters</page:param>
            <page:param name="description">
            <page:param name="labelWidth">20%</page:param>
            <p>
            <webwork:text name="'editfilter.desc.line1'"/>
            </p>
            <p>
            <webwork:text name="'editfilter.desc.line2'"/>
            </p>
            </page:param>

            <tr class="hidden"><td><ui:component name="'filterId'" template="hidden.jsp" theme="single"/></td></tr>
            <ui:textfield label="text('common.words.name')" name="'filterName'" size="30">
                <ui:param name="'mandatory'">true</ui:param>
            </ui:textfield>
            <ui:textarea label="text('common.concepts.description')" name="'filterDescription'" cols="40" rows="3" />
            <tr>
                <td class="fieldLabelArea"><webwork:text name="'common.favourites.favourite'"/>:</td>
                <td class="fieldValueArea">
                    <webwork:component name="'favourite'" template="favourite-new.jsp">
                        <webwork:param name="'enabled'"><webwork:property value="./favourite" /></webwork:param>
                        <webwork:param name="'fieldId'">favourite</webwork:param>
                        <webwork:param name="'entityType'">SearchRequest</webwork:param>
                    </webwork:component>
                </td>
            </tr>
            <webwork:if test="/showShares == true">
                <webwork:component name="'shares'" label="text('common.sharing.shares')" template="edit-share-types.jsp">
                    <webwork:param name="'shareTypeList'" value="/shareTypes"/>
                    <webwork:param name="'noJavaScriptMessage'">
                       <webwork:text name="'common.sharing.no.share.javascript'"/>
                    </webwork:param>
                    <webwork:param name="'editEnabled'" value="/editEnabled"/>
                    <webwork:param name="'dataString'" value="/jsonString"/>
                    <webwork:param name="'submitButtonId'">save_submit</webwork:param>
                </webwork:component>
            </webwork:if>
        </page:applyDecorator>
    </webwork:else>
</td></tr></table>
</td></tr></table>

</body>
</html>
