<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<webwork:bean name="'com.atlassian.jira.web.bean.LatestFileBean'" id="latestFile" />
<webwork:bean name="'com.atlassian.core.user.UserUtils'" id="userUtils" />
<% request.setAttribute("contextPath", request.getContextPath()); %>


<webwork:if test="/attachments && /attachments/size > 0">
<webwork:bean name="'com.atlassian.core.util.FileSize'" id="sizeFormatter" />
	<div id="attachmentmodule" class="module">
		<div class="mod-header">
            <ul class="ops">
                <webwork:if test="/zipSupport == true">
                    <li><a id="aszip" href="<webwork:property value="@contextPath"/>/secure/attachmentzip/<webwork:property value="/id"/>.zip" class="icon icon-download" title="<webwork:text name="'common.concepts.attachments.as.a.zip'"/>"><span><webwork:text name="'common.concepts.attachments.as.a.zip'"/></span></a></li>
                </webwork:if>
                <webwork:if test="/attachable == true">
                    <li><a id="manage-attachment-link" href="<webwork:url page="/secure/ManageAttachments.jspa"><webwork:param name="'id'" value="../long('id')" /></webwork:url>" class="icon icon-view" title="<webwork:text name="'manageattachments.title'"/>"><span><webwork:text name="'manageattachments.title'"/></span></a></li>
                </webwork:if>
                <webwork:if test="/canCreateAttachments == true">
                    <li><a id="add-attachments-link" href="<webwork:url page="/secure/AttachFile!default.jspa"><webwork:param name="'id'" value="../long('id')" /></webwork:url>" class="icon icon-add16" title="<webwork:text name="'admin.issue.operations.plugin.attach.file.name'"/>"><span><webwork:text name="'admin.issue.operations.plugin.attach.file.name'"/></span></a></li>
                </webwork:if>
            </ul>
            <webwork:if test="/attachable == true">
    			<h3><a id="manageattachments" href="<webwork:url page="/secure/ManageAttachments.jspa"><webwork:param name="'id'" value="../long('id')" /></webwork:url>"><webwork:text name="'common.concepts.attachments.files'"/></a></h3>
			</webwork:if>
            <webwork:else>
                <h3><webwork:text name="'common.concepts.attachments.files'"/></h3>
            </webwork:else>
        </div>
        <div class="mod-content">
        <webwork:if test="/fileAttachments != null && /fileAttachments/size > 0">
            <ol id="file_attachments" class="item-attachments">
            <webwork:property value="@latestFile/setup(/fileAttachments)"/>
            <webwork:iterator value="/fileAttachments" status="'attachmentstatus'">
                <webwork:if test="@latestFile/latestFile(.) == false">
                    <li class="attachment-content earlier-version">
                        <div class="attachment-thumb">
                            <a href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="id" />/<webwork:property value="urlEncoded(filename)" />">
                                <%@ include file="/includes/icons/attachment.jsp" %>
                            </a>
                        </div>
                        <dl>
                            <dt class="attachment-title"><a href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="id" />/<webwork:property value="urlEncoded(filename)" />" title="<webwork:property value="/outlookDate/formatDMYHMS(created)" /> - <webwork:if test="@userUtils/existsUser(author) == true"><webwork:property value="@userUtils/user(author)/fullName" /></webwork:if><webwork:else><webwork:property value="author"/></webwork:else>"><webwork:property value="filename" /></a></dt>
                            <dd class="attachment-size">(<webwork:property value="@sizeFormatter/format(filesize)"/>)</dd>
                            <dd class="attachment-author"><webwork:if test="@userUtils/existsUser(author) == true"><webwork:property value="@userUtils/user(author)/fullName" /></webwork:if><webwork:else><webwork:property value="author"/></webwork:else></dd>
                            <dd class="attachment-date"><webwork:property value="/outlookDate/formatDMYHMS(created)" /></dd>
                        </dl>
                    </li>
                </webwork:if>
                <webwork:else>
                    <li class="attachment-content">
                        <div class="attachment-thumb">
                            <a href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="id" />/<webwork:property value="urlEncoded(filename)" />">
                                <%@ include file="/includes/icons/attachment.jsp" %>
                            </a>
                        </div>
                        <dl>
                            <dt><a class="attachment-title" href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="id" />/<webwork:property value="urlEncoded(filename)" />" title="<webwork:text name="'common.words.latest'"/> <webwork:property value="/outlookDate/formatDMYHMS(created)" /> - <webwork:if test="@userUtils/existsUser(author) == true"><webwork:property value="@userUtils/user(author)/fullName" /></webwork:if><webwork:else><webwork:property value="author"/></webwork:else>"><webwork:property value="filename" /></a></dt>
                            <dd class="attachment-size">(<webwork:property value="@sizeFormatter/format(filesize)"/>)</dd>
                            <dd class="attachment-author"><webwork:if test="@userUtils/existsUser(author) == true"><webwork:property value="@userUtils/user(author)/fullName" /></webwork:if><webwork:else><webwork:property value="author"/></webwork:else></dd>
                            <dd class="attachment-date"><webwork:property value="/outlookDate/formatDMYHMS(created)" /></dd>
                        </dl>
                    </li>
                </webwork:else>
            </webwork:iterator>
            </ol>
    <%--  Provide link:
    - if there are some attachments to look at   OR
    - if you have the ability to add attachments --%>
        </webwork:if>

        <webwork:if test="/thumbnails && /thumbnails/size > 0 && /toolkitAvailable() == true">
            <webwork:if test="/thumbnails != null && /thumbnails/size > 0">
                <webwork:property value="@latestFile/setup(/imageAttachments)"/>
                <ol id="attachment_thumbnails" class="item-attachments<webwork:if test="/fileAttachments != null && /fileAttachments/size > 0"> section</webwork:if>">
                <webwork:iterator value="/thumbnails" status="'thumbnailstatus'">
                    <li class="attachment-content">
                        <webwork:property value="attachmentManager/attachment(./attachmentId)" >
                            <webwork:if test="@latestFile/latestFile(.) == false">
                                <div class="attachment-thumb">
                                    <a class="gallery" rel="gallery" href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="attachmentId" />/<webwork:property value="urlEncoded(filename)" />" title="<webwork:property value="filename" /> - <webwork:property value="/outlookDate/formatDMYHMS(created)" /> - <webwork:if test="@userUtils/existsUser(author) == true"><webwork:property value="@userUtils/user(author)/fullName" /></webwork:if><webwork:else><webwork:property value="author"/></webwork:else>">
                                        <img src="<webwork:property value="@contextPath"/>/secure/thumbnail/<webwork:property value="attachmentId" />/<webwork:property value="urlEncoded(../filename)" />" width="<webwork:property value="../width"/>" height="<webwork:property value="../height" />" alt="" />
                                    </a>
                                </div>
                                <dl class="earlier-version">
                                    <dt><span class="blender"></span><a class="attachment-title" href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="id" />/<webwork:property value="urlEncoded(filename)" />" title="<webwork:property value="filename" /> - <webwork:property value="/outlookDate/formatDMYHMS(created)" /> - <webwork:if test="@userUtils/existsUser(author) == true"><webwork:property value="@userUtils/user(author)/fullName" /></webwork:if><webwork:else><webwork:property value="author"/></webwork:else>"><webwork:property value="filename" /></a></dt>
                                    <dd class="attachment-size">(<webwork:property value="@sizeFormatter/format(filesize)"/>)</dd>
                                </dl>
                            </webwork:if>
                            <webwork:else>
                                <div class="attachment-thumb">
                                    <a class="gallery" rel="gallery" href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="attachmentId" />/<webwork:property value="urlEncoded(filename)" />" title="<webwork:property value="filename" /> - <webwork:text name="'common.words.latest'"/> <webwork:property value="/outlookDate/formatDMYHMS(./created)" /> - <webwork:if test="@userUtils/existsUser(author) == true"><webwork:property value="@userUtils/user(author)/fullName" /></webwork:if><webwork:else><webwork:property value="author"/></webwork:else>">
                                        <img src="<webwork:property value="@contextPath"/>/secure/thumbnail/<webwork:property value="attachmentId" />/<webwork:property value="urlEncoded(../filename)" />" width="<webwork:property value="../width"/>" height="<webwork:property value="../height" />" alt="" />
                                    </a>
                                </div>
                                <dl>
                                    <dt><span class="blender"></span><a class="attachment-title" href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="id" />/<webwork:property value="urlEncoded(filename)" />" title="<webwork:property value="filename" /> - <webwork:text name="'common.words.latest'"/> <webwork:property value="/outlookDate/formatDMYHMS(./created)" /> - <webwork:if test="@userUtils/existsUser(author) == true"><webwork:property value="@userUtils/user(author)/fullName" /></webwork:if><webwork:else><webwork:property value="author"/></webwork:else>"><webwork:property value="filename" /></a></dt>
                                    <dd class="attachment-size">(<webwork:property value="@sizeFormatter/format(filesize)"/>)</dd>
                                </dl>
                            </webwork:else>
                        </webwork:property>
                    </li>
                </webwork:iterator>
                </ol>
            </webwork:if>
        </webwork:if>
            
        </div>
    </div>

    <%--We think this code is dead like the dodos.  We always have a toolkit--%>
    <webwork:if test="/imageAttachments != null && /imageAttachments/size > 0 && /toolkitAvailable() == false">
    <div class="module">
		<div class="mod-header">
			<h3><webwork:text name="'common.concepts.attachments.images'"/></h3>
		</div>
		<div class="mod-content">
            <webwork:iterator value="/imageAttachments" status="'attachmentstatus'">
                <webwork:property value="@attachmentstatus/count" />.
                <a href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="id" />/<webwork:property value="urlEncoded(filename)" />"><%@ include file="/includes/icons/attachment.jsp" %></a>
                <a href="<webwork:property value="@contextPath"/>/secure/attachment/<webwork:property value="id" />/<webwork:property value="urlEncoded(filename)" />"><webwork:property value="filename" /></a> <font size="-2">(<webwork:property value="@sizeFormatter/format(filesize)"/>)</font><br/>
            </webwork:iterator>
            <br/>
            <font color="#bb0000"><webwork:text name="'thumbnails.error.display'"/></font>
		</div>
	</div>
    </webwork:if>
</webwork:if>
