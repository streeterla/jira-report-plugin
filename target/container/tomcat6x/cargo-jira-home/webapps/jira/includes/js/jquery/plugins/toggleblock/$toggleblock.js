// PLEASE NOTE: IN MOST CASES ANY CHANGE TO JSDOC HERE NEEDS TO BE APPLIED TO JIRA.ToggleBlock ALSO

/**
 * @module jQuery
 * @namespace jQuery.fn
 */

/**
 * A generic control for toggling a blocks state. For example expanded and collapsed.
 *
 * <h4>Use </h4>
 * 
 * <h5>Markup:</h5>
 *
 * <pre>
 * <div id="must-be-unique" class="twixi-block expanded">
 *       <div class="twixi-wrap verbose">
 *           <a href="#" class="twixi">Contract</a>
 *           <div class="action-details">...</div>
 *       </div>
 *       <div class="twixi-wrap concise">
 *           <a href="#" class="twixi">Expand</a>
 *           <div class="action-details flooded">...</div>
 *       </div>
 * </div>
 * </pre>
 *
 * <h5>CSS:</h5>
 *
 * <pre>
 * .twixi-block.expanded .concise {display:none;}
 * .twixi-block.contracted .concise {display:block;}
 * .twixi-block.contracted .concise {display:block;}
 * .twixi-block.expanded .concise {display:none;}
 * </pre>
 *
 * <h5>JavaScript</h5>
 *
 * <pre>
 * jQuery(".twiki-block").toggleBlock();
 * </pre>
 *
 * @class toggleBlock
 * @constructor
 * @since 4.1
 * @requires jQuery, JIRA.ToggleBlock
 * @param {Object} options
 *
 * <dl>
 *  <dt>{String} blockSelector</dt>
 *      <dd><strong>Default: <em>.twixi-block</em></strong><dd>
 *      <dd></dd>
 *  <dt>{String} triggerSelector</dt>
 *      <dd>Selector for element that executes toggle</dd>
 *      <dd><strong>Default: <em>.twixi</em></strong></dd>
 *  <dt>{String} eventType</dt>
 *      <dd>Event applied to option <strong>triggerSelector</strong>, which when occurs executes toggle</dd>
 *      <dd><strong>Default: <em>click</em></strong></dd>
 *  <dt>{String} collapsedClass</dt>
 *      <dd>Class name to be applied to element specified in option <strong>blockSelector</strong> when collapsed</dd>
 *      <dd><strong>Default: <em>collapsed</em></strong></dd>
 *  <dt>{String} expandedClass</dt>
 *      <dd>Class name to be applied to element specified in option <strong>blockSelector</strong> when expanded</dd>
 *      <dd><strong>Default: <em>expanded</em></strong></dd>
 *  <dt>{String} cookieName</dt>
 *      <dd>Actual cookie value will be stored in</dd>
 *      <dd><strong>Default: <em>jira.viewissue.cong.cookie</em></strong></dd>
 *  <dt>{String} cookieCollectionName</dt>
 *      <dd>Namespace inside of cookie</dd>
 *      <dd><strong>Default: <em>twixi-blocks</em></strong></dd>
 * </dl>
*/
jQuery.fn.toggleBlock = function (options) {
    options = options || {};
    options.blockSelector = this.selector;
    return new JIRA.ToggleBlock(options);
};