<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><webwork:text name="'admin.edit.user.projectroles.title'"/></title>
</head>

<body>

<style type="text/css">
    .selectedPreview {
        border: 1px solid gray;
        background-color: #E8F1FF;
        padding: 0 10px
    }

    .projectselect a {
        text-decoration: none;
    }

    .projectselect a:hover {
        text-decoration: underline;
    }

</style>

<script type="text/javascript" language="JavaScript">

var projectSelectShown = false;
var projectRoleIds = new Array(<webwork:iterator value="/allProjectRoles" status="'status'">'<webwork:property value="./id"/>' <webwork:if test="@status/last == false">, </webwork:if></webwork:iterator>);

window.onload = function()
{
    setProjectSelectTop();

    var projectSelectHeight = document.getElementById("projectselect").offsetHeight;
    if (projectSelectHeight > 400)
    {
        document.getElementById("projectselect").style.height = '400px';
    }
    //    alert(document.getElementById("projectselect").offsetHeight);
    document.getElementById("projectselect").style.display = 'none';
    document.getElementById("projectselect").style.visibility = 'visible';
}

function selectProject(projectIds)
{
    document.forms['edituserprojectroles'].action = 'EditUserProjectRoles!refresh.jspa';
    document.getElementById("projects_to_add").value = projectIds;
    document.forms['edituserprojectroles'].submit();
    return false;
}

function unselectRoleForCategory(categoryId, roleId)
{
    var categoryTDs = getElementsByName("td", "category_" + categoryId);

    var controlCheckbox = document.getElementById(roleId + "_check_" + categoryId);
    var check = controlCheckbox.checked;

    // run through all the checkboxes in the row and uncheck
    for (var i = 0; i < categoryTDs.length; i++)
    {
        var categoryTD = categoryTDs[i];
        for (var j = 0; j < categoryTD.childNodes.length; j++)
        {
            var child = categoryTD.childNodes[j];

            if (child.type && child.type.indexOf("checkbox") != -1)
            {
                if (child.id.indexOf("_" + roleId) != -1)
                {
                    child.checked = check;
                }
            }
        }
    }

    return false;
}

function getElementsByName(tag, name)
{
    var elem = document.getElementsByTagName(tag);
    var arr = new Array();
    for (i = 0,iarr = 0; i < elem.length; i++)
    {
        att = elem[i].getAttribute("name");
        if (att == name)
        {
            arr[iarr] = elem[i];
            iarr++;
        }
    }
    return arr;
}

function toggleProjectSelect()
{
    if (projectSelectShown)
    {
        projectSelectShown = false;
        document.getElementById("projectselect").style.display = 'none';
        document.getElementById("add_project_link_img").src = '<%=request.getContextPath()%>/images/icons/navigate_right_10.gif';
    }
    else
    {
        projectSelectShown = true;
        document.getElementById("projectselect").style.display = '';
        document.getElementById("add_project_link_img").src = '<%=request.getContextPath()%>/images/icons/navigate_down_10.gif';
        setProjectSelectTop();
    }
    return false;
}

function setProjectSelectTop()
{
    var projectSelect = document.getElementById("projectselect");
    projectSelect.style.top = findPos(document.getElementById("add_project_link"))[1];
}

function findPos(obj)
{
    var curleft = curtop = 0;
    if (obj.offsetParent)
    {
        curleft = obj.offsetLeft;
        curtop = obj.offsetTop;
        while (obj = obj.offsetParent)
        {
            curleft += obj.offsetLeft;
            curtop += obj.offsetTop;
        }
    }
    return [curleft,curtop];
}

</script>

<page:applyDecorator name="jiraform">
    <page:param name="title"><webwork:text name="'admin.edit.user.projectroles.title'"/>: <webwork:property value="/projectRoleEditUser/fullName"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">users</page:param>
    <page:param name="helpURLFragment">#Assigning+a+User+to+a+Project+Role</page:param>    
    <page:param name="description">

        <webwork:text name="'admin.edit.user.projectroles.description.1'"/><p/>
        <webwork:text name="'admin.edit.user.projectroles.description.2'"/><p/>
        <webwork:text name="'admin.edit.user.projectroles.description.3'"/>&nbsp;

        <webwork:if test="/enterprise == true">
            <webwork:text name="'admin.edit.user.projectroles.description.4.a'"/>
        </webwork:if>
        <webwork:else>
            <webwork:text name="'admin.edit.user.projectroles.description.4.b'"/>
        </webwork:else>
    </page:param>
