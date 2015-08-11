<%--
This JSP include prints a table (like the middle of view issue) with the issue description.
It requires that the issue is the top item on the value stack, and
that various beans / actions are already set. Use it like so:

<%@ taglib uri="jiratags" prefix="jira" %>
<webwork:property value="path/to/issueGenericValue">
    <%@ include this file %>
</webwork:property>
--%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<webwork:property value="./long('project')">
<webwork:if test="@fieldVisibility/fieldHidden(., 'description', ../string('type')) == false && ../string('description') != null && ../string('description')/length > 0">
<div id="detailsmodule" class="module">
    <div id="issue-description" class="mod-content twixi-block expanded">
        <ul class="item-details">
            <li>
                <dl>
                    <dt><webwork:text name="'issue.field.description'"/>:</dt>
                    <webwork:if test="../string('description')/length > 255">
                        <dd class="twixified">
                            <div class="twixi-wrap verbose">
                                <a href="#" class="twixi"><span class="icon twixi-opened"><span><webwork:text name="'admin.common.words.hide'"/></span></span></a>
                                <div id="description-full" class="flooded">
                                    <webwork:property value="/renderedContent('description', ../string('description'), @issue)" escape="'false'" />
                                </div>
                            </div>
                            <div class="twixi-wrap concise">
                                <a href="#" class="twixi"><span class="icon twixi-closed"><span><webwork:text name="'admin.common.words.show'"/></span></span></a>
                                <div class="flooded">
                                    <webwork:property value="/renderedContentNoBreaks('description', ../string('description'), @issue)" escape="'false'" />
                                </div>
                            </div>
                        </dd>
                    </webwork:if>
                    <webwork:else>
                        <dd id="description-full">
                            <webwork:property value="/renderedContent('description', ../string('description'), @issue)" escape="'false'" />
                        </dd>
                    </webwork:else>
                </dl>
            </li>
        </ul>
    </div>
</div>
</webwork:if>
</webwork:property>

