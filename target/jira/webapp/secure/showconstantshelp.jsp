<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<html>
    <head>
        <title><webwork:text name="'showconstantshelp.title'"/></title>
    </head>
    <body class="lp">
    <div id="main-content">
        <div id="content" class="active-area">
        <webwork:bean name="'com.atlassian.jira.web.util.HelpUtil'" id="helpUtil" />
        <p><webwork:text name="'showconstantshelp.tracking.issues'"/></p>
        <p><webwork:text name="'showconstantshelp.associated.information'"/></p>
        <ul>
            <li>
                <webwork:text name="'showconstantshelp.associated.issuetype'">
                    <webwork:param name="'value0'"><a href="#IssueTypes"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </li>
            <li><webwork:text name="'showconstantshelp.associated.summary'"/></li>
            <li><webwork:text name="'showconstantshelp.associated.description'"/></li>
            <li><webwork:text name="'showconstantshelp.associated.project'"/></li>
            <li>
                <webwork:text name="'showconstantshelp.associated.components'">
                    <webwork:param name="'value0'"><a href=<webwork:property value="@helpUtil/helpPath('component_management')/url"/>></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </li>
            <li>
                <webwork:text name="'showconstantshelp.associated.affectedversions'">
                    <webwork:param name="'value0'"><a href=<webwork:property value="@helpUtil/helpPath('version_management')/url"/>></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </li>
            <li><webwork:text name="'showconstantshelp.associated.fixversions'"/></li>
            <li><webwork:text name="'showconstantshelp.associated.environment'"/></li>
            <li>
                <webwork:text name="'showconstantshelp.associated.priority'">
                    <webwork:param name="'value0'"><a href="#PriorityLevels"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </li>
            <li><webwork:text name="'showconstantshelp.associated.assignee'"/></li>
            <li><webwork:text name="'showconstantshelp.associated.reporter'"/></li>
            <li>
                <webwork:text name="'showconstantshelp.associated.status'">
                    <webwork:param name="'value0'"><a href="#StatusTypes"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </li>
            <li><webwork:text name="'showconstantshelp.associated.changehistory'"/></li>
            <li><webwork:text name="'showconstantshelp.associated.comments'"/></li>
            <li>
                <webwork:text name="'showconstantshelp.associated.resolution'">
                    <webwork:param name="'value0'"><a href="#ResolutionTypes"></webwork:param>
                    <webwork:param name="'value1'"></a></webwork:param>
                </webwork:text>
            </li>
        </ul>

        <a name="IssueTypes"></a>
        <h4><webwork:text name="'showconstantshelp.issuetypes.title'"/></h4>
        <div class="section">

            <p><webwork:text name="'showconstantshelp.issuetypes.description'"/></p>

            <webwork:if test="/subTasksEnabled == true">
                <h5><webwork:text name="'showconstantshelp.issuetypes.regular'"/></h5>
            </webwork:if>

            <dl>
            <webwork:iterator value="issueTypes">
                <%-- Get the Issue Type Object Instead --%>
                <webwork:property value="/issueType(./string('id'))">
                <dt>
                    <webwork:component name="'issuetype'" template="constanticon.jsp">
                        <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                        <webwork:param name="'iconurl'" value="./iconUrl" />
                        <webwork:param name="'title'"><webwork:property value="./descTranslation()"/></webwork:param>
                    </webwork:component>
                    <webwork:property value="./nameTranslation()"/>
                </dt>
                <dd><webwork:property value="./descTranslation()"/></dd>
                </webwork:property>
            </webwork:iterator>
            </dl>

            <webwork:if test="/subTasksEnabled == true">
                <h5><webwork:text name="'showconstantshelp.issuetypes.subtasks'"/></h5>

                <dl>
                <webwork:iterator value="/subTaskIssueTypes">
                    <%-- Get the Issue Type Object Instead --%>
                    <webwork:property value="/issueType(./string('id'))">
                    <dt>
                        <webwork:component name="'issuetype'" template="constanticon.jsp">
                            <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                            <webwork:param name="'iconurl'" value="./iconUrl" />
                            <webwork:param name="'title'"><webwork:property value="./descTranslation()"/></webwork:param>
                        </webwork:component>
                        <webwork:property value="./nameTranslation()"/>
                    </dt>
                    <dd><webwork:property value="./descTranslation()"/></dd>
                    </webwork:property>
                </webwork:iterator>
                </dl>
            </webwork:if>
        </div>

        <a name="PriorityLevels"></a>
        <h4><webwork:text name="'showconstantshelp.priority.title'"/></h4>
        <div class="section">

            <p><webwork:text name="'showconstantshelp.priority.description'"/></p>

            <dl>
            <webwork:iterator value="priorities">
                <dt>
                    <webwork:component name="'priority'" template="constanticon.jsp">
                        <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                        <webwork:param name="'iconurl'" value="./iconUrl" />
                        <webwork:param name="'title'"><webwork:property value="./descTranslation()"/></webwork:param>
                    </webwork:component>
                    <webwork:property value="./nameTranslation()"/>
                </dt>
                <dd><webwork:property value="./descTranslation()"/></dd>
            </webwork:iterator>
            </dl>

        </div>

        <a name="StatusTypes"></a>
        <h4><webwork:text name="'showconstantshelp.status.title'"/></h4>
        <div class="section">

            <p><webwork:text name="'showconstantshelp.status.description'"/></p>

            <dl>
            <webwork:iterator value="statuses">
                <dt>
                    <webwork:component name="'status'" template="constanticon.jsp">
                        <webwork:param name="'contextPath'"><%= request.getContextPath() %></webwork:param>
                        <webwork:param name="'iconurl'" value="./iconUrl" />
                        <webwork:param name="'title'"><webwork:property value="./descTranslation()"/></webwork:param>
                    </webwork:component>
                    <webwork:property value="./nameTranslation()"/>
                </dt>
                <dd><webwork:property value="./descTranslation()"/></dd>
            </webwork:iterator>
            </dl>

        </div>

        <a name="ResolutionTypes"></a>
        <h4><webwork:text name="'showconstantshelp.resolution.title'"/></h4>
        <div class="section">

            <p><webwork:text name="'showconstantshelp.resolution.description'"/></p>

            <dl>
            <webwork:iterator value="resolutions">
                <dt><webwork:property value="./nameTranslation()"/></dt>
                <dd><webwork:property value="./descTranslation()"/> </dd>
            </webwork:iterator>
            </dl>

        </div>

        <webwork:if test="securityLevels != null && securityLevels/size > 0">
        <a name="SecurityLevels"></a>
        <h4><webwork:text name="'showconstantshelp.securitylevel.title'"/></h4>
        <div class="section">

            <p><webwork:text name="'showconstantshelp.securitylevel.description'"/></p>

            <dl>
            <webwork:iterator value="securityLevels">
                <dt><webwork:property value="./string('name')"/></dt>
                <dd><webwork:property value="./string('description')"/> </dd>
            </webwork:iterator>
            </dl>

        </div>
        </webwork:if>

    </div>
    </div>
</body>
</html>
