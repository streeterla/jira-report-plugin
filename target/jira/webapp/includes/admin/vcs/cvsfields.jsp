<script language="JavaScript">
    function processSelection(value)
    {
        document.forms['jiraform'].elements['password'].disabled = value;
    }
</script>

<ui:textfield label="text('common.words.name')" name="'name'" size="'30'">
    <ui:param name="'description'"><webwork:text name="'admin.cvsmodules.name.description'"/></ui:param>
    <ui:param name="'mandatory'">true</ui:param>
</ui:textfield>
<ui:textfield label="text('common.words.description')" name="'description'" size="'60'" />

<tr>
    <td colspan=2 bgcolor=#f0f0f0><b><webwork:text name="'admin.cvsmodules.cvs.module.details'"/></b></td>
</tr>

<ui:textfield label="text('admin.cvsmodules.cvs.root')" name="'cvsRoot'" size="'60'">
    <ui:param name="'description'">
        <webwork:text name="'admin.cvsmodules.cvs.root.description'"/>
    </ui:param>
    <ui:param name="'mandatory'">true</ui:param>
</ui:textfield>

<ui:textfield label="text('admin.cvsmodules.module.name')" name="'moduleName'" size="'60'">
    <ui:param name="'description'">
        <webwork:text name="'admin.cvsmodules.module.name.description'"/>
    </ui:param>
    <ui:param name="'mandatory'">true</ui:param>
</ui:textfield>

<tr>
    <td align="right" valign="top" bgcolor="#fffff0"><span class="label">
        <i><span title="Fields in italics are required"><sup>*</sup> <webwork:text name="'admin.cvsmodules.log.retrieval'"/></i></span>:
    </span></td>
    <td bgcolor="#ffffff">
        <input id="fetchLogTrue" type="radio" value="true" name="fetchLog" onclick="processSelection(false);" <webwork:if test="/fetchLog == true">checked</webwork:if>><label for="fetchLogTrue"><webwork:text name="'admin.cvsmodules.automatically.retrieve.the.cvs.log'"/></label>
        &nbsp;
        <input id="fetchLogFalse" type="radio" value="false" name="fetchLog" onclick="processSelection(true);" <webwork:if test="/fetchLog == false">checked</webwork:if>><label for="fetchLogFalse"><webwork:text name="'admin.cvsmodules.update.log.manually'"/></label>
    </td>
</tr>


<ui:textfield label="text('admin.cvsmodules.log.file.path')" name="'logFilePath'" size="'60'">
    <ui:param name="'description'">
        <webwork:text name="'admin.cvsmodules.log.retrieval.description'">
            <webwork:param name="'value0'"><%=System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + "cvs-module1.log"%></webwork:param>
            <webwork:param name="'value1'"><br></webwork:param>
        </webwork:text>
    </ui:param>
    <ui:param name="'mandatory'">true</ui:param>
</ui:textfield>

<ui:textfield label="text('admin.cvsmodules.cvs.timeout')" name="'timeout'" size="'20'">
    <ui:param name="'description'">
        <webwork:text name="'admin.cvsmodules.cvs.timeout.description'"/>    
    </ui:param>
    <ui:param name="'mandatory'">true</ui:param>
</ui:textfield>

<ui:password label="text('common.words.password')" name="'password'">
    <ui:param name="'description'">
    <ui:param name="'disabled'"><webwork:if test="/fetchLog == false">true</webwork:if><webwork:else>false</webwork:else></ui:param>
        <webwork:text name="'admin.cvsmodules.password.description'"/>
    </ui:param>
</ui:password>

<tr>
    <td colspan=2 bgcolor=#f0f0f0><b><webwork:text name="'admin.cvsmodules.viewcvs.details'"/></b></td>
</tr>

<ui:textfield label="text('admin.cvsmodules.base.url')" name="'repositoryBrowserURL'" size="'60'">
    <ui:param name="'description'"><webwork:text name="'admin.cvsmodules.base.url.description'">
        <webwork:param name="'value0'"><a href="http://viewcvs.sourceforge.net"></webwork:param>
        <webwork:param name="'value1'"></a></webwork:param>
    </webwork:text></ui:param>
</ui:textfield>

<ui:textfield label="text('admin.cvsmodules.root.parameter')" name="'repositoryBrowserRootParam'" size="'30'">
    <ui:param name="'description'">
        <webwork:text name="'admin.cvsmodules.root.parameter.description'"/>
    </ui:param>
</ui:textfield>
