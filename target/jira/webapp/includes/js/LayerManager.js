

(function () {

    var $doc = jQuery(document);

    function getWindow () {
        if (window.top) {
            return window.top;
        } else {
            return window;
        }
    }

    function listenForLayerEvents ($doc) {
        $doc.bind("showLayer", function (e, type, item) {
            var topWindow = getWindow().AJS;
            if (topWindow) {
                if (topWindow.currentLayerItem && topWindow.currentLayerItem.type !== "popup"
                        && item !== topWindow.currentLayerItem) {
                    topWindow.currentLayerItem.hide();
                }
                if (item) {
                    topWindow.currentLayerItem = item;
                    topWindow.currentLayerItem.type = type;
                }
            }
        })
        .bind("hideLayer", function (e, type, item) {
            var topWindow = getWindow().AJS;
            if (topWindow.currentLayerItem && item === topWindow.currentLayerItem) {
                topWindow.currentLayerItem = null;
            }
        })
        .click(function () {
            var topWindow = getWindow().AJS;
            if (topWindow.currentLayerItem && topWindow.currentLayerItem.type !== "popup") {
                topWindow.currentLayerItem.hide();
            }
        });
    }

    $doc.bind("iframeAppended", function (e, iframe) {
        iframe = jQuery(iframe);
        iframe.load(function () {
            listenForLayerEvents(iframe.contents());
        });
    });

    listenForLayerEvents($doc);
})();

