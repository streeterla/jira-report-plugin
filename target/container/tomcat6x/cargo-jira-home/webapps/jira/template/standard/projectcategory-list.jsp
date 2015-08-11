<%@ taglib uri="webwork" prefix="webwork" %>

<table bgcolor="#ffffff" width="100%">
    <webwork:if test="parameters['showCategories'] == true">
        <%-- get projects in a category --%>
        <webwork:iterator value="parameters['categories']" status="'projectCategories'">
            <webwork:if test="parameters['projectFetcher']/projectsInCategory(.)/empty == false">
                <tr><td>
                    <table bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr><td>
                        <table id="cat_<webwork:property value="long('id')"/>_projects" border="0" cellpadding="3" cellspacing="1" width="100%">
                            <tr bgcolor="#f0f0f0"><td colspan="3">
                                <h3 class="formtitle"><webwork:text name="'common.concepts.category'" /> : <webwork:property value="string('name')" /></h3>
                            </td></tr>
                            <webwork:property value="parameters['projectFetcher']/projectsInCategory(.)">
                                <%@ include file="project-list.jsp" %>
                            </webwork:property>
                        </table>
                    </td></tr>
                    </table>
                    <br>
                </td></tr>
            </webwork:if>
        </webwork:iterator>
    </webwork:if>
    <%-- get projects in no category --%>
    <webwork:if test="parameters['projectFetcher']/projectsInNoCategory/empty == false">
        <tr><td>
            <table bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <table id="nocat_projects" border="0" cellpadding="3" cellspacing="1" width="100%">
                        <webwork:property value="parameters['projectFetcher']/projectsInNoCategory">
                            <%@ include file="project-list.jsp" %>
                        </webwork:property>
                    </table>
                </td>
            </tr>
            </table>
        </td></tr>
    </webwork:if>
    <webwork:if test="parameters['projectFetcher']/projectsExist == false">
        <i><webwork:text name="'noprojects'"/></i>
    </webwork:if>
</table>
