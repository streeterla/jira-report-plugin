/* @namespace AJS.gadgets.templater.Form.template */

<% var i18nHelper = new gadgets.Prefs(); %>

<% function createCheckboxGroup (field) { %>
	<fieldset class="group
		<% if (field.styleClass) { %>
			<%= gadgets.util.escape(field.styleClass) %>
		<% } %>"
        <% if (field.id) { %>
			id="<%= gadgets.util.escape(field.id) %>"
		<% } %>
    >
		<% if ( field.label ) { %>
			<legend><span><%= gadgets.util.escape(field.label) %></span></legend>
		<% } %>

        <% for (var i=0; i < field.options.length; i++) { %>
            <div class="checkbox">
                <input type="checkbox"
                    <% if (field.options[i].id) { %>
                        id="<%= gadgets.util.escape(field.options[i].id) %>"
                    <% } else { %>
                        id="<%= gadgets.util.escape(field.userpref + "-" + i) %>"
                    <% } %>
                    <% if ( field.value === "true" ) { %>
                        checked = "checked"
                    <% } %>
                    <% if (field.value === "false") { field.value = "true"; } %>
                    value="<%= field.value %>"
                    name="<%= gadgets.util.escape(field.userpref) %>"
                />
                <% if (field.options[i].label) { %>
                    <label
                        <% if (field.options[i].id) { %>
                            for="<%= gadgets.util.escape(field.options[i].id) %>"
                        <% } else { %>
                            for="<%= gadgets.util.escape(field.userpref + "-" + i) %>"
                        <% } %>
                    ><%= gadgets.util.escape(field.options[i].label) %></label>
                <% } %>
                <span class="error"></span>
            </div>
        <% } %>
        <% if (field.description) { %>
		    <div><span class="description"><%= field.description %></span></div>
        <% } %>
	</fieldset>
<% } %>

<% function createRadioGroup (field) { %>
	<fieldset class="group
		<% if (field.styleClass) { %>
			<%= gadgets.util.escape(field.styleClass) %>
		<% } %>"
        <% if (field.id) { %>
			id="<%= gadgets.util.escape(field.id) %>"
		<% } %>
    >
		<% if ( field.label ) { %>
			<legend><span><%= gadgets.util.escape(field.label) %></span></legend>
		<% } %>
		<div>
			<% for (var i=0; i < field.options.length; i++) { %>
				<div class="radio">
					<input type="radio"
						<% if (field.options[i].id) { %>
							id="<%= gadgets.util.escape(field.options[i].id) %>"
						<% } else { %>
							id="<%= gadgets.util.escape(field.userpref + "-" + i) %>"
						<% } %>
						<% if (field.selected === field.options[i].value || field.options[i].selected) { %>
							checked = "checked"
						<% } %>
                        <% if ( field.options[i].value ) { %>
                            value="<%= gadgets.util.escape(field.options[i].value) %>"
                        <% } %>
						name="<%= gadgets.util.escape(field.userpref) %>"
					/>
					<label
						<% if (field.options[i].id) { %>
							for="<%= gadgets.util.escape(field.options[i].id) %>"
						<% } else { %>
							for="<%= gadgets.util.escape(field.userpref + "-" + i) %>"
						<% } %>
					><%= gadgets.util.escape(field.options[i].label) %></label>
					<span class="error"></span>
				</div>
			<% } %>
		</div>
        <% if (field.description) { %>
		    <div><span class="description"><%= field.description %></span></div>
        <% } %>
	</fieldset>
<% } %>

<% function createHiddenInput (field) { %>
	<input type="hidden" name="<%= gadgets.util.escape(field.userpref) %>" value="<%= gadgets.util.escape(field.value) %>" />
<% } %>

