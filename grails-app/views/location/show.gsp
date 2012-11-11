<%@ page import="pubcup.Location" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="" args="[entityName]" /></title>
		<r:require module="showLocation" />
		<r:require module="bootstrapcss" />
	</head>
	<body>
		<div class="local-data">
			<h1 class="tit">${locationInstance.name}</h1>
			<p class="description" onclick="turnEditable(this)" id="originalDescription">${locationInstance.description}</p>
			<span id="editMessage"><g:message code="location.description.edit" /></span>
			<g:hiddenField name="locationId" value="${locationInstance.id}" id="locationId"/>
		</div>
<<<<<<< HEAD
		
		<div class="events">
			<div class="event-head">
				<h2 class="">Outros jogos</h2>
				<span class="add-event">
					<g:link controller="location" action="associate" id="${locationInstance?.id }" class="bt">+ Adicionar Evento</g:link>
				</span>
			</div>
			<ul class="event-list">
=======
		<div class="span12">
			<h3>Outros jogos <g:link controller="location" action="associate" id="${locationInstance?.id }" class="btn btn-small" ><i class="icon-plus">+</i></g:link></h3> 
			<div class="span6 othersGames">
				<g:if test="${!events}">
						<li><g:message code="game.no.registered" default="There is no item registered."/></li>
					</g:if>
>>>>>>> d816a9a1cd3d136cfbf4e8d3443a5635045cd8d3
				<g:each in="${locationInstance.events}" var="event">
					<li>
						<span class="vs1">
							<span class="flag">
								<span class="${event.game?.teamA()?.code?.toLowerCase()}"></span>
								<strong class="name">${event.game.teamA()?.code?.encodeAsHTML()}</strong>
							</span>
						</span>
						<span class="score">
							<span class="vs">x</span>
						</span>
						<span class="vs2">
							<span class="flag">
								<span class="${event?.game?.teamB()?.code?.toLowerCase()}"></span>
								<strong class="name">${event?.game?.teamB()?.code?.encodeAsHTML()}</strong>
							</span>
						</span>
					</li>
				</g:each>
			</ul>
		</div>
	</body>
</html>