
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.cvsmodules.code.repositories'"/></title>
</head>

<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.menu.globalsettings.cvs.modules'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">cvs_integration</page:param>
    <p>
    <webwork:text name="'admin.cvsmodules.description'"/>
    </p>
    <webwork:if test="/systemAdministrator == true">
    <p>
        <img src="<%= request.getContextPath() %>/images/icons/bullet_creme.gif" height=8 width=8 border=0>
        <webwork:text name="'admin.cvsmodules.add.new.cvs.module'">
            <webwork:param name="'value0'"><a id="add_cvs_module" href="AddRepository!default.jspa"><b></webwork:param>
            <webwork:param name="'value1'"></b></a></webwork:param>
        </webwork:text>
        </p>
    </webwork:if>
    <webwork:else>
        <webwork:text name="'admin.errors.must.be.sys.admin.to.create'">
            <webwork:param name="'value0'"><a href="<%= request.getContextPath() %>/secure/Administrators.jspa"></webwork:param>
            <webwork:param name="'value1'"></a></webwork:param>
        </webwork:text>
    </webwork:else>
</page:applyDecorator>

<p>

    <table align=center bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0" width=90%><tr><td>
    <table id="cvs_modules_table" border="0" cellpadding="3" cellspacing="1" width=100%>
        <tr bgcolor=#f0f0f0>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.name'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'admin.common.words.details'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.concepts.projects'"/></b>
            </td>
            <td class="colHeaderLink">
                <b><webwork:text name="'common.words.operations'"/></b>
            </td>
        </tr>

        <webwork:iterator value="repositories" status="'status'">
        <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
            <td valign=top>
                <b><webwork:property value="name"/></b>

                <webwork:if test="description">
                    <br>
                    <font size=1><webwork:property value="description"/></font>
                </webwork:if>
            </td>
            <td valign=top>
                <b><webwork:text name="'admin.cvsmodules.log.file.path'"/></b>:
                <webwork:if test="./cvsLogFilePath">
                     <webwork:property value="./cvsLogFilePath" /><br>
                </webwork:if>
                <webwork:else>
                    <span class="warning"><webwork:text name="'admin.cvsmodules.not.set'"/></span><br>
                </webwork:else>
                <b><webwork:text name="'admin.cvsmodules.cvs.root'"/></b>: <webwork:property value="./cvsRoot" /><br>
                <b><webwork:text name="'admin.cvsmodules.module.name'"/></b>: <webwork:property value="./moduleName" /><br>
                <b><webwork:text name="'admin.cvsmodules.log.retrieval'"/></b>: <webwork:if test="./fetchLog == true"><webwork:text name="'admin.cvsmodules.periodic.retrieval'"/></webwork:if><webwork:else><webwork:text name="'admin.cvsmodules.log.needs.manual.update'"/></webwork:else><br>
                <b><webwork:text name="'admin.cvsmodules.cvs.timeout'"/></b>: <webwork:property value="./cvsTimeoutStringInSeconds" /> seconds<br>                
                <webwork:property value="/viewCVSBaseUrl(.)">
                    <b><webwork:text name="'admin.cvsmodules.viewcvs.url'"/></b>: <webwork:property />
                    <webwork:if test=". != ''">
                        <br><b><webwork:text name="'admin.cvsmodules.viewcvs.root.param'"/></b>: <webwork:property value="/viewCVSRootParameter(..)" />
                    </webwork:if>
                </webwork:property>
            </td>
            <td valign=top>
                <webwork:if test="/projects(.) != null && /projects(.)/empty == false">
                    <webwork:iterator value="/projects(.)">
                        <img src="<%= request.getContextPath() %>/images/icons/bullet_blue.gif" height=8 width=8 border=0 align=absmiddle>
                        <a href="<%= request.getContextPath() %>/secure/project/ViewProject.jspa?pid=<webwork:property value="long('id')" />"><webwork:property value="./string('name')" /></a><br>
                    </webwork:iterator>
                </webwork:if>
                <webwork:else>
                    &nbsp;
                </webwork:else>
            </td>

            <td valign=top align=left>
                <webwork:if test="/systemAdministrator == true">
                    <a id="edit_<webwork:property value="id"/>" href="UpdateRepository!default.jspa?id=<webwork:property value="id"/>"><webwork:text name="'common.words.edit'"/></a>
                    | <a id="test_<webwork:property value="id"/>" href="<webwork:url value="'RepositoryTest.jspa'"><webwork:param name="'id'" value="id"/></webwork:url>"><webwork:text name="'admin.common.words.test'"/></a>
                    <webwork:if test="/deletable(.) == true">
                        | <a id="delete_<webwork:property value="id"/>" href="DeleteRepository!default.jspa?id=<webwork:property value="id"/>"><webwork:text name="'common.words.delete'"/></a>
                    </webwork:if>
                </webwork:if>
            </td>
        </tr>
        </webwork:iterator>
        <webwork:if test="repositories/size == 0">
            <tr>
                <td colspan=4 bgcolor=#ffffff>
                    <webwork:text name="'admin.cvsmodules.no.modules.configured'"/>
                </td>
            </tr>
        </webwork:if>
    </table>
    </td></tr></table>

</p>



</body>
</html>