<% function createTextInput (field) { %>
	<input type="<%= gadgets.util.escape(field.type) %>"
		<% if (field.styleClass) { %>
			class="<%= gadgets.util.escape(styleClass) %>"
		<% } else { %>
			class="<%= gadgets.util.escape(field.type) %>"
		<% } %>
        <% if (field.value) { %>
            value="<%= gadgets.util.escape(field.value) %>"
        <% } %>
        <% if (!field.id) { %>
			id="<%= gadgets.util.escape(field.userpref) %>"
		<% } else { %>
			id="<%= gadgets.util.escape(field.id) %>"
		<% } %>
		name="<%= gadgets.util.escape(field.userpref) %>"
	/>
    <span class="error"></span>
    <% if (field.description) { %>
        <span class="description"><%= field.description %></span>
	<% } %>
<% } %>

<% function createLabel (field) { %>
	<label for="<%= gadgets.util.escape(field.userpref) %>"><%= gadgets.util.escape(field.label) %></label>
<% } %>

<% function createTextarea (field) { %>
	<textarea 
		<% if (field.styleClass) { %>
			class="<%= gadgets.util.escape(field.styleClass) %>"
		<% } %>
        <% if (!field.id) { %>
			id="<%= gadgets.util.escape(field.userpref) %>"
		<% } else { %>
			id="<%= gadgets.util.escape(field.id) %>"
		<% } %>
		name="<%= gadgets.util.escape(field.userpref) %>"
	><% if (field.value) { %><%= gadgets.util.escape(field.value) %><% } %></textarea>
	<span class="error"></span>
	<% if (field.description) { %>
        <span class="description"><%= field.description %></span>
    <% } %>
<% } %>

<% function createSelect (field) { %>
	<% function createOption (item) { %>
			<option
			    <% if ( item.id) { %>
				    id = "<%= gadgets.util.escape(item.id) %>"
				<% } %>
			    value="<%= gadgets.util.escape(item.value) %>"
				<% if ( field.selected === item.value || item.selected) { %>
				    selected = "selected"
				<% } %>
				><%= gadgets.util.escape(item.label) %></option>
	<% } %>
	<select
		<% if (field.styleClass) { %>
			class="<%= gadgets.util.escape(field.styleClass) %>"
		<% } else { %>
            class="select"
        <% } %>
		<% if (!field.id) { %>
			id="<%= gadgets.util.escape(field.userpref) %>"
		<% } else { %>
			id="<%= gadgets.util.escape(field.id) %>"
		<% } %>
		name="<%= gadgets.util.escape(field.userpref) %>">
		<% for ( var i = 0; i < field.options.length; i++ ) { %>
			<% if ( field.options[i].group ) { %>
				<optgroup label="<%= gadgets.util.escape(field.options[i].group.label) %>">
                   <% if (field.options[i].group.options) { %>
                        <% for ( var x = 0; x < field.options[i].group.options.length; x++ ) { %>
                            <% createOption(field.options[i].group.options[x]); %>
                        <% } %>
                   <% } %>
				</optgroup>
			<% } else { %>
				<% createOption(field.options[i]); %>
			<% } %>
		<% } %>
	</select>
	<span class="error"></span>
	<% if (field.description) { %>
        <span class="description"><%= field.description %></span>
    <% } %>
<% } %>

<% function createMultiSelect (field) { %>
	<% function createOption (item) { %>
			<option
			    <% if ( item.id) { %>
				    id = "<%= gadgets.util.escape(item.id) %>"
				<% } %>
				value="<%= gadgets.util.escape(item.value) %>"
				<%
				  var selected = false;
				if(field.value !== undefined && field.value.length > 0) {
				    for(var i = 0; i < field.value.length; i++) {
				        if(field.value[i] === item.value) {
				            selected = true;
				            break;
				        }
				    }
				}
				if (selected) { %>
				    selected = "selected"
				<% } %>
				><%= gadgets.util.escape(item.label) %></option>
	<% } %>
	<select multiple="multiple"
		<% if (field.styleClass) { %>
			class="<%= gadgets.util.escape(field.styleClass) %>"
		<% } else { %>
            class="multi-select"
        <% } %>
		<% if (!field.id) { %>
			id="<%= gadgets.util.escape(field.userpref) %>"
		<% } else { %>
			id="<%= gadgets.util.escape(field.id) %>"
		<% } %>
		name="<%= gadgets.util.escape(field.userpref) %>">
		<% for ( var i = 0; i < field.options.length; i++ ) { %>
			<% if ( field.options[i].group ) { %>
				<optgroup label="<%= gadgets.util.escape(field.options[i].group.label) %>">
					<% for ( var x = 0; x < field.options[i].group.options.length; x++ ) { %>
						<% createOption(field.options[i].group.options[x]); %>
					<% } %>
				</optgroup>
			<% } else { %>
				<% createOption(field.options[i]); %>
			<% } %>
		<% } %>
	</select>
	<span class="error"></span>
	<% if (field.description) { %>
        <span class="description"><%= field.description %></span>
    <% } %>
<% } %>

