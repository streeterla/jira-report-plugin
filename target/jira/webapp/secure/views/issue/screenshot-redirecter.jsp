<%@ taglib uri="webwork" prefix="ww" %>
<meta name="decorator" content="none">
<body>
<ul id="params" style="display:none">
    <li id="afterURL"><ww:property value="$afterURL" /></li>
</ul>

<script type="text/javascript">
    window.onload = function () {
        var afterURL = document.getElementById("afterURL").firstChild;
        if (afterURL) {
            var replaced = afterURL.nodeValue.replace(/\s/g, "")
            if (replaced && replaced != "") {
                window.opener.open(afterURL.nodeValue, '_top');
            }
        }
        window.close();
    }
</script>

</body>
</html>