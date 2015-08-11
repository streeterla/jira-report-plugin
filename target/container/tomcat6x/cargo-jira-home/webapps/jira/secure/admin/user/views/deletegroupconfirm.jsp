<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.deletegroup.title'">
	    <webwork:param name="'value0'"><webwork:property value="name" /></webwork:param>
	</webwork:text></title>
</head>

<body>
        <page:applyDecorator name="jiraform">
            <page:param name="description">
                <p>
                <webwork:text name="'admin.deletegroup.users.must.be.removed.first'"/>
                </p>
                <p>
                <webwork:text name="'admin.deletegroup.will.not.delete.users'"/>
                </p>
                <webwork:if test="hasSubscriptions == true">
                <tr>
                    <td class="jiraformheader">
                    <div class="errorArea">
                        <h4><webwork:text name="'admin.deletegroup.subscriptions.header'"/></h4>
                        <ul>
                        <webwork:iterator value="subscriptions">
                        <li><webwork:property /></li>
                        </webwork:iterator>
                        </ul>
                    </div>
                    <webwork:text name="'admin.deletegroup.subscriptions.footer'"/>
                    </td>
                </tr>
                </webwork:if>
           </page:param>

            <page:param name="title"><webwork:text name="'admin.deletegroup.title'">
                <webwork:param name="'value0'"><webwork:property value="name" /></webwork:param>
            </webwork:text></page:param>
            <page:param name="width">100%</page:param>
            <page:param name="action">DeleteGroup.jspa</page:param>
            <page:param name="cancelURI">GroupBrowser.jspa</page:param>



            <!-- Only add delete controls if user is allowed to delete the selected group -->
            <webwork:if test="/hasAnyErrors() == false">
                <page:param name="submitId">delete_submit</page:param>
                <page:param name="submitName"><webwork:text name="'common.words.delete'"/></page:param>
                <page:param name="autoSelectFirst">false</page:param>

                <webwork:if test="matchingCommentsAndWorklogsCount > 0">
                <tr>
                    <td bgcolor=#ffffff>&nbsp;</td>
                    <td bgcolor=#ffffff>
                        <webwork:text name="'admin.deletegroup.invisible.comments'">
                            <webwork:param name="'value0'"><p></webwork:param>
                        </webwork:text>
                        <p>
                        <webwork:text name="'admin.deletegroup.move.comments.to.be.seen.by'"/>
                        <select name="swapGroup">
                            <webwork:iterator value="otherGroups">
                            <option value="<webwork:property value="." />" selected>
                                <webwork:property value="." />
                            </option>
                            </webwork:iterator>
                        </select>
                    </td>
                </tr>
                </webwork:if>

                <ui:component name="'name'" template="hidden.jsp"  theme="'single'" />
                <ui:component name="'confirm'" value="'true'" template="hidden.jsp" theme="'single'"  />
            </webwork:if>

          </page:applyDecorator>
</body>
</html>
