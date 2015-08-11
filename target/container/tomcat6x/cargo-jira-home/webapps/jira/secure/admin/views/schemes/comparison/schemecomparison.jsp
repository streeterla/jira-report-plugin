<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.comparison.title'"/></title>
</head>

<body>
<p>
<page:applyDecorator name="jirapanel">
<page:param name="width">100%</page:param>
<page:param name="title"><webwork:text name="'admin.scheme.comparison.title'"/></page:param>
<page:param name="autoSelectFirst">false</page:param>
<page:param name="helpURL">scheme_tools</page:param>
<page:param name="description">
    <webwork:property value="/comparisonToolDescription" escape="false"/>
    <webwork:text name="'admin.scheme.comparison.desc.4'">
       <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/admin/SchemeComparisonTool!default.jspa<webwork:property value="/parameters"/>"></webwork:param>
       <webwork:param name="'value1'"></a></webwork:param>
    </webwork:text>
    <p/>
    <webwork:text name="'admin.scheme.comparison.desc.2'">
        <webwork:param name="'value0'"><span class="<webwork:if test="/schemeDifferencePercentage != 0">redText</webwork:if><webwork:else>greenText</webwork:else>">&nbsp;<webwork:property value="/schemeComparisonDifference"/>&nbsp;</span></webwork:param>
    </webwork:text>
    <br/>
    <span class="small">
        <webwork:text name="'admin.scheme.comparison.desc.3'"/>
    </span>
</page:param>

    <webwork:if test="/schemeDifferencePercentage != 0">
    <tr>
        <td>
            <table class="defaultWidth centered">
                <tr>
                    <td align="center">
                        <a id="return_link" href="<%=request.getContextPath()%>/secure/admin/SchemeComparisonPicker!default.jspa">&lt;&lt; <webwork:text name="'admin.scheme.comparison.return.link'"/></a>
                    </td>
                </tr>
            </table>
        </td>

    </tr>
    </webwork:if>

<tr><td>

    <webwork:if test="/schemeDifferencePercentage != 0">
    <table class="grid defaultWidth centered" id="scheme_comparison_table">

        <tr>
            <th><webwork:property value="/schemeDisplayName"/></th>
            <webwork:iterator value="/schemeRelationships/schemes" status="'schemeCount'">
                <th>
                    <webwork:if test="/schemeRelationships/schemeDistilled(.) == true">
                        <webwork:text name="'admin.scheme.comparison.matching.schemes'"/>
                        <br/><span style="font-size:10px;font-weight:300; "><webwork:text name="'admin.scheme.comparison.distilled.from'"/>
                            <webwork:iterator
                                    value="/schemeRelationships/distilledSchemeResultForScheme(.)/originalSchemes"
                                    status="'status'">
                                <a href="<%=request.getContextPath()%>/secure/admin/<webwork:property value="/editPage"/>!default.jspa?schemeId=<webwork:property value="./id"/>"
                                   id="<webwork:property value="./id"/>_editScheme" title="Edit Scheme"><webwork:property value="./name"/></a>
                                <webwork:if test="@status/last == false">, </webwork:if>
                            </webwork:iterator>
                            )</span>
                    </webwork:if>
                    <webwork:else>
                        <a href="<%=request.getContextPath()%>/secure/admin/<webwork:property value="/editPage"/>!default.jspa?schemeId=<webwork:property value="./id"/>"
                           id="<webwork:property value="./id"/>_editScheme" title="Edit Scheme"><webwork:property value="./name"/></a>
                    </webwork:else>
                </th>
            </webwork:iterator>
        </tr>
        <webwork:iterator value="/schemeRelationships/schemeRelationships">
            <webwork:if test="./allMatch() == false">
            <tr>
                <th width="<webwork:property value="/columnWidthPercentage"/>">
                    <b><webwork:text name="./entityTypeDisplayName"/></b>
                </th>
                <webwork:iterator value="/schemeRelationships/schemes" status="'schemeCount'">
                    <td width="<webwork:property value="/columnWidthPercentage"/>">
                        <span class="greenText">
                            <webwork:iterator value="/schemeEntitiesByDisplayName(../matchingSchemeEntities)" status="'status'">
                                <webwork:property value="."/>
                                <webwork:if test="@status/last == false"><br/></webwork:if>
                            </webwork:iterator>
                        </span>
                        <webwork:if test="/schemeEntitiesByDisplayName(../nonMatchingSchemeEntities(.))/size > 0 && /schemeEntitiesByDisplayName(../matchingSchemeEntities)/size > 0">
                            <br/>
                        </webwork:if>
                        <span class="redText"><strong>
                            <webwork:iterator value="/schemeEntitiesByDisplayName(../nonMatchingSchemeEntities(.))" status="'status'">
                                <webwork:property value="."/>
                                <webwork:if test="@status/last == false"><br/></webwork:if>
                            </webwork:iterator>
                        </strong></span>
                    </td>
                </webwork:iterator>
            </tr>
            </webwork:if>
        </webwork:iterator>
    </table>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'admin.scheme.comparison.no.difference.schemes'">
            <webwork:param name="'value0'">
                <webwork:iterator value="/distilledSchemeResults/distilledSchemeResults" status="'outsideStatus'">
                    <webwork:iterator value="./originalSchemes" status="'status'">
                        <a href="<%=request.getContextPath()%>/secure/admin/<webwork:property value="/editPage"/>!default.jspa?schemeId=<webwork:property value="./id"/>"
                           id="<webwork:property value="./id"/>_editScheme" title="Edit Scheme"><webwork:property value="./name"/></a>
                        <webwork:if test="@status/last == false">, </webwork:if>
                    </webwork:iterator>
                </webwork:iterator>
            </webwork:param>
            <webwork:param name="'value1'">
                <a href="<%=request.getContextPath()%>/secure/admin/SchemeTypePicker!selectSchemes.jspa<webwork:property value="/parameters"/>">
            </webwork:param>
            <webwork:param name="'value2'">
                </a>
            </webwork:param>
        </webwork:text>

        <tr>
            <td>
                <table class="defaultWidth centered">
                    <tr>
                        <td align="center">
                            <a id="return_link" href="<%=request.getContextPath()%>/secure/admin/SchemeComparisonPicker!default.jspa">&lt;&lt; <webwork:text name="'admin.scheme.comparison.return.link'"/></a>
                        </td>
                    </tr>
                </table>
            </td>

        </tr>

    </webwork:else>
</td></tr>

</page:applyDecorator>
</p>

</body>
</html>
