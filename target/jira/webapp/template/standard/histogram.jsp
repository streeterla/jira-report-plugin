<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<webwork:bean id="math" name="'com.atlassian.core.bean.MathBean'"/>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<webwork:property value="parameters['percentage']">

    <webwork:if test=". != 0">
    <tr>
        <td width="<webwork:property value="."/>%">
            <table border="0" cellpadding="0" cellspacing="0" width="100%"">
                <tr><td bgcolor="#3c78b5" >
                    <a title="<webwork:property value="." />" >
                        <img src="<%= request.getContextPath() %>/images/border/spacer.gif" class="hideOnPrint"
                             height=10
                             width="100%"
                             title="<webwork:property value="."/>%">
                    </a>
                </td></tr>
            </table>
        </td>
        <td width="<webwork:property value="@math/subtract(100, .)"/>%">&nbsp;&nbsp;&nbsp;<webwork:property value="."/>%</td>
    </tr>
    </webwork:if>
    <webwork:else>
    <tr>
        <td>
            <table border="0" cellpadding="0" cellspacing="0" width="1px"">
                <tr><td bgcolor="#3c78b5" >
                    <a title="<webwork:property value="." />" >
                        <img src="<%= request.getContextPath() %>/images/border/spacer.gif" class="hideOnPrint"
                             height=10
                             width="100%"
                             border=0 title="">
                    </a>
                </td></tr>
            </table>
        </td>
        <td ></td>
    </tr>
    </webwork:else>

</webwork:property>
</table>