</page:applyDecorator>

<form method="post" action="EditUserProjectRoles.jspa" name='edituserprojectroles'>
<webwork:component name="'atl_token'" value="/xsrfToken" template="hidden.jsp"/>    

<p/>

<div id="add_project_link" class="defaultWidth centered" align="left">
    <span style="cursor:pointer; text-decoration:underline;color:#003366;text-align:left;"
     onclick="toggleProjectSelect(); return false;" title="<webwork:text name="'admin.edit.user.projectroles.add.to.view'"/>"
            ><webwork:text name="'admin.edit.user.projectroles.add.project'"/>&nbsp;<img src="<%=request.getContextPath()%>/images/icons/navigate_right_10.gif" id='add_project_link_img' style="vertical-align:middle;"/>
        </span>
</div>

<div class="selectedPreview" id="projectselect"
     style="visibility:hidden; position: absolute; top: 125px; left: 320px; padding: 0.5em;overflow:auto;float:right;">

    <table>
        <tr>
            <td valign="top">
                <img style="float:right;" onclick="toggleProjectSelect(); return false;"
                     src="<%=request.getContextPath()%>/images/icons/close.png" title="close" alt="close"/>
            </td>
            <td>
                <webwork:if test="/allProjectCategories/size != 0">
                    <b><webwork:text name="'admin.view.user.projectroles.project.category'"/>:</b><br/>
                </webwork:if>
                <webwork:iterator value="/allProjectCategories">
                    <webwork:if
                            test="/allProjectsForCategory(.)/size != 0 && /allProjectsInCategoryVisible(.) == false">

                <span class="projectselect" id="project_category_link_<webwork:property value="./long('id')"/>">
                    &nbsp;
                    <a href="#"
                       onclick="return selectProject(new Array( <webwork:iterator value="allProjectsForCategory(.)" status="'status'"> '<webwork:property value="./id"/>' <webwork:if test="@status/last == false">,</webwork:if> </webwork:iterator> )); return false;">
                        <webwork:property value="./string('name')"/></a>
                    <br/>
                </span>
                        <webwork:iterator value="/allProjectsForCategory(.)">
                            <webwork:if test="/currentVisibleProjects/contains(.) == false">
                        <span class="projectselect" id="project_link_<webwork:property value="./id"/>">
                            &nbsp;&nbsp;&nbsp; - &nbsp;
                            <a href="#"
                               onclick="return selectProject(new Array('<webwork:property value="./id"/>')); return false;">
                                <webwork:property value="./name"/></a>
                            <br/>
                        </span>
                            </webwork:if>
                        </webwork:iterator>
                    </webwork:if>
                </webwork:iterator>
                <b><webwork:if test="/enterprise == true"><webwork:text name="'admin.view.user.projectroles.project.category.uncategorised'"/></webwork:if><webwork:else><webwork:text name="'admin.view.user.projectroles.project.all.projects'"/></webwork:else>:</b><br/>
                <webwork:iterator value="/allProjectsWithoutCategory">
                    <webwork:if test="/currentVisibleProjects/contains(.) == false">
                <span class="projectselect" id="project_link_<webwork:property value="./id"/>">
                    &nbsp;
                    <a href="#"
                       onclick="return selectProject(new Array('<webwork:property value="./id"/>')); return false;"
                       title="<webwork:property value="./description"/>">
                        <webwork:property value="./name"/></a>
                    <br/>
                </span>
                    </webwork:if>
                </webwork:iterator>
            </td></tr></table>
</div>

<p/>

<webwork:if test="/visibleProjectsByCategory/size != 0">
<table id="projecttable" class="defaultWidth centered" style="border-collapse:collapse;">
    <!-- This is a row for the category which is kinda like a header-->
    <tr class="formtitle grid">
        <th style="font-size:13px; width:25%;"><webwork:text name="'common.concepts.projects'"/></th>
        <webwork:iterator value="allProjectRoles">
            <th style="font-size:13px;width:<webwork:property value="/projectRoleColumnWidth"/>%;"><webwork:property
                    value="./name"/>
            </th>
        </webwork:iterator>
    </tr>

