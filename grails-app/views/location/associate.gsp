<%@ page import="pubcup.Location" %>
<%@ page import="pubcup.Game" %>
<%@ page import="pubcup.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-location" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${locationInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${locationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="eventSave" class="well">
				<fieldset>
					<legend>${location?.name?.encodeAsHTML()}</legend>
					<g:hiddenField name="id" value="${location?.id }"/>
					<ul>
						<g:each in="${gameList}" var="game" status="i">
							<li>
								<input type="checkbox" name="gameId" value="${game?.id}" id="gam${i}"/>
								<label for="gam${i}">
									<g:game value="${game}" />
								</label>
							</li>
						</g:each>
					</ul>
					<input class="btn" type="submit" value="${message(code: 'default.button.create.label', default: 'Create')}" />	
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
