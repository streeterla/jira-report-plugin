<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.merge.preview.title'"/></title>
</head>

<body>

<p>
    <page:applyDecorator name="jiraform">
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.merge.preview.title'"/></page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="description">
            <webwork:if test="/numberOfSelectedSchemes == /distilledSchemeResults/distilledSchemeResults/size">
                <webwork:text name="'admin.scheme.merge.preview.desc.1'">
                   <webwork:param name="'value0'"><strong></webwork:param>
                   <webwork:param name="'value1'"></strong></webwork:param>
                </webwork:text>
            </webwork:if>
            <webwork:else>
                <webwork:text name="'admin.scheme.merge.preview.desc.2'">
                   <webwork:param name="'value0'"><strong></webwork:param>
                   <webwork:param name="'value1'"><webwork:property value="/numberOfSelectedSchemes"/></webwork:param>
                   <webwork:param name="'value2'"></strong></webwork:param>
                   <webwork:param name="'value3'"><webwork:property value="/distilledSchemeResults/distilledSchemeResults/size"/></webwork:param>
                </webwork:text>
            </webwork:else>

        </page:param>
        <page:param name="action">SchemeMergeResult.jspa</page:param>
        <page:param name="columns">1</page:param>
        <page:param name="submitId">preview_submit</page:param>
        <page:param name="submitName"><webwork:text name="'admin.scheme.merge.preview.submit'"/></page:param>
        <page:param name="cancelURI"><webwork:url page="SchemeMerge!default.jspa"><webwork:param name="'selectedSchemeType'" value="/selectedSchemeType"/><webwork:param name="'typeOfSchemesToDisplay'" value="/typeOfSchemesToDisplay"/></webwork:url></page:param>
        <page:param name="autoSelectFirst">false</page:param>

        <tr>
            <td>
                    <webwork:iterator value="/distilledSchemeResults/distilledSchemeResults" status="'status'">
                        <webwork:if test="./selected == true">
                            <table class="defaultWidth centered">
                                <tr>
                                    <td><webwork:text name="'admin.scheme.merge.preview.adding.scheme'"/>: <strong><webwork:property value="./resultingSchemeTempName"/></strong></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="grid defaultWidth centered" id="<webwork:property value="./resultingSchemeTempName"/>_table">
                                            <tr>
                                                <th width="50%">
                                                    <webwork:text name="'admin.scheme.merge.preview.merged.from.schemes'"/>
                                                </th>
                                                <th width="50%">
                                                    <webwork:text name="'admin.scheme.merge.preview.project.associations.to.be.migrated'"/>
                                                </th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <webwork:iterator value="./originalSchemes" status="'status'">
                                                        <webwork:property value="./name"/>
                                                        <webwork:if test="@status/last == false">, </webwork:if>
                                                    </webwork:iterator>
                                                </td>
                                                <td>
                                                    <webwork:iterator value="./allAssociatedProjects" status="'status'">
                                                        <webwork:property value="./name"/>
                                                        <webwork:if test="@status/last == false">, </webwork:if>
                                                    </webwork:iterator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </webwork:if>
                    </webwork:iterator>
            </td>
        </tr>
    </page:applyDecorator>
</p>


</body>
</html>