<webwork:iterator value="/visibleProjectsByCategory">

    <tr style="border:none;"><td colspan="<webwork:property value="allProjectRoles/size + 1"/>">&nbsp;</td></tr>
        <tr class="grid">
            <th style="font-size:13px; width:25%;"><webwork:if test="key != null"><webwork:text name="'admin.edit.user.projectroles.project.categories'"/> : <webwork:property
                    value="key/string('name')"/></webwork:if>
                <webwork:else><webwork:text name="'admin.view.user.projectroles.project.category.uncategorised'"/></webwork:else>
            </th>
            <webwork:iterator value="allProjectRoles">
                <th style="font-size:13px;width:<webwork:property value="/projectRoleColumnWidth"/>%;">
                    <input type="checkbox"
                           id="<webwork:property value="./id"/>_check_<webwork:if test="key != null"><webwork:property value="key/string('id')"/></webwork:if><webwork:else>0</webwork:else>"
                           onclick="unselectRoleForCategory(<webwork:if test="key != null"><webwork:property value="key/string('id')"/></webwork:if><webwork:else>0</webwork:else>, <webwork:property value="./id"/> );"/>
                </th>
            </webwork:iterator>
        </tr>

        <webwork:iterator value="value">
            <tr name="project" id="project_<webwork:property value="./id" />" class="grid">
                <td>&nbsp;&nbsp;<webwork:property value="./name"/>
                    <input type="hidden"
                           id="project_shown"
                           name="project_shown"
                           value="<webwork:property value='./id'/>"/>

                </td>
                <webwork:iterator value="allProjectRoles">
                    <td name="category_<webwork:if test="../../key != null"><webwork:property value="../../key/string('id')"/></webwork:if><webwork:else>0</webwork:else>">
                        <input type="checkbox"
                               id="<webwork:property value="../id"/>_<webwork:property value="./id"/>"
                               name="<webwork:property value="../id"/>_<webwork:property value="./id"/>"
                                <webwork:if test="/roleForProjectSelected(., ..) == true">checked</webwork:if> />
                        <input type="hidden" 
                               id="<webwork:property value='../id'/>_<webwork:property value='./id'/>_orig"
                               name="<webwork:property value='../id'/>_<webwork:property value='./id'/>_orig"
                               value="<webwork:property value='/userInProjectRoleTypeUser(., ..)'/>"/>
                        <webwork:if test="/userInProjectRoleOtherType(., ..) != null">
                            <span title="<webwork:text name="'admin.view.user.projectroles.group.association'"/>: <webwork:property
                                    value="/userInProjectRoleOtherType(., ..)"/>" style="color:dimgray;">(<webwork:property
                                    value="/userInProjectRoleOtherType(., ..)"/>)</span>
                        </webwork:if>
                    </td>
                </webwork:iterator>
            </tr>
        </webwork:iterator>
</webwork:iterator>
    </table>
<p/>
</webwork:if>
<webwork:else>
    <table class="defaultWidth centered">
        <tr>
            <td>
                <p/>
                <span>
                    <webwork:text name="'admin.view.user.projectroles.noprojects.found'"/>
                </span>
            </td>
        </tr>
        </table>
</webwork:else>


<div class="defaultWidth" align="center">
    <webwork:if test="/visibleProjectsByCategory/size != 0">
        <input type="submit" name="<webwork:text name="'common.words.save'"/>" value="<webwork:text name="'common.words.save'"/>"/>
    </webwork:if>
    <input id="cancelButton" accesskey="<webwork:text name="'common.forms.cancel.accesskey'" />"
           title="<webwork:property value="text('common.forms.cancel')"/> (<webwork:property value="@modifierKey"/> + <webwork:text name="'common.forms.cancel.accesskey'" />)"
           type="button"
           value="<webwork:property value="text('common.forms.cancel')"/>"
           onclick="location.href='<webwork:url page="ViewUserProjectRoles!default.jspa"><webwork:param name="'name'" value="name" /></webwork:url>'"/>
</div>
<ui:component name="'name'" template="hidden.jsp" theme="'single'"  />
<input type="hidden" name="projects_to_add" id="projects_to_add" value=""/>
</form>

</body>
</html>
