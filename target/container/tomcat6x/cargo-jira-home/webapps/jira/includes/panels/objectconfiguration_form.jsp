<webwork:if test="objectConfiguration/enabled(.) == true">
    <webwork:if test="objectConfiguration/fieldType(.)==0"><%-- STRING--%>
        <ui:textfield label="text(objectConfiguration/fieldName(.))" name="." value="paramValue(.)" size="40">
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
        </ui:textfield>
    </webwork:if>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==1"><%-- LONG --%>
        <ui:textfield label="text(objectConfiguration/fieldName(.))" name="." value="paramValue(.)" size="40">
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
        </ui:textfield>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==2 && objectConfiguration/fieldValues(.)/empty == false"><%-- SELECT --%>
        <ui:select label="text(objectConfiguration/fieldName(.))" name="." value="paramValue(.)" list="objectConfiguration/fieldValues(.)" listKey="'key'" listValue="'value'">
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
            <ui:param name="'internat'" value="objectConfiguration/i18NValues(.)"/>
        </ui:select>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==2 && objectConfiguration/fieldValues(.)/empty == true">
        <ui:component label="text(objectConfiguration/fieldName(.))" template="textlabel.jsp">
        <ui:param name="'texthtml'">
            <webwork:text name="'portlets.field.no.values'">
                <webwork:param name="'value0'"><webwork:text name="objectConfiguration/fieldName(.)"/></webwork:param>
            </webwork:text>
        </ui:param>
        </ui:component>
        <% request.setAttribute("jira.portletform.showsavebutton", Boolean.FALSE); %>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==3"><%-- HIDDEN --%>
        <ui:component name="." value="objectConfiguration/fieldDefault(.)" template="hidden.jsp" />
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==4"><%-- DATE --%>
        <ui:component name="." label="text(objectConfiguration/fieldName(.))" value="paramValue(.)" template="datepicker2.jsp">
            <ui:param name="'formname'" value="'jiraform'" />
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
        </ui:component>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==5"><%-- USER --%>
        <ui:component name="." label="text(objectConfiguration/fieldName(.))" value="paramValue(.)" template="userselect.jsp">
            <ui:param name="'formname'" value="'jiraform'" />
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
        </ui:component>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==7"><%-- TEXT --%>
        <ui:textarea label="text(objectConfiguration/fieldName(.))" name="." value="paramValue(.)" rows="10" cols="40">
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
            <ui:param name="'style'">width: 100%;</ui:param>
        </ui:textarea>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==8 && objectConfiguration/fieldValues(.)/empty == false"><%-- MULTISELECT --%>
        <ui:select template="selectmultiple.jsp" label="text(objectConfiguration/fieldName(.))" name="." value="paramValues(.)" list="objectConfiguration/fieldValues(.)" listKey="'key'" listValue="'value'">
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
            <ui:param name="'internat'" value="objectConfiguration/i18NValues(.)"/>
            <webwork:if test="objectConfiguration/fieldValues(.)/size() <= 5">
                <ui:param name="'size'" value="objectConfiguration/fieldValues(.)/size()"/>
            </webwork:if>
            <webwork:else>
                <ui:param name="'size'" value="5"/>
            </webwork:else>
        </ui:select>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==8 && objectConfiguration/fieldValues(.)/empty == true">
        <ui:component label="text(objectConfiguration/fieldName(.))" template="textlabel.jsp">
            <ui:param name="'texthtml'">
                <webwork:text name="'portlets.field.no.values'">
                    <webwork:param name="'value0'"><webwork:text name="objectConfiguration/fieldName(.)"/></webwork:param>
                </webwork:text>
            </ui:param>
        </ui:component>
        <% request.setAttribute("jira.portletform.showsavebutton", Boolean.FALSE); %>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==9"><%-- CHECKBOX --%>
        <ui:component name="." value="paramValue(.)" label="text(objectConfiguration/fieldName(.))" template="checkbox.jsp">
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
            <ui:param name="'fieldValue'">true</ui:param>
        </ui:component>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==10"><%-- CASCADINGSELECT --%>
        <ui:component label="text(objectConfiguration/fieldName(.))" name="." template="cascadingselect.jsp">
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
            <ui:param name="'internat'" value="objectConfiguration/i18NValues(.)"/>
            <ui:param name="'cascadeFrom'" value="objectConfiguration/fieldValues(.)/cascadeFrom"/>
            <ui:param name="'list'" value="objectConfiguration/fieldValues(.)"/>
            <ui:param name="'listClass'" value="'value/className'"/>
            <ui:param name="'listKey'" value="'key'"/>
            <ui:param name="'listValue'" value="'value/value'"/>
            <ui:param name="'value'" value="paramValue(.)"/>
        </ui:component>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==11"><%-- FILTERPICKER --%>
        <ui:component label="text(objectConfiguration/fieldName(.))" name="." template="filterpicker.jsp">
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
            <ui:param name="'value'" value="paramValue(.)"/>
            <ui:param name="'filtername'" value="filterName(.)"/>
        </ui:component>
    </webwork:elseIf>
    <webwork:elseIf test="objectConfiguration/fieldType(.)==12"><%-- FILTERPROJECTPICKER --%>
        <ui:component label="text(objectConfiguration/fieldName(.))" name="." template="filterprojectpicker.jsp">
            <ui:param name="'description'"><webwork:text name="objectConfiguration/fieldDescription(.)" /></ui:param>
            <ui:param name="'value'" value="paramValue(.)"/>
            <ui:param name="'filterprojectname'" value="filterProjectName(.)"/>
        </ui:component>
    </webwork:elseIf>
</webwork:if>
