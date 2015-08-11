<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<webwork:if test="applicationProperties/option('jira.option.timetracking') == true">
	<ui:textfield label="text('common.concepts.original.estimate')" name="'timeoriginalestimate'" size="20">
		<ui:param name="'description'"><webwork:property value="../fieldDescription" escape="'false'"/></ui:param>
        <ui:param name="'mandatory'" value="../required"/>
	</ui:textfield>
</webwork:if>
