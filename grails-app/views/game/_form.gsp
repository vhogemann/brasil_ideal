<%@ page import="pubcup.Game" %>

	<r:require module="games" />

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="game.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" name="date" class="datepicker" value="${gameInstance?.date}"  />
</div>

