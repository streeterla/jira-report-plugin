<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>



<table id="issuetypeschemes" class="grid maxWidth centred">
    <tr class="rowHeader">
        <th>
            <webwork:text name="'common.words.name'"/>
        </th>
        <th>
            <webwork:text name="'common.words.description'"/>
        </th>
        <th>
            <webwork:text name="'admin.common.words.options'"/>
        </th>
        <th>
            <webwork:text name="'common.concepts.projects'"/>
        </th>
        <th>
            <webwork:text name="'common.words.operations'"/>
        </th>
    </tr>

    <webwork:iterator value="/schemes" status="'status'">
    <tr <webwork:if test="$actionedSchemeId == ./id">class="rowHighlighted"</webwork:if><webwork:elseIf test="@status/modulus(2) == 0">class="rowAlternate"</webwork:elseIf>>
        <td><webwork:property value="name" /></td>
        <td><webwork:property value="description"/></td>

        <td>
        <webwork:property value="/options(.)" >
            <webwork:if test=". && ./size() > 0">
                <ul class="imagebacked">
                <webwork:iterator value="." status="'status2'">
                    <li style="background-image: url('<webwork:url value="./imagePath" />')"><webwork:property value="./name" /><webwork:if test="/default(./id, ../..) == true"> <span class="smallgrey">(<webwork:text name="'admin.common.words.default'"/>)</span></webwork:if></li>
                </webwork:iterator>
                </ul>
            </webwork:if>
            <webwork:else>
                <span class="errorText"><webwork:text name="'admin.issuesettings.no.issue.types.associated'"/></span>
            </webwork:else>
        </webwork:property>
        </td>

        <td>
        <webwork:if test="./global == true">
            <webwork:text name="'admin.issuesettings.global'"/>
        </webwork:if>
        <webwork:elseIf test="./associatedProjects && ./associatedProjects/size() > 0">
            <ul class="square_blue">
            <webwork:iterator value="./associatedProjects" status="'status2'">
                <li><a href="<webwork:url value="'/secure/project/ViewProject.jspa'" ><webwork:param name="'pid'" value="string('id')" /></webwork:url>"><webwork:property value="./string('name')" /></a></li>
            </webwork:iterator>
            </ul>
        </webwork:elseIf>
        <webwork:else>
            <span class="errorText"><webwork:text name="'admin.issuesettings.no.project'"/></span>
        </webwork:else>
        </td>

        <td class="nowrap">
            <a id="edit_<webwork:property value="id"/>" href="ConfigureOptionSchemes!default.jspa?fieldId=<webwork:property value="fieldId" />&schemeId=<webwork:property value="id"/>"><webwork:text name="'common.words.edit'"/></a>
            <webwork:if test="/default(.) != true">
            | <a id="associate_<webwork:property value="id"/>" href="AssociateIssueTypeSchemes!default.jspa?fieldId=<webwork:property value="fieldId" />&schemeId=<webwork:property value="id"/>"><webwork:text name="'admin.projects.schemes.associate'"/></a>
            </webwork:if>
            <webwork:else>
                | <a id="associate_<webwork:property value="id"/>" href="AssociateIssueTypeSchemesWithDefault!default.jspa?fieldId=<webwork:property value="fieldId" />&schemeId=<webwork:property value="id"/>"><webwork:text name="'admin.projects.schemes.associate'"/></a>
            </webwork:else>
            | <a id="copy_<webwork:property value="id"/>" href="ConfigureOptionSchemes!copy.jspa?fieldId=<webwork:property value="fieldId" />&schemeId=<webwork:property value="id"/>"><webwork:text name="'common.words.copy'"/></a>
            <webwork:if test="/default(.) != true">
            | <a id="delete_<webwork:property value="id"/>" href="DeleteOptionScheme!default.jspa?fieldId=<webwork:property value="fieldId" />&schemeId=<webwork:property value="id"/>"><webwork:text name="'common.words.delete'"/></a>
            </webwork:if>
        </td>
    </tr>
    </webwork:iterator>
</table>

<page:applyDecorator name="jiraform">
    <page:param name="action"><webwork:url page="ConfigureOptionSchemes!default.jspa"><webwork:param name="'fieldId'" value="fieldId" /></webwork:url></page:param>
    <page:param name="submitName"><webwork:property value="text('common.forms.add')"/></page:param>
    <page:param name="submitId">submitAdd</page:param>
    <page:param name="title"><webwork:text name="'admin.issuesettings.add.new.scheme'">
        <webwork:param name="'value0'"><webwork:property value="titleSingle" /></webwork:param>
    </webwork:text></page:param>

    <ui:textfield label="text('common.words.name')" name="'name'"  >
        <ui:param name="'mandatory'">true</ui:param>
        <ui:param name="'class'">standardField</ui:param>
    </ui:textfield>

    <ui:textfield label="text('common.words.description')" name="'description'" >
        <ui:param name="'class'">standardField</ui:param>
    </ui:textfield>

</page:applyDecorator>
