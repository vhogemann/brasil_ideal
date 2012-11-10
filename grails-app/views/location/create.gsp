<%@ page import="pubcup.Location" %>
<%@ page import="pubcup.Game" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<style type="text/css">
		 
		</style>
	</head>
	<body>
			<h2>Cadastrar Localização</h2>
			<hr>
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
			<form action="save" class="form-horizontal" method="post">
				<g:render template="form"/>
				<ul>
					<g:each in="${Game.list()}" var="game" status="i">
						<li>
							<input type="checkbox" name="gameId" value="${game?.id}" id="gam${i}"/>
							<label for="gam${i}">
								<g:game value="${game}" />
							</label>
						</li>
					</g:each>
				</ul>
				<hr>
				<div class="form-actions well">
					<input type="submit" class="btn" value="${message(code: 'default.button.create.label', default: 'Create')}">
				</div>	
			</form>
		
		
		<%--<div id="create-location" class="content scaffold-create container" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			
<<<<<<< HEAD
			<g:form action="save" class="form form-horizontalform-horizontal">
				<fieldset>
=======

			<g:form action="save" >
				<fieldset class="form">
>>>>>>> 6fc85a1acf4ab965e351c3698f0c77b37278ac2b
					<g:render template="form"/>
				</fieldset>

				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	--%></body>
</html>
