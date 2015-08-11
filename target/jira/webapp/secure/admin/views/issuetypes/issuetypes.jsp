<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<table class="grid maxWidth centred">
    <tr class="rowHeader">
        <th>
            <webwork:text name="'common.words.name'"/>
        </th>
        <th>
            <webwork:text name="'common.words.description'"/>
        </th>
        <webwork:if test="iconEnabled == true">
            <th>
                <webwork:text name="'admin.common.words.icon'"/>
            </th>
        </webwork:if>
        <webwork:if test="typeEnabled == true">
            <th>
                <webwork:text name="'admin.common.words.type'"/>
            </th>
        </webwork:if>
        <webwork:if test="/schemes/size() > 1">
            <th>
                <webwork:text name="'admin.issuesettings.issuetypes.related.schemes'"/>
            </th>
        </webwork:if>
        <th>
            <webwork:text name="'common.words.operations'"/>
        </th>
    </tr>

    <webwork:iterator value="allOptions" status="'status'">
    <tr <webwork:if test="@status/modulus(2) == 0">class="rowAlternate"</webwork:if>>
        <td><strong><webwork:property value="name"/></strong></td>
        <td><webwork:property value="description"/></td>

        <webwork:if test="../iconEnabled == true">
        <td class="fullyCentered">
            <webwork:component name="../fieldId" template="constanticon.jsp">
              <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
              <webwork:param name="'iconurl'" value="iconUrl" />
              <webwork:param name="'alt'"><webwork:property value="name" /></webwork:param>
            </webwork:component>
        </td>
        </webwork:if>
        <webwork:if test="../typeEnabled == true">
        <td>
            <webwork:property value="type" />
        </td>
        </webwork:if>

        <webwork:if test="/schemes/size() > 1">
        <td>
            <webwork:property value="/allRelatedSchemes(id)">
                <webwork:if test="./size() > 0">
                    <ul class="square_blue">
                    <webwork:iterator value="." status="'status'">
                        <li><a href="<webwork:url value="'ManageIssueTypeSchemes!default.jspa'" ><webwork:param name="'actionedSchemeId'" value="./id" /></webwork:url>"><webwork:property value="./name" /></a></li>
                    </webwork:iterator>
                    </ul>
                </webwork:if>
                <webwork:else>
                    <webwork:text name="'admin.issuesettings.issuetypes.no.associated.schemes'"/>
                </webwork:else>
            </webwork:property>

        </td>
        </webwork:if>

        <td class="nowrap">
            <a href="Edit<webwork:property value="../actionPrefix" />!default.jspa?id=<webwork:property value="id"/>"><webwork:text name="'common.words.edit'"/></a>
            <%-- At least one constant  must exist - check that there is more than one constant --%>
            <webwork:if test="../allOptions/size > 1">
            | <a href="Delete<webwork:property value="../actionPrefix" />!default.jspa?id=<webwork:property value="id"/>"><webwork:text name="'common.words.delete'"/></a>
            </webwork:if>
        </td>
    </tr>
    </webwork:iterator>
</table>


<script language="JavaScript">
    function openWindow()
    {
        var vWinUsers = window.open('<%= request.getContextPath() %>/secure/popups/IconPicker.jspa?fieldType=<webwork:property value="fieldId" />&formName=jiraform','IconPicker', 'status=no,resizable=yes,top=100,left=200,width=580,height=650,scrollbars=yes');
        vWinUsers.opener = self;
	    vWinUsers.focus();
    }
</script>

<page:applyDecorator name="jiraform">
    <page:param name="action">Add<webwork:property value="actionPrefix" />.jspa</page:param>
    <page:param name="submitId">add_submit</page:param>
    <page:param name="submitName"><webwork:text name="'common.forms.add'"/></page:param>
    <page:param name="title"><webwork:text name="'admin.issuesettings.add.new'">
        <webwork:param name="'value0'"><webwork:property value="titleSingle" /></webwork:param>
    </webwork:text></page:param>
    <page:param name="instructions"><webwork:text name="'admin.issuesettings.issuetypes.add.description'">
        <webwork:param name="'value0'"><webwork:property value="titleSingle" /></webwork:param>
    </webwork:text></page:param>

    <ui:textfield label="text('common.words.name')" name="'name'" maxlength="60" >
        <ui:param name="'mandatory'">true</ui:param>
        <ui:param name="'class'">standardField</ui:param>
    </ui:textfield>

    <ui:textfield label="text('common.words.description')" name="'description'">
        <ui:param name="'class'">standardField</ui:param>
    </ui:textfield>

    <%@ include file="/secure/admin/views/issuetypes/typeicon.jsp"%>

</page:applyDecorator>

