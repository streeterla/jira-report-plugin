/* @namespace AJS.gadgets.templater.Table.template */

<table class="aui" cellspacing="0" border="0"> 
    <% if (obj.cols) { %> 
    <thead> 
        <tr> 
            <% AJS.$(obj.cols).each(function () { %> 
                <th 
                <% if (this.theme) { %> 
                     class="<%= this.theme %>" 
                <% } %> 
                ><div><%= this.header %></div></th> 
            <% }); %> 
        </tr> 
    </thead> 
    <% } %> 
    <% if (obj.data) { %> 
    <tbody> 
        <% AJS.$(obj.data).each(function (i) { %> 
            <tr 
            <% if (i%2) { %> 
                 class="even" 
            <% } %> 
            > 
                <% AJS.$(this).each(function () { %> 
                    <td><%= this.label %></td> 
                <% }); %> 
            </tr> 
        <% }); %> 
    </tbody> 
    <% } %> 
</table>