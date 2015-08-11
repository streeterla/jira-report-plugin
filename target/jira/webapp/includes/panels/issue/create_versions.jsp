<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<webwork:if test="id == 'versions'">
        <webwork:property value="/field('versions')/createHtml(.., /)" escape="'false'" />
<%--    <webwork:if test="/possibleVersions(project)/size > 0">--%>
<%--        <ui:select label="text(./nameKey)" name="id" template="selectmultiple.jsp"--%>
<%--            list="/possibleVersionsReleasedFirst(/project)" listKey="'key'" listValue="'value'">--%>
<%--            <ui:param name="'size'" value="'5'" />--%>
<%--            <ui:param name="'headerrow'" value="text('common.words.unknown')" />--%>
<%--            <ui:param name="'headervalue'" value="'-1'" />--%>
<%--            <ui:param name="'description'"><webwork:property value="fieldDescription" escape="false" /></ui:param>--%>
<%--            <ui:param name="'mandatory'" value="../required"/>--%>
<%--        </ui:select>--%>
<%--    </webwork:if>--%>
<%--    <webwork:else>--%>
<%--        <tr>--%>
<%--            <td bgcolor=#fffff0 align=right><webwork:text name="'issue.field.affectsversions'"/>:</td>--%>
<%--            <td bgcolor=#ffffff valign=top>--%>
<%--            <webwork:text name="'common.words.unknown'"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </webwork:else>--%>
</webwork:if>

<webwork:if test="id == 'fixVersions'">
    <webwork:property value="/field('fixVersions')/createHtml(.., /)" escape="'false'" />

<%--    <webwork:if test="id == 'fixVersions' && /hasProjectPermission('resolve', project) == true">--%>
<%--        <webwork:if test = "possibleVersions(project)/size > 0">--%>
<%--            <ui:select label="text(./nameKey)" name="'fixVersions'" template="selectmultiple.jsp"--%>
<%--                list="possibleVersions(project)" listKey="'key'" listValue="'value'">--%>
<%--                <ui:param name="'size'" value="'5'" />--%>
<%--                <ui:param name="'headerrow'" value="text('common.words.unknown')" />--%>
<%--                <ui:param name="'headervalue'" value="'-1'" />--%>
<%--                <ui:param name="'description'"><webwork:property value="fieldDescription" escape="false" /></ui:param>--%>
<%--                <ui:param name="'mandatory'" value="../required"/>--%>
<%--            </ui:select>--%>
<%--        </webwork:if>--%>
<%--        <webwork:else>--%>
<%--            <tr>--%>
<%--                <td bgcolor=#fffff0 align=right><webwork:text name="'issue.field.fixversions'"/>:</td>--%>
<%--                <td bgcolor=#ffffff valign=top>--%>
<%--                <webwork:text name="'common.words.unknown'"/>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </webwork:else>--%>
<%--    </webwork:if>--%>
</webwork:if>
