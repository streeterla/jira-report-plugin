<%@ taglib uri="webwork" prefix="webwork" %>

<tr class="filter_list">
    <webwork:if test="parameters['sort'] != null && parameters['sort'] == true">
        <webwork:if test="parameters['name'] != false">
            <td class="<webwork:property value="parameters['viewHelper']/generateSortCssClass('name')"/> bolded" >
                <a id="page_sort_name" href="<webwork:property value="parameters['viewHelper']/generateSortUrl('name')"/>"><webwork:text name="'common.words.name'"/>&nbsp;<webwork:property value="parameters['viewHelper']/generateSortIcon('name')" escape="false"/></a></td>
        </webwork:if>
        <webwork:if test="parameters['portalPageList'] != null && parameters['portalPageList']/size > 0">
            <webwork:if test="parameters['owner'] != 'false'">
                <td class="<webwork:property value="parameters['viewHelper']/generateSortCssClass('owner')"/> bolded" style="width:10%">
                    <a id="page_sort_owner" href="<webwork:property value="parameters['viewHelper']/generateSortUrl('owner')"/>"><webwork:text name="'common.concepts.author'"/>&nbsp;<webwork:property value="parameters['viewHelper']/generateSortIcon('owner')" escape="false"/></a></td>
            </webwork:if>
            <webwork:if test="parameters['shares'] != 'false'">
                <td class="colHeaderLink bolded" style="width:21%"><webwork:text name="'common.concepts.shared.with'"/></td>
            </webwork:if>
            <webwork:if test="parameters['ordering'] != 'false'">
                <td class="colHeaderLink bolded" style="width:1%;"></td>
            </webwork:if>
            <webwork:if test="parameters['operations'] != 'false'">
                <td class="colHeaderLink bolded" style="width:20%"><webwork:text name="'common.words.operations'"/></td>
            </webwork:if>
            <webwork:if test="parameters['favcount'] != 'false'">
                <td class="<webwork:property value="parameters['viewHelper']/generateSortCssClass('favcount')"/> bolded" style="width:5%" title="<webwork:text name="'portalpage.favourite.count.desc'"/>">
                    <a id="page_sort_popularity" href="<webwork:property value="parameters['viewHelper']/generateSortUrl('favcount')"/>"><webwork:text name="'common.concepts.popularity'"/>&nbsp;<webwork:property value="parameters['viewHelper']/generateSortIcon('favcount')" escape="false"/></a></td>
            </webwork:if>
        </webwork:if>
    </webwork:if>
    <webwork:else>
        <webwork:if test="parameters['name'] != false">
            <td class="colHeaderLink bolded" ><webwork:text name="'common.words.name'"/></td>
        </webwork:if>
        <webwork:if test="parameters['portalPageList'] != null && parameters['portalPageList']/size > 0">
            <webwork:if test="parameters['owner'] != 'false'">
                <td class="colHeaderLink bolded" style="width:10%"><webwork:text name="'common.concepts.author'"/></td>
            </webwork:if>
            <webwork:if test="parameters['shares'] != 'false'">
                <td class="colHeaderLink bolded" style="width:21%"><webwork:text name="'common.concepts.shared.with'"/></td>
            </webwork:if>
            <webwork:if test="parameters['ordering'] != 'false'">
                <td class="colHeaderLink bolded" style="width:1%;"></td>
            </webwork:if>
            <webwork:if test="parameters['operations'] != 'false'">
                <td class="colHeaderLink bolded" style="width:20%"><webwork:text name="'common.words.operations'"/></td>
            </webwork:if>
            <webwork:if test="parameters['favcount'] != 'false'">
                <td class="colHeaderLink bolded" style="width:5%" title="<webwork:text name="'portalpage.favourite.count.desc'"/>"><webwork:text name="'common.concepts.popularity'"/></td>
            </webwork:if>
        </webwork:if>
    </webwork:else>
</tr>