<% function createField(field, type) { %>
	<% if (type !== "inline" && field.type !== "radio" && field.type !== "checkbox" && field.type !== "hidden") { %>
        <div>
	<% } %>
	<% if (field.type !== "radio" && field.type !== "checkbox"&& field.type !== "hidden") { %>
		<% createLabel(field); %>
	<% } %>
	<% if (field.type == "select") { %>
		<% createSelect(field); %>
    <% } else if (field.type == "multiselect") { %>
		<% createMultiSelect(field); %>
	<% } else if (field.type == "textarea") { %>
		<% createTextarea(field); %>
	<% } else if (field.type == "radio") { %>
		<% createRadioGroup(field); %>
	<% } else if (field.type == "checkbox") { %>
		<% createCheckboxGroup(field); %>
	<% } else if (field.type == "custom" && field.template) { %>
		<%= field.template() %>
        <span id="<%= field.userpref %>-error" class="error"></span>
	<% } else if (field.type == "callbackBuilder") { %>
        <% if (field.id){%>
            <div id="<%=field.id%>" class="builder-container"></div>
        <% } else { %>
            <div class="builder-container"></div>
        <% } %>
        <span id="<%= field.userpref %>-error" class="error"></span>
	<% } else if (field.type == "hidden") { %>
		<% createHiddenInput(field); %>
	<% } else { %>
		<% createTextInput(field); %>
	<% } %>
	<% if (type !== "inline" && field.type !== "radio" && field.type !== "checkbox" && field.type !== "hidden") { %>
		</div>
	<% } %>
<% } %>

<% function createFieldset (fieldset, type) { %>
	<fieldset>
	<% if (fieldset.title) { %>
		<legend><span><%= gadgets.util.escape(fieldset.title) %></span></legend>
	<% } %>
	<% if (fieldset.description) { %>
		<p><%= gadgets.util.escape(fieldset.description) %></p>
	<% } %>
	<% for ( var i = 0; i < fieldset.fields.length; i++ ) { %>
		<% createField(fieldset.fields[i], type); %>
	<% } %>
	</fieldset>
<% } %>


<form action="<%= gadgets.util.escape(obj.action || '') %>" method="post" class="aui <%= gadgets.util.escape(obj.theme || '') %>">
    <% if (obj.title) { %>
        <h2><%= gadgets.util.escape(obj.title) %></h2>
	<% } %>
	<% if (obj.description ) { %>
		<p><%= gadgets.util.escape(obj.description) %></p>
	<% } %>
	<% if (obj.fieldsets) { %>
		<% for ( var i = 0; i < obj.fieldsets.length; i++ ) { %>
			<% createFieldset(obj.fieldsets[i], obj.type); %>
		<% } %>
	<% } else if (obj.fields && obj.fields.length > 0) { %>
		<% for ( var i = 0; i < obj.fields.length; i++ ) { %>
			<% createField(obj.fields[i], obj.theme); %>
		<% } %>
	<% } %>
	<div class="submit">
		<input class="button save" type="submit" value="<%= i18nHelper.getMsg('gadget.common.save') %>">
		<input class="button cancel" type="button" value="<%= i18nHelper.getMsg('gadget.common.cancel') %>">
	</div>
</form>
