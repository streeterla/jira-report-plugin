/**
 * @module jira.app.selectIssueTypeScheme
 * @author Scott Harwood
 * @requires jQuery > v1.6
 */

jQuery.namespace("jira.app.selectIssueTypeScheme");

/**
 * singleton
 */
jira.app.selectIssueTypeScheme = function() {

    // private

    var lastIdDisplayed = "";

    /**
     * @function handleSchemeChange
     */
    var handleSchemeChange = function() {
        var selectList = jQuery('#schemeId_select');

        hide();
        show();

        // inline script
        if (selectList.get(0)) {
              changeDescription0(selectList.get(0));
        }

        jQuery('#issueTypeSchemeLabel').html(selectList.find("option:selected").html());
    }

    /**
     * @function handleSectionChange
     * @returns {Boolean}
     */
    var handleSectionChange = function() {

        if (jQuery('#createType_chooseScheme:checked').length > 0) {
            jQuery('#chooseScheme').css("display","");
        } else {
            jQuery('#chooseScheme').css("display","none");
        }

        if (jQuery('#createType_chooseProject') && jQuery('#createType_chooseProject:checked').length > 0) {
            jQuery('#chooseProject').css("display","");
        } else {
            jQuery('#chooseProject').css("display","none");
        }

        if (jQuery('#createType_createScheme:checked').length > 0) {
            jQuery('#optionsForScheme').css("display","none");
            jQuery('#createScheme').css("display","");
        } else {
            jQuery('#createScheme').css("display", "none");
            jQuery('#optionsForScheme').css("display","");
        }

        return true;
    }

    /**
     * @function hide
     * 
     */
    var hide = function() {
        if (lastIdDisplayed && lastIdDisplayed != '') {
            jQuery("#" + lastIdDisplayed).css("display","none");
        }
    }

    /**
     * @function show
     */
    var show = function() {
        var selectList = jQuery('#schemeId_select');
        lastIdDisplayed = selectList.val();
        jQuery("#" + selectList.val()).css("display","");
    }

    /**
     * @function selectIssueTypeScheme
     * @param {HTMLelement} projectSelect
     */
    var selectIssueTypeScheme = function(projectSelect) {
        if (projectSelect.value && projectSelect.value != '')
        {
            // inline script
            changeDescription2(projectSelect);

            if (jQuery('#schemeId_select').val() != projectSelect.value)
            {
                jQuery('#schemeId_select').val(projectSelect.value);
                handleSchemeChange();
            }
        }
    }

    return function() {

        jQuery('#schemeId_select').change(function(){
            handleSchemeChange();
            jQuery('#sameAsProjectId_select').val("");
        });

        jQuery("#schemeId_select").change(function(){
           selectIssueTypeScheme(this);
        });

        jQuery("#sameAsProjectId_select").change(function(){
           selectIssueTypeScheme(this);
        });

        jQuery("#choose-section input").click(function(){
            handleSectionChange(this);
        });

        handleSchemeChange();
        handleSectionChange();
    };

}();

// need to call after page load to ensure all nodes are there
jQuery(document).ready(jira.app.selectIssueTypeScheme);