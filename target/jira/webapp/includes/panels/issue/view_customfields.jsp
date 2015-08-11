<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<div id="customfieldmodule" class="module reduced">
    <div class="mod-content">
        <webwork:if test="/fieldScreenRenderTabs/size > 1">
            <script type="text/javascript" language="JavaScript">
                function showTab(tabId)
                {
                    for(i = 1; i <= <webwork:property value="/fieldScreenRenderTabs/size" />; i++)
                    {
                        var tableObject = document.getElementById('tab' + i);
                        var tableCellObject = document.getElementById('tabCell' + i);

                        if (i == tabId)
                        {
                            tableObject.className = 'property-list';
                            tableCellObject.className = 'active';

                        }
                        else
                        {
                            tableObject.className = 'hidden';
                            tableCellObject.className = '';
                        }
                    }
                }
            </script>

            <%-- Show tab headings --%>
            <div class="tabwrap tabs2">
                <ul class="tabs horizontal">
                <webwork:iterator value="/fieldScreenRenderTabs" status="'status'">
                    <li id="tabCell<webwork:property value="@status/count" />" <webwork:if test="@status/count == /selectedTab">class="active"</webwork:if>>
                        <a onClick="showTab(<webwork:property value="@status/count"/>);" href="javascript:showTab(<webwork:property value="@status/count" />)"><strong><webwork:property value="./name" /></strong></a>
                    </li>
                </webwork:iterator>
               </ul>
            </div>
        </webwork:if>

        <%-- Show the actual tabs with their fields --%>
        <webwork:iterator value="/fieldScreenRenderTabs" status="'status'">
        <%--<ul id="tab<webwork:property value="@status/count"/>" <webwork:if test="@status/count == /selectedTab">class="item-details"</webwork:if><webwork:else>class="hidden"</webwork:else>>--%>
        <ul id="tab<webwork:property value="@status/count"/>" class="property-list">
            <%-- Show tab's fields --%>
            <webwork:iterator value="./fieldScreenRenderLayoutItems">
                <webwork:property value="./orderableField">
                    <%-- If changing this, see if http://confluence.atlassian.com/display/JIRACOM/Displaying+Custom+Fields+with+no+value needs updating --%>
                    <webwork:if test="./value(/issueObject) != null && ./customFieldType/descriptor/viewTemplateExists != false"><%-- don't display custom fields with no values --%>
                        <li id="rowFor<webwork:property value="./id" />" class="item">
                            <div class="wrap">
                                <strong title="<webwork:property value="name" />" class="name"><webwork:property value="name" />:</strong>
                                <div id="<webwork:property value="./id" />-val" class="value type-<webwork:property value="./customFieldType/descriptor/key" /><webwork:if test="./customFieldType/descriptor/key == 'textarea' && ./value(/issueObject)/length() > 255"> twixified</webwork:if>">
                                    <webwork:property value="/customFieldHtml(../fieldLayoutItem,., /issueObject)" escape="false" />
                                </div>
                            </div>
                        </li>
                    </webwork:if>
                </webwork:property>
            </webwork:iterator>
        </ul>
        </webwork:iterator>
    </div>
</div>
