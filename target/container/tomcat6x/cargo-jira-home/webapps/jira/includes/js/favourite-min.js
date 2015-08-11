jQuery.namespace("jira.widget.favourite");jira.widget.favourite.NewPicker=function(options){var fieldId=options["fieldId"],favLink=AJS.$("#fav_a_"+fieldId),favHidden=AJS.$("#fav_new_"+fieldId),enabled=options["enabled"],updateLink=function(){if(enabled==="true"){favLink.addClass("enabled").removeClass("disabled").attr("title",options["titleAdd"]).text(options["titleAdd"]);favHidden.val("true")}else{favLink.addClass("disabled").removeClass("enabled").attr("title",options["titleRemove"]).text(options["titleRemove"]);favHidden.val("false")}};updateLink();favLink.click(function(e){e.preventDefault();if(enabled==="true"){enabled="false"}else{enabled="true"}updateLink()})};jira.widget.favourite.Picker=function(options){var entityId=options["entityId"],entityType=options["entityType"],favId=options["tableId"]+"_"+entityType+"_"+entityId,favLink=AJS.$("#fav_a_"+favId),enabled=options["enabled"],undoContainer=AJS.$("#undo_div"),favCountEnabled=AJS.$("#fav_count_enabled_"+favId),favCountDisabled=AJS.$("#fav_count_disabled_"+favId),relatedDropdown=options.relatedDropdown;var urlType;if(entityType==="PortalPage"){urlType="dashboards"}else{if(entityType==="SearchRequest"){urlType="filters"}}var theUrl=contextPath+"/rest/api/1.0/"+urlType+"/"+entityId+"/favourite",originalOrder=[],initOriginalOrderArray=function(){AJS.$("#"+options["tableId"]).find("[id^=fav_div_]").each(function(i,domElem){originalOrder[originalOrder.length]=AJS.$(domElem).attr("rel")})},addUndoAction=function(){if(options["undoText"]!==undefined){var undoEntityName=options["undoEntityName"];var undoDiv=AJS.$("<div/>").html(AJS.format(options["undoText"],undoEntityName));var favNode=AJS.$("#"+options["removeId"]);undoDiv.find("a").attr("id","fav_undo_a_"+options["removeId"]).click(function(e){e.preventDefault();var theData=undefined;if(originalOrder.length>0){theData={entries:originalOrder}}AJS.$.ajax({url:theUrl,contentType:"application/json",data:JSON.stringify(theData),type:"POST",success:function(){undoDiv.remove();enabled="true";updateLink();favNode.show();if(undoContainer.children().length===0){undoContainer.hide()}recolourSimpleTableRows(options["tableId"])},error:function(){alert(AJS.$(".favourite-params").find("#errorMsg").val())}})});favNode.hide();recolourSimpleTableRows(options["tableId"]);undoContainer.append(undoDiv);undoContainer.show()}},toggleFavourite=function(){if(enabled==="true"){AJS.$(AJS.$.ajax({url:theUrl,type:"DELETE",success:function(){enabled="false";updateLink();addUndoAction()},error:function(){alert(AJS.$(".favourite-params").find("#errorMsg").val())}})).throbber({target:favLink})}else{AJS.$(AJS.$.ajax({url:theUrl,type:"PUT",success:function(){enabled="true";updateLink()},error:function(){alert(AJS.$(".favourite-params").find("#errorMsg").val())}})).throbber({target:favLink})}},invalidateFiltersList=function(){if(relatedDropdown){if(jira.widget.dropdown[relatedDropdown]){jira.widget.dropdown[relatedDropdown].resetCache()}}},updateLink=function(){if(enabled==="true"){favLink.addClass("enabled").removeClass("disabled").attr("title",options["titleAdd"]).text(options["titleAdd"]);favCountEnabled.show();favCountDisabled.hide()}else{favLink.addClass("disabled").removeClass("enabled").attr("title",options["titleRemove"]).text(options["titleRemove"]);favCountEnabled.hide();favCountDisabled.show()}invalidateFiltersList()};updateLink();favLink.click(function(e){e.preventDefault();toggleFavourite()});initOriginalOrderArray()};jira.widget.favourite.Picker.init=function(parent){AJS.$(".favourite-params",parent).each(function(){var params={};AJS.$(this).find("input").each(function(){var $this=AJS.$(this);params[$this.attr("id")]=$this.val()});if(params["remote"]==="false"){jira.widget.favourite.NewPicker(params)}else{jira.widget.favourite.Picker(params)}})};AJS.$(function(){jira.widget.favourite.Picker.init()});