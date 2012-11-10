<%@ page import="pubcup.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="location.description.label" default="Description" />
	</label>
	<g:textField name="description" value="${locationInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'events', 'error')} ">
	<label for="events">
		<g:message code="location.events.label" default="Events" />
		
	</label>
	<g:select name="events" from="${pubcup.Event.list()}" multiple="multiple" optionKey="id" size="5" value="${locationInstance?.events*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="location.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${locationInstance?.name}"/>
</div>

