<%@ taglib uri="webwork" prefix="webwork" %>
<ul class="filter-type">
    <li>
        <webwork:if test="/navigatorTypeAdvanced == false">
            <webwork:text name="'navigator.filter.switch.advanced'">
                <webwork:param name="'value0'"><a id="switchnavtype" href="IssueNavigator!switchView.jspa?navType=advanced<webwork:if test="$createNew == true">&createNew=true</webwork:if>"></webwork:param>
                <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </webwork:if>
        <webwork:else>
            <webwork:if test="/currentQueryTooComplex == true">
                <strong><webwork:text name="'jira.jql.query.too.complex'"/></strong>
                <webwork:text name="'jira.jql.query.too.complex.create.new'">
                    <webwork:param name="'value0'"><a href="IssueNavigator.jspa?mode=show&createNew=true"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'navigator.filter.switch.simple'">
                    <webwork:param name="'value0'"><a id="switchnavtype" href="IssueNavigator!switchView.jspa?navType=simple<webwork:if test="$createNew == true">&createNew=true</webwork:if>"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </webwork:else>
        </webwork:else>
    </li>
</ul>
