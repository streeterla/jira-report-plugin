<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>


<webwork:iterator value="flushedErrorMessages">
<div class="module message error">
<p><webwork:property /></p>
<button class="cancel"><webwork:text name="'admin.common.words.cancel'"/></button>
</div>
</webwork:iterator>
<webwork:iterator value="errors/values">
<div class="module message error">
<p><webwork:property /></p>
<button class="cancel"><webwork:text name="'admin.common.words.cancel'"/></button>
</div>
</webwork:iterator>