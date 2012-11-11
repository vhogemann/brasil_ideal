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
		
		<r:require module="jquery" />
		<script type="text/javascript">
			function turnEditable(obj) {
				var content = $(obj).html();
				
				var textArea = jQuery('<textarea />');
				$(textArea).attr('name','locationDescription');
				$(textArea).attr('id','locationDescription');
				$(textArea).val(content);

				var submitButton = jQuery('<a />');
				$(submitButton).attr( 'href','javascript:updateLocationDescription();' );
				$(submitButton).attr( 'name','updateButton' );
				$(submitButton).attr( 'id','updateButton' );
				$(submitButton).html( 'Atualizar descrição' );

				$(submitButton).insertAfter( $(obj) );
				$(textArea).insertAfter( $(obj) );
				$(obj).remove();
				$("#editMessage").hide();
			}

			function updateLocationDescription() {
				var locationDescription = $("#locationDescription").val();

				$.ajax({
				  	 url : config.contextPath + "/location/updateDescription/",
				  	 data : {locationId: "${locationInstance.id}", description: locationDescription},
				  	 traditional : true,
				  	 success : 	function(result) {
					  	 			if(result == "true") {
						  	 			var textArea = $("#locationDescription");
										var newDescription = $(textArea).val();

										var p = jQuery("<p/>");
										$(p).html( newDescription );
										$(p).attr('onclick','turnEditable(this)');
										$(p).insertBefore( $(textArea) );

										$(textArea).remove();
										$("#updateButton").remove();
										$("#editMessage").show();
						  	 		}
					 			}
				 });
			}
		</script>
	</head>
	<body class="container">
	<blockquote>
			<h1>${locationInstance.name}</h1>
	</blockquote>		
		<div class="row-fluid">
			<div class="span7">
					<blockquote>
						<p onclick="turnEditable(this)">${locationInstance.description}</p>
						<span id="editMessage"><g:message code="location.description.edit" /></span>
					</blockquote>	
			</div>
			<div class="span4">
				<img src="${resource(dir: 'images', file: 'grails_logo.jpg')}" class="img-polaroid largeImage"/>
			</div>	
		</div>
		<div class="span12">
			<h3>Outros jogos <a href="${createLink(controller: 'location', action: 'associate', id: locationInstance?.id)}" class="btn btn-small"><i class="icon-plus"></i></a></h3> 
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
