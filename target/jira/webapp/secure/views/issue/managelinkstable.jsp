<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="applicationProperties/option('jira.option.issuelinking') == true">
    <webwork:if test="linkCollection/linkTypes/empty == false">
        <webwork:iterator value="/linkCollection/linkTypes">
            <webwork:property value="/linkCollection/outwardIssues(./name)" id="outwardIssues" />
            <webwork:property value="/linkCollection/inwardIssues(./name)" id="inwardIssues" />
            <webwork:if test="@outwardIssues/empty == false || @inwardIssues/empty == false">
            <h5 class="manage-links-title"><webwork:property value="./name" /></h5>
            <table id="viewLinks" class="typeA" cellpadding="0" cellspacing="0" width="100%">
                <thead>
                    <th class="linkDescription">
                        <webwork:text name="'common.concepts.linkDescription'">
                            <webwork:param name="'value0'"><em><webwork:property value="./outward" /></em></webwork:param>
                        </webwork:text>
                    </th>
                    <th class="linkDescription">
                        <webwork:text name="'common.concepts.linkDescription'">
                            <webwork:param name="'value0'"><em><webwork:property value="./inward" /></em></webwork:param>
                        </webwork:text>
                    </th>
                </thead>
                <tbody>
                    <tr>
                        <td width="50%">
                            <div class="link-wrap">
                                <webwork:if test="@outwardIssues/empty == false">
                                    <webwork:property value="true" id="isOutward" />
                                    <webwork:property value="@outwardIssues">
                                        <%@ include file="/includes/snippets/viewlinkedissuestable.jsp"%>
                                    </webwork:property>
                                </webwork:if>
                            </div>
                        </td>
                        <td width="50%">
                            <webwork:if test="@inwardIssues/empty == false">
                                <webwork:property value="false" id="isOutward" />
                                <webwork:property value="@inwardIssues">
                                    <%@ include file="/includes/snippets/viewlinkedissuestable.jsp"%>
                                </webwork:property>
                            </webwork:if>
                        </td>
                    </tr>
                </tbody>
            </table>
            </webwork:if>
            <%-- need to reset the page level variables property --%>
            <webwork:property value="" id="outwardIssues" />
            <webwork:property value="" id="inwardIssues" />
        </webwork:iterator>
    </webwork:if>
    <webwork:else>
        <div class="notify info"><webwork:text name="'managelinks.no.link.notification'" /></div>
    </webwork:else>
</webwork:if>
