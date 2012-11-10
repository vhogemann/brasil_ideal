<%@ page import="pubcup.Location" %>



<div class="control-group fieldcontain ${hasErrors(bean: locationInstance, field: 'description', 'error')} ">
	<label  class="control-label" for="description">
		<g:message code="location.description.label" default="Description" />
	</label>
	<div class="controls">
		<g:textField name="description" value="${locationInstance?.description}" required="required"/>
	</div>	
</div>

<div class="control-group fieldcontain ${hasErrors(bean: locationInstance, field: 'events', 'error')} ">
	<label class="control-label" for="events">
		<g:message code="location.events.label" default="Events" />
	</label>
	<div class="controls">
		<g:select name="events" from="${pubcup.Event.list()}"  optionKey="id"   class="many-to-many" required="required"/>
	</div>	
</div>

<div class="control-group fieldcontain ${hasErrors(bean: locationInstance, field: 'name', 'error')} ">
	<label class="control-label" for="name">
		<g:message code="location.name.label" default="Name" />
	</label>
	<div class="controls">
		<g:textField name="name" value="${locationInstance?.name}" required="required"/>
	</div>	
</div>

