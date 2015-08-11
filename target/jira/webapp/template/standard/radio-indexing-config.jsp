<%@ taglib uri="webwork" prefix="webwork" %>
<%@ include file="/template/standard/controlheader.jsp" %>

<div class="formOne">
    <div>
        <input class="radio" type="radio" id="indexPathOption_DEFAULT" name="indexPathOption" value="DEFAULT" <webwork:if test="indexPathOption == 'DEFAULT'">CHECKED</webwork:if> />
        <label for="indexPathOption_DEFAULT"><webwork:text name="'admin.indexing.usedefaultpath'"/></label>
        <div class="field-description">
            <p><webwork:property value="/defaultIndexPath" /></p>
        </div>
    </div>
    <div>
        <input class="radio" type="radio" id="indexPathOption_CUSTOM" name="indexPathOption" value="CUSTOM" <webwork:if test="indexPathOption == 'CUSTOM'">CHECKED</webwork:if> />
        <label for="indexPathOption_CUSTOM"><webwork:text name="'admin.indexing.usecustompath'"/></label>
        <div>
            <input class="text" type="textfield" size="40" id="indexPath" name="indexPath" value="<webwork:property value="/indexPath" />"/>
            <div class="field-description">
                <p><webwork:text name="'setup.indexpath.desc'" /></p>
                <p>
                    <webwork:text name="'admin.import.index.warning'">
                        <webwork:param name="'value0'"><span class="warning"></webwork:param>
                        <webwork:param name="'value1'"></span></webwork:param>
                    </webwork:text>                    
                </p>
            </div>
            
        </div>
    </div>
</div>

<%@ include file="/template/standard/controlfooter.jsp" %>
