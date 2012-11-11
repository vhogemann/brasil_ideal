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
	  	 success : populateResult
	 });
}

function populateResult(result) {
	if(result == "true") {
		var textArea = $("#locationDescription");
		var newDescription = $(textArea).val();
	
		var p = jQuery("<p/>");
		$(p).html( newDescription );
		$(p).attr('onclick','turnEditable(this)');
		$(p).insertBefore( $(textArea) );
	
		$(textArea).remove();
		$('#updateButton').remove();
		$('#editMessage').show();
	}
}

$(document).ready(function() {
	$("body").addClass("show-location");
});