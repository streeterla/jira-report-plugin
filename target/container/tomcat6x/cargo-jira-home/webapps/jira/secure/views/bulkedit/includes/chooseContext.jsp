<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<style>
    .target img
    {
        vertical-align: middle;
        padding-left: 10%;
        padding-right: 10%;

    }

    .target
    {
        font-weight: bold;
        white-space: nowrap;
        width: 50%;
    }

    .formErrors
    {
        background-color: #ffffff!important;
    }
</style>

    <div class="jiraform" style="border: none;" id="<webwork:property value="./value/key" />">
    <page:applyDecorator name="jirapanel">
        <page:param name="width">80%</page:param>
        <page:param name="title">
            <strong><webwork:property value="./key/project/string('name')" /></strong> -
            <webwork:component name="'issuetype'" template="constanticon.jsp">
              <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
              <webwork:param name="'iconurl'" value="./key/issueTypeObject/iconUrl" />
              <webwork:param name="'alt'"><webwork:property value="./key/issueTypeObject/name" /></webwork:param>
            </webwork:component>
            <strong><webwork:property value="./key/issueTypeObject/nameTranslation" /></strong>
            <a name="<webwork:property value="./key/project/string('id')" /><webwork:property value="./key/issueTypeObject/id" />" />
        </page:param>
        <page:param name="instructions">
            <webwork:text name="'bulk.migrate.confirm.subheading'">
                <webwork:param name="'value0'"><strong><webwork:property value="./value/selectedIssues/size()" /></strong></webwork:param>
                <webwork:param name="'value1'"><strong><webwork:property value="./key/issueTypeObject/nameTranslation" /></strong></webwork:param>
                <webwork:param name="'value2'"><strong><webwork:property value="./key/project/string('name')" /></strong></webwork:param>
            </webwork:text>
        </page:param>

        <webwork:property value="./value" >
            <table class="blank centered defaultWidth">
                <tr>
                    <td class="target">
                        <img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif"  alt="<webwork:text name="'bulk.move.targetproject'"/>" />
                        <webwork:text name="'bulk.move.targetproject'"/>
                    </td>
                    <webwork:if test="/allowProjectEdit(.) == true">
                        <webwork:property value="/fieldHtml('project', .)" escape="'false'" />
                    </webwork:if>
                    <webwork:else>
                        <td>
                            <webwork:property value="targetProjectGV/string('name')" />
                            <ui:component name="/projectFieldName(.)" value="targetProjectGV/string('id')" template="hidden.jsp" >
                                <ui:param name="'id'"><webwork:property value="./key" />project</ui:param>
                            </ui:component>
                        </td>
                    </webwork:else>
                </tr>

                <tr>
                    <td class="target">
                        <img src="<%= request.getContextPath() %>/images/icons/arrow_right_small.gif"  alt="<webwork:text name="'bulk.move.targetissuetype'"/>" />
                        <webwork:text name="'bulk.move.targetissuetype'"/>
                    </td>
                    <webwork:property value="fieldHtml('issuetype', .)" escape="'false'" />
                </tr>
            </table>
        </webwork:property>

        <webwork:if test="./value/subTaskCollection == false && !@showSameAsBulkEditBean">
        <webwork:property value="true" id="showSameAsBulkEditBean"/>
            <div class="topBordered">
                <input type="checkbox" name="sameAsBulkEditBean" id="sameAsBulkEditBean" value="<webwork:property value="./value/key" />" onclick="toggle('<webwork:property value="./value/key" />')" />
                <label for="sameAsBulkEditBean">
                    <webwork:text name="'bulk.migrate.choosecontext.same.all'" />
                </label>
            </div>
        </webwork:if>

        <a href="#top" class="backToTop"><webwork:text name="'common.concepts.back.to.top'"/></a>
    </page:applyDecorator>

    </div>

