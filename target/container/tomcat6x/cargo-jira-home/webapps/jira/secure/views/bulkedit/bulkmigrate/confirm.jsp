<div class="jiraform" style="border: none;" id="<webwork:property value="./value/key" />">
<page:applyDecorator name="jirapanel">
    <page:param name="width">80%</page:param>
    <page:param name="title">
        <strong><webwork:property value="./key/project/string('name')" /></strong> -
        <webwork:component name="'issuetype'" template="constanticon.jsp">
          <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
          <webwork:param name="'iconurl'" value="./key/issueType/string('iconurl')" />
          <webwork:param name="'alt'"><webwork:property value="./key/issueType/string('name')" /></webwork:param>
        </webwork:component>
        <strong><webwork:property value="./key/issueType/string('name')" /></strong>
        <a name="<webwork:property value="./key/project/string('id')" /><webwork:property value="./key/issueTypeObject/id" />" />
    </page:param>
    <page:param name="instructions">
        <webwork:text name="'bulk.migrate.confirm.subheading'">
            <webwork:param name="'value0'">
                <strong><webwork:property value="./value/selectedIssues/size()" /></strong>
            </webwork:param>
            <webwork:param name="'value1'">
                 <webwork:iterator value="./value/issueTypeObjects" status="'status'">
                     <webwork:component name="'issuetype'" template="constanticon.jsp">
                       <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                       <webwork:param name="'iconurl'" value="./iconUrl" />
                       <webwork:param name="'alt'"><webwork:property value="./name" /></webwork:param>
                     </webwork:component> <strong><webwork:property value="./name" /></strong><webwork:if test="@status/last == false">, </webwork:if>
                 </webwork:iterator>
             </webwork:param>
             <webwork:param name="'value2'">
                 <webwork:iterator value="./value/projects" status="'status'">
                     <strong><webwork:property value="./string('name')" /></strong><webwork:if test="@status/last == false">, </webwork:if>
                 </webwork:iterator>
             </webwork:param>
        </webwork:text>
    </page:param>

    <webwork:property value="./value">
        <%@include file="/secure/views/bulkedit/confirmationdetails.jsp"%>
    </webwork:property>

    <a href="#top" class="backToTop"><webwork:text name="'common.concepts.back.to.top'"/></a>
</page:applyDecorator>
</div>
