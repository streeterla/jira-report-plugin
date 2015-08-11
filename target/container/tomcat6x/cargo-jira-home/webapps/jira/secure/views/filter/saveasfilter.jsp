
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'saveasfilter.title'"/></title>
    <content tag="section">find_link</content>
</head>

<body>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td class="filterSummaryCell">
    <jsp:include page="/includes/navigator/summary-pane.jsp" />
</td>
<td bgcolor="#ffffff" valign="top">

<table width="100%" cellpadding="10" cellspacing="0" border="0"><tr><td>

    <page:applyDecorator name="jiraform">
        <page:param name="action">SaveAsFilter.jspa</page:param>
        <page:param name="cancelURI">IssueNavigator.jspa</page:param>
        <page:param name="submitId">saveasfilter_submit</page:param>
        <page:param name="submitName"><webwork:text name="'saveasfilter.submit'"/></page:param>
        <page:param name="width">100%</page:param>
        <page:param name="labelWidth">20%</page:param>
        <page:param name="title"><webwork:text name="'saveasfilter.title'"/></page:param>
        <page:param name="helpURL">issue_filters</page:param>
        <page:param name="helpURLFragment">#saving_filters</page:param>
        <page:param name="description">
        <webwork:text name="'saveasfilter.desc.line1'"/>
        <p>
        <webwork:text name="'saveasfilter.desc.line2'"/>
        </page:param>

        <ui:textfield label="text('common.words.name')" name="'filterName'" size="30" maxlength="255">
            <ui:param name="'mandatory'">true</ui:param>
        </ui:textfield>
        <ui:textarea label="text('common.concepts.description')" name="'filterDescription'" cols="40" rows="3" />

        <webwork:if test="./searchRequest/useColumns() == false">
            <ui:select label="text('saveasfilter.columnOrder')" name="'saveColumnLayout'" template="radiomap.jsp"
                list="/columnLayoutTypes" listKey="'key'" listValue="'value'">
                <ui:param name="'checkRadio'" value="'2'" />
                <ui:param name="'description'"><webwork:text name="'saveasfilter.columnOrder.desc'"/></ui:param>
            </ui:select>
        </webwork:if>

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
                <webwork:param name="'submitButtonId'">saveasfilter_submit</webwork:param>
            </webwork:component>
        </webwork:if>
    </page:applyDecorator>

</td></tr></table>
</td></tr></table>

</body>
</html>
