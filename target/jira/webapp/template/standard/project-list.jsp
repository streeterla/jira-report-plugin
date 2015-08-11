<tr class="filter_list">
    <td class="colHeaderLink bolded" style="width:65%"><webwork:text name="'common.concepts.project'" /></td>
    <webwork:if test=". != null && ./empty != true">
        <td class="colHeaderLink bolded" style="width:10%"><webwork:text name="'common.concepts.key'" /></td>
        <td class="colHeaderLink bolded" style="width:25%"><webwork:text name="'common.concepts.projectlead'" /></td>
    </webwork:if>
</tr>
<webwork:if test=". != null && ./empty != true">
<webwork:iterator value="." status="'myStatus'">
    <tr id="pl_<webwork:property value="./id" />" class="<webwork:if test="@myStatus/modulus(2) == 1">rowNormal</webwork:if><webwork:else>rowAlternate</webwork:else>">
        <td >
            <webwork:property value="parameters['linkRenderer']/render(./id, ./name)" escape="false"/>
            <webwork:if test="./description != null && ./description/length > 0">
                <br/><span class="subText"><webwork:property value="./description" escape="false" /></span>
            </webwork:if>
        </td>
        <td><webwork:property value="./key"/></td>
        <td>
            <webwork:if test="./lead != null">
                <webwork:property value="./lead/fullName"/> (<webwork:property value="./lead/name"/>)
            </webwork:if>
            <webwork:else>
                <webwork:text name="'browse.projects.no.lead'" />
            </webwork:else>
        </td>
    </tr>
</webwork:iterator>
</webwork:if>