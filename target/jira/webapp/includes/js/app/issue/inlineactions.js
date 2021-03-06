AJS.$(function(){
    var confirm = AJS.InlineForm({
        id: "inlineactions",
        width: 900,
        height: 300
    });

    AJS.$("a.opsbar-transitions, #editIssue, #assign-issue").click(function(e){
        e.preventDefault();
        e.stopPropagation();

        var $this = AJS.$(this);
        var href = $this.attr("href");
        confirm.init({
            url: href,
            autoClose: false
        });
    });
});