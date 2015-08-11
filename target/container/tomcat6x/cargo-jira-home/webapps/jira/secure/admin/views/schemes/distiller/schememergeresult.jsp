<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title><webwork:text name="'admin.scheme.merge.result.title'"/></title>
</head>

<body>

<p>
    <page:applyDecorator name="jirapanel">
        <page:param name="width">100%</page:param>
        <page:param name="title"><webwork:text name="'admin.scheme.merge.result.title'"/></page:param>
        <page:param name="helpURL">scheme_tools</page:param>
        <page:param name="description">
            <webwork:text name="'admin.scheme.merge.result.desc'">
               <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/admin/SchemePurgeTypePicker!default.jspa"></webwork:param>
               <webwork:param name="'value1'"></a></webwork:param>
            </webwork:text>
        </page:param>
        <page:param name="autoSelectFirst">false</page:param>

        <webwork:iterator value="/persistErrors/errors">
            <tr>
                <td>
                    <table class="defaultWidth centered">
                        <tr><td>
                            <div class="warningBox">
                                <webwork:text name="'admin.scheme.merge.result.could.not.save'"/> <strong><webwork:property value="./key"/></strong>:
                                <webwork:property value="./value" escape="false"/>
                            </div>
                        </td></tr>
                    </table>
                </td>
            </tr>
        </webwork:iterator>


        <webwork:if test="/persistedDistilledSchemeResults/size > 0">
            <tr>
                <td>
                    <webwork:text name="'admin.scheme.merge.result.saved.merged.scheme'"/>:
                    <table class="defaultWidth centered">
                        <tr>
                            <td>
                                <ul class="square_blue">
                                    <webwork:iterator value="/distilledSchemeResults/distilledSchemeResults" status="'status'">
                                        <webwork:if test="./selected == true && /persistErrors/errors/containsKey(./resultingSchemeTempName) == false">
                                            <li>
                                                <strong><webwork:property value="./resultingScheme/name"/></strong>
                                                <webwork:if test="./allAssociatedProjects/size > 0"> <webwork:text name="'admin.scheme.merge.result.ass.projects'"/>:<strong>
                                                    <webwork:iterator value="./allAssociatedProjects" status="'status'">
                                                        <webwork:property value="./name"/>
                                                        <webwork:if test="@status/last == false">, </webwork:if>
                                                    </webwork:iterator>
                                                        </strong>
                                                </webwork:if>
                                            </li>
                                        </webwork:if>
                                    </webwork:iterator>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </webwork:if>
    </page:applyDecorator>
</p>

</body>
</html>
