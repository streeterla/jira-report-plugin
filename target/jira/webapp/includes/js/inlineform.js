

AJS.InlineForm = function(options)
{

    var opts = {
        width: 400,
        height: 200,
        id: "default_inlineform"
    };
    AJS.$.extend(opts, options);

    var popup = AJS.popup(opts.width, opts.height, opts.id);


    var keypressListener = function(e)
    {
        if (e.keyCode === 27)
        {
            popup.hide();
        }
    };

    AJS.$.extend(popup, {
        setContent : function(response, opts)
        {
            popup.element.empty().html(response).addClass("inlineform").prepend(AJS.$("<button class='close'></button>"));

            popup.element.find("form").submit(function(e)
            {
                var $this = AJS.$(this);
                
                $this.addClass("loading");
                $this.find("input[type='submit']").attr("disabled", "true");
                AJS.$.ajax({
                    url: $this.attr("action") + "?decorator=none&" + $this.serialize(),
                    method: "get",
                    data: {
                        inline: true,
                        decorator: "inline"
                    },
                    dataType: "html",
                    complete: function(opts){
                        return function(XMLHttpRequest, textStatus){
                            $this.removeClass("loading");
                            //In IE jQuery has a bug where 204 response codes get interpreted as 1223 (see
                            // http://dev.jquery.com/ticket/1450)
                            if (XMLHttpRequest.status === 204 || XMLHttpRequest.status == 1223)
                            {
                                opts.callback();
                                if (opts.autoClose){
                                    popup.hide();
                                }
                            }
                            else if (XMLHttpRequest.status === 200)
                            {
                                popup.setContent(XMLHttpRequest.responseText, opts);
                            }
                        };
                    }(opts)
                });
                return false;
            });
            popup.element.find("button.close").click(function(e)
            {
                popup.hide();
                return false;
            });
                        if (popup.changeSize)
                        {
                            popup.element.css("height", null);
                            popup.changeSize(undefined, popup.element.outerHeight());
                        }

        },
        init : function(options)
        {
            var initOpts = {
                callback : function()
                {
                    window.location.reload();
                },
                autoClose: true
            };

            AJS.$.extend(initOpts, options);
            AJS.$.ajax({
                url: initOpts.url,
                data: {
                    inline: true,
                    decorator: "inline"
                },
                method: "get",
                dataType: "html",
                complete: function(XMLHttpRequest, textStatus){
                    //In IE jQuery has a bug where 204 response codes get interpreted as 1223 (see
                    // http://dev.jquery.com/ticket/1450)
                    if (XMLHttpRequest.status === 204 || XMLHttpRequest.status == 1223)
                    {
                        initOpts.callback();
                        if (initOpts.autoClose){
                            popup.hide();
                        }
                    }
                    else if (XMLHttpRequest.status === 200)
                    {
                        if (popup.changeSize){
                            popup.element.css("height", "");
                        }
                        popup.setContent(XMLHttpRequest.responseText, initOpts);
                        AJS.$(document).keydown(keypressListener);
                        popup.show();
                        if (initOpts.formLoad){
                            initOpts.formLoad();
                        }
                        AJS.$("#" + opts.id + " form :input:first").focus();
                        if (popup.changeSize)
                        {
                            popup.changeSize(undefined, popup.element.outerHeight());
                        }
                    }
                }
            });
        }
    });


    AJS.$.aop.before({target: popup, method: "hide"}, function ()
    {
        AJS.$(document).unbind("keydown", keypressListener);
    });

    return popup;


};


/*
  Hijacking delete dashboard link
 */
jQuery(function(){
    var confirm = AJS.InlineForm({id:"delete-dshboard"});

    AJS.$("a.icon-tools").live("mousedown", function (e) {

        AJS.$("a#delete_dashboard").unbind("mousedown").click(function(e){
            e.stopPropagation();
            e.preventDefault();

            confirm.element.click();

            var dashId = /pageId=([0-9]*)/.exec(AJS.$(this).attr("href"))[1];

            confirm.init({
                url: contextPath + "/secure/DeletePortalPage!default.jspa?pageId=" + dashId + "&decorator=none",
                callback: function(){
                        window.location = contextPath + "/secure/Dashboard.jspa";
                },
                autoClose: false
            });
        });
        AJS.$(this).die(e.type, arguments.callee);

    });

});
