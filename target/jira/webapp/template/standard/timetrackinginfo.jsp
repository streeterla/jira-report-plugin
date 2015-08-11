<%@ taglib uri="webwork" prefix="webwork" %>

<webwork:property value="parameters['nameValue']">
<div id="<webwork:property value="parameters['name']"/>_table_info" class="tt_inner">
    <webwork:if test="./hasData == false">
        <h4><webwork:text name="'viewissue.timetracking.unknown'"/></h4>
    </webwork:if>
    <webwork:else>
    <dl>
        <dt id="<webwork:property value="parameters['name']"/>_text_orig" class="tt_text" title="<webwork:property value="./originalEstimateTooltip"/>">
            <webwork:text name="'viewissue.timetracking.estimated'"/>:
        </dt>
        <dd id="<webwork:property value="parameters['name']"/>_values_orig" class="tt_values" title="<webwork:property value="./originalEstimateTooltip"/>">
            <webwork:if test="./originalEstimateStr == null">
                <webwork:text name="'viewissue.timetracking.unknown'"/>
            </webwork:if>
            <webwork:else>
                <webwork:property value="./originalEstimateStr" />
            </webwork:else>
        </dd>
        <dd class="tt_graph">
            <table id="<webwork:property value="parameters['name']"/>_graph_orig" cellspacing="0" cellpadding="0" class="tt_graph" >
                <tr class="tt_graph">
                    <webwork:component template="genericpercentagegraph.jsp" name="'./originalEstimateGraph'" />
                </tr>
            </table>
        </dd>
    </dl>
    <dl>
        <dt id="<webwork:property value="parameters['name']"/>_text_remain" class="tt_text" title="<webwork:property value="./remainingEstimateTooltip"/>">
            <webwork:text name="'viewissue.timetracking.remaining'"/>:
        </dt>
        <dd id="<webwork:property value="parameters['name']"/>_values_remain" class="tt_values" title="<webwork:property value="./remainingEstimateTooltip"/>">
            <webwork:if test="./remainingEstimateStr == null">
                <webwork:text name="'viewissue.timetracking.unknown'"/>
            </webwork:if>
            <webwork:else>
                <webwork:property value="./remainingEstimateStr" />
            </webwork:else>
        </dd>
        <dd class="tt_graph">
                <table id="<webwork:property value="parameters['name']"/>_graph_remain" cellspacing="0" cellpadding="0" class="tt_graph">
                <tr class="tt_graph">
                    <webwork:component template="genericpercentagegraph.jsp" name="'./remainingEstimateGraph'" />
                </tr>
            </table>
        </dd>
    </dl>
    <dl>
        <dt id="<webwork:property value="parameters['name']"/>_text_spent" class="tt_text" title="<webwork:property value="./timeSpentTooltip"/>">
            <webwork:text name="'viewissue.timetracking.logged'"/>:
        </dt>
        <dd id="<webwork:property value="parameters['name']"/>_values_spent" class="tt_values" title="<webwork:property value="./timeSpentTooltip"/>">
            <webwork:if test="./timeSpentStr == null">
                <webwork:text name="'viewissue.timetracking.unknown'"/>
            </webwork:if>
            <webwork:else>
                <webwork:property value="./timeSpentStr" />
            </webwork:else>
        </dd>
        <dd  class="tt_graph">
            <table id="<webwork:property value="parameters['name']"/>_graph_spent" cellspacing="0" cellpadding="0" class="tt_graph" >
                <tr class="tt_graph">
                    <webwork:component template="genericpercentagegraph.jsp" name="'./timeSpentGraph'" />
                </tr>
            </table>
        </dd>
    </dl>
    </webwork:else>
</div>
</webwork:property>
