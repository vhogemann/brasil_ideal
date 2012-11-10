
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
	</head>
	<body class="container">
	
	<blockquote>
			<h1>${locationInstance.name}</h1>
	</blockquote>		
		<div class="row-fluid">
			<div class="span7">
					<blockquote>
						<p>${locationInstance.description}</p>
					</blockquote>	
			</div>
			<div class="span4">
				<img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="img-polaroid largeImage"/>
			</div>	
		</div>
		<div class="span12">
			<h3>Outros jogos <a class="btn btn-small"><i class="icon-plus"></i></a></h3> 
		
			<div class="span6 othersGames">
<%--					<g:each in="${locationInstance.events}" var="event">--%>
<%--						<g:each in="${event.game.teams}" var="team"></g:each>	--%>
						<div class="span6">
							<div class="teams"><img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="team"/></div>
							<div class="vs">Brasil VS Argentina</div>
							<div class="teams"><img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="team"/></div>
							<div class="date"><strong>17/10/1987 - 12:30</strong></div>
						</div>
						<div class="span6">
							<div class="teams"><img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="team"/></div>
							<div class="vs">Brasil VS Argentina</div>
							<div class="teams"><img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="team"/></div>
							<div class="date"><strong>17/10/1987 - 12:30</strong></div>
						</div>
						<div class="span6">
							<div class="teams"><img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="team"/></div>
							<div class="vs">Brasil VS Argentina</div>
							<div class="teams"><img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="team"/></div>
							<div class="date"><strong>17/10/1987 - 12:30</strong></div>
						</div>
						<div class="span6">
							<div class="teams"><img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="team"/></div>
							<div class="vs">Brasil VS Argentina</div>
							<div class="teams"><img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="team"/></div>
							<div class="date"><strong>17/10/1987 - 12:30</strong></div>
						</div>
<%--					</g:each>--%>
			</div>			
		</div>	
		<%--<a href="#show-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list location">
			
				<g:if test="${locationInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="location.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${locationInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.events}">
				<li class="fieldcontain">
					<span id="events-label" class="property-label"><g:message code="location.events.label" default="Events" /></span>
					
						<g:each in="${locationInstance.events}" var="e">
						<span class="property-value" aria-labelledby="events-label"><g:link controller="event" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="location.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${locationInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${locationInstance?.id}" />
					<g:link class="edit" action="edit" id="${locationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	--%></body>
</html>
