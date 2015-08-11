<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title>
        <webwork:text name="'admin.externalimport.import.data'"><webwork:param name="'value0'"><webwork:property value="/title" /></webwork:param></webwork:text>
    </title>
</head>
<body>

<page:applyDecorator name="jiraform">
    <page:param name="action"><webwork:property value="/importActionName" />!import.jspa</page:param>
    <page:param name="cancelURI"><webwork:property value="/importActionName" />!default.jspa</page:param>
    <page:param name="submitId">externalimport_submit</page:param>
    <page:param name="submitName"><webwork:text name="'admin.externalimport.csv.begin.import'"/></page:param>
    <page:param name="autoSelectFirst">true</page:param>
    <page:param name="title"><webwork:text name="'admin.externalimport.import.data'"><webwork:param name="'value0'"><webwork:property value="/title" /></webwork:param></webwork:text></page:param>
    <page:param name="width">100%</page:param>
	<page:param name="description">
        <webwork:text name="'admin.externalimport.csv.choose.objects'"/>
        <webwork:if test="/doesImportExceedUserLimit == true">
            <p/>
            <div id="user_limit_warning" class="warningBox">
                <webwork:text name="'admin.externalimport.warn.user.limit.exceeded'">
                    <webwork:param name="'value0'"><webwork:property value="/unknownUsers/size"/></webwork:param>
                </webwork:text>
            </div>
        </webwork:if>
    </page:param>
    <script language="javascript" type="text/javascript">
        window.onload = function()
        {
            toggleWarningDisplay(true);
        }

        function toggleWarningDisplay(enable)
        {
            var element = document.getElementById('user_limit_warning');
            if (element)
            {
                if (enable == 'false' || !enable)
                {
                    element.style.display = 'none';
                }
                else
                {
                    element.style.display = 'block';
                }
            }
        }
    </script>


    <webwork:if test="/externalUserManagementEnabled == false">
        <ui:component label="text('admin.externalimport.create.new.users')" name="'importer/settings/userImportEnabled'"
                      value="/importer/settings/userImportEnabled"
                      template="radiotruefalse.jsp">
            <ui:param name="'description'">
            <webwork:text name="'admin.externalimport.create.new.users.description'"/>
            </ui:param>
            <ui:param name="'onclickTrue'">toggleWarningDisplay(this.value)</ui:param>
            <ui:param name="'onclickFalse'">toggleWarningDisplay(this.value)</ui:param>
        </ui:component>
    </webwork:if>
    <webwork:else>
        <ui:component template="textlabel.jsp" label="text('admin.externalimport.create.new.users')" value="text('admin.externalimport.users.do.not.exist.ext.user.management')"/>
        <ui:component template="hidden.jsp" name="'importer/settings/userImportEnabled'" value="false"/>
    </webwork:else>

    <ui:component label="text('admin.externalimport.create.new.versions')" name="'importer/settings/versionImportEnabled'"
                  value="/importer/settings/versionImportEnabled"
                  template="radiotruefalse.jsp">
        <ui:param name="'description'">
        <webwork:text name="'admin.externalimport.create.new.versions.description'"/>
        </ui:param>
    </ui:component>

    <ui:component label="text('admin.externalimport.create.new.components')" name="'importer/settings/componentImportEnabled'"
                  value="/importer/settings/componentImportEnabled"
                  template="radiotruefalse.jsp">
        <ui:param name="'description'">
        <webwork:text name="'admin.externalimport.create.new.components.description'"/>
        </ui:param>
    </ui:component>

    <ui:component label="text('admin.externalimport.create.new.custom.fields')" name="'importer/settings/customFieldCreationEnabled'"
                  value="/importer/settings/customFieldCreationEnabled"
                  template="radiotruefalse.jsp">
        <ui:param name="'description'">
        <webwork:text name="'admin.externalimport.create.new.custom.fields.description'"/>
        </ui:param>
    </ui:component>

    <ui:textfield label="text('admin.externalimport.maximum.issues.and.failures')" name="'importer/settings/maxIssueImported'" value="''">
		<ui:param name="'size'">10</ui:param>
		<ui:param name="'description'"><webwork:text name="'admin.externalimport.maximum.issues.and.failures.description'"/></ui:param>
	</ui:textfield>

    <ui:component name="'importLocation'" template="hidden.jsp" theme="'single'"/>
    <ui:component name="'configFileLocation'" template="hidden.jsp" theme="'single'"/>

</page:applyDecorator>

</body>
</html>
