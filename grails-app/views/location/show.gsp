<%@ page import="pubcup.Location" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style type="text/css">
			.largeImage{
				width: 100%;
			}
			.othersGames{
				border: solid 1px;
				padding: 10px;
			}
			.date{
				padding: 13px;
				margin-left : 20px;
				float:left;
			}
			.vs{
				float:left;
				margin: 0px 20px 0px 20px;
				font-weight: bold;
				font-size: 18px; 
				padding: 10px;
			}
			.teams{
				float:left;
				width: 40px;
				 
			}
			.team{
				height: 40px;
				margin-left: 0px;
			}
			.span1, .span2{
				margin-left: 0px;
				padding: 0px;
				border: solid 1px;
			}
			#associationGame{
				margin-top: 5px;
				float: left;
				border: 1px solid;
			}
		</style>
		
		<r:require module="showLocation" />
	</head>
	<body class="container">
		<blockquote>
			<h1>${locationInstance.name}</h1>
		</blockquote>		
		<div class="row-fluid">
			<div class="span7">
				<blockquote>
					<p onclick="turnEditable(this)" id="originalDescription">${locationInstance.description}</p>
					<span id="editMessage"><g:message code="location.description.edit" /></span>
				</blockquote>	
			</div>
			<div class="span4">
				<g:hiddenField name="locationId" value="${locationInstance.id}" id="locationId"/>
				<img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="img-polaroid largeImage"/>
			</div>	
		</div>
		<div class="span12">
			<h3>Outros jogos <g:link controller="location" action="associate" id="${locationInstance?.id }" class="btn btn-small" ><i class="icon-plus">+</i></g:link></h3> 
			<div class="span6 othersGames">
				<g:each in="${locationInstance.events}" var="event">
					<div class="span6">
						<div class="teams"><img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="team"/></div>
						<div class="vs">${event.game.teams.get(0)} VS ${event.game.teams.get(1)}</div>
						<div class="teams"><img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="team"/></div>
						<div class="date"><strong>${event.game.date.format('dd/MM/yyyy HH:MM')}</strong></div>
					</div>
				</g:each>
			</div>			
		</div>
	</body>
</html>