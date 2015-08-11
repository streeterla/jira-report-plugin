<%@ taglib uri="webwork" prefix="webwork" %>
<webwork:if test="parameters['portalPageList'] != null && parameters['portalPageList']/size > 0 && parameters['paging'] != null && parameters['paging'] == true">
    <webwork:if test="parameters['pagingNextUrl'] != null || parameters['pagingPrevUrl'] != null">
        <div class="jiraCenteredContent" style="text-align:center;position:relative;padding:5px 0px;">
            <webwork:if test="parameters['pagingPrevUrl'] != null">
                <a href="<webwork:property value="parameters['pagingPrevUrl']"/>"><webwork:text name="'common.forms.previous.with.arrows'"/></a>
            </webwork:if>
            <webwork:if test="parameters['pagingPrevUrl'] == null && parameters['pagingNextUrl'] == null">
                &nbsp;
            </webwork:if>
            <webwork:if test="parameters['pagingMessage'] != null">
                &nbsp;<span><webwork:property value="parameters['pagingMessage']"/></span>&nbsp;
            </webwork:if>
            <webwork:if test="parameters['pagingNextUrl'] != null">
                <a href="<webwork:property value="parameters['pagingNextUrl']"/>"><webwork:text name="'common.forms.next.with.arrows'"/></a>
            </webwork:if>
        </div>
    </webwork:if>
    <webwork:else>
        &nbsp;<br/>
    </webwork:else>
</webwork:if>
