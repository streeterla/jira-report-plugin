<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
    <title>
        <webwork:text name="'admin.project.import.results.title'"/>
    </title>
</head>
<body>
<page:applyDecorator name="jiraform">
    <page:param name="action">ProjectImportResults!ViewNewProject.jspa</page:param>
    <page:param name="columns">1</page:param>
    <page:param name="submitId">ok_submit</page:param>
    <page:param name="submitName"><webwork:text name="'admin.common.words.ok'"/></page:param>
    <page:param name="title"><webwork:text name="'admin.project.import.results.title'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">restore_project</page:param>
    <page:param name="autoSelectFirst">false</page:param>
    <page:param name="description">
        <!-- This is the case where the import completed AND there were no errors -->
        <webwork:if test="/projectImportResults/importCompleted == true  && /projectImportResults/errors/size() == 0">
            <webwork:text name="'admin.project.import.results.desc.completed'">
                <webwork:param name="'value0'"><webwork:property value="/prettyImportDuration" /></webwork:param>
            </webwork:text>
        </webwork:if>
        <!-- This is the case where the import DID complete AND the import was was successful but there were some errors, but these were below the limit-->
        <webwork:elseIf test="/projectImportResults/importCompleted == true && /projectImportResults/errors/size() > 0">
            <webwork:text name="'admin.project.import.results.desc.completed.with.errors'">
                <webwork:param name="'value0'"><webwork:property value="/prettyImportDuration" /></webwork:param>
            </webwork:text>
            <p/>
            <div class="noteBox">
                <webwork:text name="'admin.project.import.results.complete.with.errors'"/>
            </div>
        </webwork:elseIf>
        <!-- This is the case where the import just did not complete and the import was NOT successful-->
        <webwork:elseIf test="/projectImportResults/importCompleted == false ">
            <webwork:text name="'admin.project.import.results.desc.not.completed'">
                <webwork:param name="'value0'"><webwork:property value="/prettyImportDuration" /></webwork:param>
            </webwork:text>
            <webwork:if test="/projectImportResults/importedProject != null">
                <p/>
                <webwork:text name="'admin.project.import.results.desc.not.completed.delete.project'">
                    <webwork:param name="'value0'"><a href="<%=request.getContextPath()%>/secure/project/DeleteProject!default.jspa?pid=<webwork:property value="/projectImportResults/importedProject/id"/>"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </webwork:if>

        </webwork:elseIf>
    </page:param>

    <tr>
        <td class="jiraformbody" id="projectimport">
            <div id="summary">
                <div id="systemfields">
                    <h3 class="results_header"><webwork:text name="'common.concepts.projectsummary'"/></h3>
                    <ul class="results_list">
                        <webwork:if test="/projectImportResults/importedProject == null">
                            <li class="results_field first">
                                <div class="field_label"><webwork:text name="'admin.project.import.results.no.project.created'"/></div>
                                <div class="field_description">&nbsp;</div>
                            </li>
                        </webwork:if>
                        <webwork:else>
                            <li class="results_field first">
                                <div class="field_label"><webwork:text name="'common.concepts.key'"/>:</div>
                                <div class="field_description"><a href="ProjectImportResults!ViewNewProject.jspa"><webwork:property value="/projectImportResults/importedProject/key"/></a>&nbsp;</div>
                            </li>
                            <li class="results_field">
                                <div class="field_label"><webwork:text name="'admin.project.import.select.project.proj.desc'"/>:</div>
                                <div class="field_description"><webwork:property value="/projectImportResults/importedProject/description"/>&nbsp;</div>
                            </li>
                            <li class="results_field">
                                <div class="field_label"><webwork:text name="'admin.project.import.select.project.proj.lead'"/>:</div>
                                <div class="field_description"><webwork:property value="/projectImportResults/importedProject/lead/fullName"/>&nbsp;</div>
                            </li>
                            <li class="results_field">
                                <div class="field_label"><webwork:text name="'admin.project.import.select.project.proj.url'"/>:</div>
                                <div class="field_description"><webwork:property value="/projectImportResults/importedProject/url"/>&nbsp;</div>
                            </li>
                            <li class="results_field">
                                <div class="field_label"><webwork:text name="'admin.project.import.select.project.proj.sender.address'"/>:</div>
                                <div class="field_description"><webwork:property value="/projectEmail(/projectImportResults/importedProject)" />&nbsp;</div>
                            </li>
                            <li class="results_field">
                                <div class="field_label"><webwork:text name="'admin.project.import.select.project.proj.default.assignee'"/>:</div>
                                <div class="field_description"><webwork:property value="/assigneeTypeString(/projectImportResults/importedProject/assigneeType)"/>&nbsp;</div>
                            </li>
                            <li class="results_field">
                                <div class="field_label"><webwork:text name="'admin.project.import.select.project.proj.components'"/>:</div>
                                <div class="field_description"><webwork:property value="/projectImportResults/importedProject/components/size()"/>&nbsp;</div>
                            </li>
                            <li class="results_field last">
                                <div class="field_label"><webwork:text name="'admin.project.import.select.project.proj.versions'"/>:</div>
                                <div class="field_description"><webwork:property value="/projectImportResults/importedProject/versions/size()"/>&nbsp;</div>
                            </li>
                        </webwork:else>
                        <webwork:if test="/projectImportResults/errors/size() > 0">
                            <h3 class="results_header"><webwork:text name="'panel.errors'"/></h3>
                            <div class="notification"><webwork:text name="'admin.project.import.results.view.your.logs'"/>&nbsp;</div>
                            <ul id="results_error_list">
                                <webwork:iterator value="/projectImportResults/errors">
                                    <li class="results_field">
                                        <div class="field_error"><img src="<%= request.getContextPath() %>/images/icons/cancel.png" alt="" title="Error"><webwork:property value="."/></div>
                                    </li>
                                </webwork:iterator>
                            </ul>
                        </webwork:if>
                    </ul>
                </div>

                <div id="customfields">
                    <h3 class="results_header"><webwork:text name="'admin.common.words.users'"/></h3>
                    <ul>
                        <li class="results_field only">
                            <webwork:if test="/projectImportResults/usersCreatedCount == 0 && /projectImportResults/expectedUsersCreatedCount == 0">
                                <div class="field_label"><webwork:text name="'admin.project.import.results.no.users.created'"/></div>
                                <div class="field_description">&nbsp;</div>
                            </webwork:if>
                            <webwork:else>
                                <div class="field_label"><webwork:text name="'admin.common.words.users'"/>:</div>
                                <div class="field_description">
                                    <webwork:text name="'admin.project.import.results.x.out.of.x'">
                                        <webwork:param name="'value0'"><webwork:property value="/projectImportResults/usersCreatedCount"/></webwork:param>
                                        <webwork:param name="'value1'"><webwork:property value="/projectImportResults/expectedUsersCreatedCount"/></webwork:param>
                                    </webwork:text>&nbsp;
                                </div>
                            </webwork:else>
                        </li>
                    </ul>
                    <h3 class="results_header"><webwork:text name="'admin.projects.project.roles'"/></h3>
                    <ul>
                        <webwork:if test="/projectImportResults/roles/size() > 0">
                            <webwork:iterator value="/projectImportResults/roles">
                                <li class="results_field first">
                                    <div class="field_label"><webwork:property value="."/>:</div>
                                    <div class="field_description"><webwork:property value="/projectImportResults/usersCreatedCountForRole(.)"/> <webwork:text name="'admin.project.import.results.users'"/>, <webwork:property value="/projectImportResults/groupsCreatedCountForRole(.)"/> <webwork:text name="'admin.project.import.results.groups'"/>&nbsp;</div>
                                </li>
                            </webwork:iterator>
                        </webwork:if>
                        <webwork:else>
                            <li class="results_field first">
                                <div class="field_label"><webwork:text name="'admin.project.import.results.no.members.created'"/></div>
                                <div class="field_description">&nbsp;</div>
                            </li>
                        </webwork:else>
                    </ul>
                    <h3 class="results_header"><webwork:text name="'admin.project.import.select.project.proj.isssues'"/></h3>
                    <ul>
                        <li class="results_field first">
                            <webwork:if test="/projectImportResults/issuesCreatedCount == 0 && /projectImportResults/expectedIssuesCreatedCount == 0">
                                <div class="field_label"><webwork:text name="'admin.project.import.results.no.issues.created'"/></div>
                                <div class="field_description">&nbsp;</div>
                            </webwork:if>
                            <webwork:else>
                                <div class="field_label"><webwork:text name="'admin.project.import.results.issues.created'"/>:</div>
                                <div class="field_description">
                                    <webwork:text name="'admin.project.import.results.x.out.of.x'">
                                        <webwork:param name="'value0'"><webwork:property value="/projectImportResults/issuesCreatedCount"/></webwork:param>
                                        <webwork:param name="'value1'"><webwork:property value="/projectImportResults/expectedIssuesCreatedCount"/></webwork:param>
                                    </webwork:text>&nbsp;
                                </div>
                            </webwork:else>
                        </li>
                        <li class="results_field">
                            <webwork:if test="/projectImportResults/attachmentsCreatedCount == 0 && /projectImportResults/expectedAttachmentsCreatedCount == 0">
                                <div class="field_label"><webwork:text name="'admin.project.import.results.no.attachments.created'"/></div>
                                <div class="field_description">&nbsp;</div>
                            </webwork:if>
                            <webwork:else>
                                <div class="field_label"><webwork:text name="'common.concepts.attachments.files'"/>:</div>
                                <div class="field_description">
                                    <webwork:text name="'admin.project.import.results.x.out.of.x'">
                                        <webwork:param name="'value0'"><webwork:property value="/projectImportResults/attachmentsCreatedCount"/></webwork:param>
                                        <webwork:param name="'value1'"><webwork:property value="/projectImportResults/expectedAttachmentsCreatedCount"/></webwork:param>
                                    </webwork:text>&nbsp;
                                </div>
                            </webwork:else>
                        </li>
                    </ul>
                </div>

            </div>
        </td>
    </tr>
</page:applyDecorator>

</body>
</html>