jQuery.namespace("JIRA.Twixi");JIRA.ToggleBlock=Class.extend({getDefautOptions:function(){return{blockSelector:".twixi-block",triggerSelector:".twixi",eventType:"click",collapsedClass:"collapsed",expandedClass:"expanded",cookieName:"jira.viewissue.cong.cookie",cookieCollectionName:"twixi-blocks"}},_collapseTwixiBlocksFromCookie:function(){var block,val=readFromConglomerateCookie(this.options.cookieName,this.options.cookieCollectionName,"");if(/#\w+/.test(val)){block=AJS.$(val);if(block.is(this.options.blockSelector)){block.removeClass(this.options.expandedClass).addClass(this.options.collapsedClass)}}return this},_updateTwixiBlockIdInCookie:function(blockId){if(!/#\w+/.test(blockId)){return this}var val=readFromConglomerateCookie(this.options.cookieName,this.options.cookieCollectionName,""),blockLength=(","+val+",").indexOf(","+blockId+",")+1;if(blockLength){if(val.indexOf(","+blockId)+1){val=val.replace(","+blockId,"")}else{val=val.replace(blockId,"")}}else{val=val.length?val+","+blockId:blockId}saveToConglomerateCookie(this.options.cookieName,this.options.cookieCollectionName,val);return this},contract:function(block){block=jQuery(block);if(block.is(this.options.blockSelector)){block.removeClass(this.options.expandedClass).addClass(this.options.collapsedClass);this._updateTwixiBlockIdInCookie("#"+block.attr("id"))}return this},expand:function(block){block=jQuery(block);if(block.is(this.options.blockSelector)){block.removeClass(this.options.collapsedClass).addClass(this.options.expandedClass);this._updateTwixiBlockIdInCookie("#"+block.attr("id"))}return this},toggle:function(twikiBlockChild){function clearSelection(){var sel;if(document.selection&&document.selection.empty){document.selection.empty()}else{if(window.getSelection){sel=window.getSelection();if(sel&&sel.removeAllRanges){sel.removeAllRanges()}}}}var block=AJS.$(twikiBlockChild).closest(this.options.blockSelector);if(!block.hasClass(this.options.collapsedClass)){this.contract(block)}else{this.expand(block)}clearSelection();block.find(this.options.triggerSelector+":visible").focus();return this},addTrigger:function(triggerSelector,eventType){var thisInstance=this;if(triggerSelector){eventType=eventType||"click";AJS.$(triggerSelector).live(eventType,function(e){thisInstance.toggle(this);e.preventDefault()})}return this},addCallback:function(methodName,callback){jQuery.aop.after({target:this,method:methodName},callback);return this},init:function(options){var thisInstance=this;options=options||{};this.options=jQuery.extend(this.getDefautOptions(),options);AJS.$(this.options.triggerSelector).live(this.options.eventType,function(e){thisInstance.toggle(this);e.preventDefault()});jQuery(function(){thisInstance._collapseTwixiBlocksFromCookie()})}});