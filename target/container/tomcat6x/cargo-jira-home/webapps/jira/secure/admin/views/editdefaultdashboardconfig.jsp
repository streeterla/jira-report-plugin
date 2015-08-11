<%@ taglib prefix="webwork" uri="webwork" %>
<html>
    <head>
        <title><webwork:text name="'admin.globalsettings.defaultdashboard.configure.default.dashboard'" /></title>
        <%-- THIS IS A TOTAL HACK FOR SUMMIT! Once dashboards implements tabs properly: REMOVE!--%>
        <style type="text/css">
            .dashboard .dashboard-title {
                display:none !important;
            }

            .dashboard ul.menu {
                margin:0 !important;
            }
        </style>
        <%-- END TOTAL HACK--%>
    </head>
    <body>
        <div class="jiraform maxWidth">
            <div class="jiraformheader">
                <h3 class="formtitle"><webwork:text name="'admin.globalsettings.defaultdashboard.configure.default.dashboard'" /></h3>
                <br/>
                <webwork:text name="'admin.globalsettings.defaultdashboard.note'" value0="'<span class=\"note\">'" value1="'</span>'"/>
            </div>
            <div class="jiraformcontents"><webwork:property value="/dashboardHtml" escape="false"/></div>
        </div>
    </body>
    <%--## Need this at the bottom to make sure it overrides the dashboard decorator--%>
    <meta name="decorator" content="admin">
</html>
