<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:property value="/linkCollection/outwardIssues(./name)">
<webwork:if test=". != null && ./empty == false">
    <table id="outwardLinks_table" class="t_links" cellpadding="0" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>
                    <webwork:text name="'common.concepts.linkDescription'">
                        <webwork:param name="'value0'"><em><webwork:property value="../outward" /></em></webwork:param>
                    </webwork:text>:
                </th>
            </tr>
        </thead>
        <tbody>
        <webwork:iterator>
        <tr>
            <%@ include file="/includes/snippets/issuelinksmall.jsp"  %>
        </tr>
        </webwork:iterator>
        </tbody>
    </table>
</webwork:if>
<webwork:else>&nbsp;</webwork:else>
</webwork:property>
