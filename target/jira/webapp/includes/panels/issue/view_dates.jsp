<%@ taglib uri="webwork" prefix="webwork" %>
<div id="datesmodule" class="module">
    <div class="mod-header">
        <h3><webwork:text name="'common.concepts.dates'"/></h3>
    </div>
    <div class="mod-content">
        <ul class="item-details">
            <li>
            <webwork:if test="@fieldVisibility/fieldHidden(., 'duedate', ../string('type')) == false && timestamp('duedate')">
                <dl class="dates">
                    <dt><webwork:text name="'issue.field.due'"/>:</dt>
                    <dd id="due-date" class="date"><webwork:property value="/outlookDate/formatDMY(../timestamp('duedate'))"/></dd>
                </dl>
            </webwork:if>
                <dl class="dates">
                    <dt><webwork:text name="'issue.field.created'"/>:</dt>
                    <dd id="create-date" class="date"><webwork:property value="/outlookDate/format(timestamp('created'))"/></dd>
                </dl>
                <dl class="dates">
                    <dt><webwork:text name="'issue.field.updated'"/>:</dt>
                    <dd id="updated-date" class="date"><webwork:property value="/outlookDate/format(timestamp('updated'))"/></dd>
                </dl>
            <webwork:if test="timestamp('resolutiondate') != null">
                <dl class="dates">
                    <dt><webwork:text name="'issue.field.resolution.date'"/>:</dt>
                    <dd id="resolved-date" class="date"><webwork:property value="/outlookDate/format(timestamp('resolutiondate'))"/></dd>
                </dl>
            </webwork:if>
            <webwork:iterator value="/dateLayoutItems">
                <webwork:property value="./orderableField">
                    <dl class="dates">
                        <dt title="<webwork:property value="name" />"><webwork:property value="name" />:</dt>
                        <dd id="<webwork:property value="./id" />-val" class="date">
                            <webwork:property value="/customFieldHtml(../fieldLayoutItem, ., /issueObject)" escape="false" />
                        </dd>
                    </dl>
                </webwork:property>
            </webwork:iterator>
            </li>
        </ul>
    </div>
</div>


