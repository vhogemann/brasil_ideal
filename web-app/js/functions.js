/**
 *
 * Recarrega o elemento para ocupar toda tela
 *
**/
function resizeElementToFullScreen( element ) {
	var header = $("#header").height();
	var footer = $("#footer").height();
	var total  = $(window).height() - (header + footer);  

	$(element).height(total);
}

jQuery(function($) {
	$(window).resize( resizeElementToFullScreen( $(".helper") ) );

    window.onresize = function(event) {
        resizeElementToFullScreen( $(".helper") );
        if( $(".map").length )
        	resizeElementToFullScreen( $(".map") );
    }

    resizeElementToFullScreen( $(".helper") );

    $('#welcome-link').click(function() {
    	$('.helper').fadeIn('slow');
    });
});