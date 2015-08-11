<%--
  --  Parameters:
  --   * issue        - an issue object to work on
  --   * tabs         - a collection of field screen tabs
  --   * errortabs    - a collection of tabs with fields that have errors
  --   * selectedtab  - the index of the tab to select starting with 1
  --   * ignorefields - a collection of field ids that should not be shown no matter what
  --   * create       - a boolean value indicating whether issue is being created
  --
  --%>
<%@ taglib uri="webwork" prefix="webwork" %>

<jsp:include page="/includes/js/date_picker.jsp" flush="true" />

<webwork:if test="parameters['tabs']/size > 1">
    <tr>
        <td class="issue-fields-wrap" colspan="2">

        <%-- Show tab headings --%>
        <div class="tabwrap tabs2">
            <ul class="tabs horizontal fieldTabs">
                <webwork:iterator value="parameters['tabs']" status="'status'">
                <li rel="tab<webwork:property value="@status/count"/>" <webwork:if test="@status/count == parameters['selectedtab']">class="active"</webwork:if>>
                    <a href="#" <webwork:if test="parameters['errortabs']/contains(.) == true"> class="tabWithError"</webwork:if>><strong><webwork:property value="./name"/></strong></a>
                </li>
                </webwork:iterator>
            </ul>
        </div>
</webwork:if>

        <%-- Show the actual tabs with their fields --%>
        <webwork:iterator value="parameters['tabs']" status="'status'">

            <webwork:if test="parameters['tabs']/size > 1">
            <div id="tab<webwork:property value="@status/count"/>" class="fieldTabArea <webwork:if test="@status/count == parameters['selectedtab']">active</webwork:if>">
            <table cellpadding="0" cellspacing="0" width="100%">
            </webwork:if>

            <%-- Show tab's fields --%>
            <webwork:iterator value="./fieldScreenRenderLayoutItems">
                <%-- Hack to not show issue type as it has been shown on a previous page --%>
                <webwork:if test="parameters['ignorefields'] == null || parameters['ignorefields']/contains(./orderableField/id) == false">
                    <webwork:if test="parameters['create'] == true">
                        <webwork:property value="./createHtml(/, /, parameters['issue'])" escape="'false'" />
                    </webwork:if>
                    <webwork:else>
                        <webwork:property value="./editHtml(/, /, parameters['issue'])" escape="'false'" />
                    </webwork:else>
                </webwork:if>
            </webwork:iterator>

            <webwork:if test="parameters['tabs']/size > 1">
            </table>
            </div>
            </webwork:if>

        </webwork:iterator>

<webwork:if test="parameters['tabs']/size > 1">
        </td>
    </tr>
</webwork:if>
