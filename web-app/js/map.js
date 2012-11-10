function center( map ){
	if( navigator.geolocation ){
		navigator.geolocation.getCurrentPosition(function(position) {
            var pos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
            map.setCenter(pos);
            map.setZoom(18);
		});
	}
}

function initialize() {
	var mapOptions = {
		center : new google.maps.LatLng(-22.909079507, -43.1770692),
		zoom : 18,
		mapTypeId : google.maps.MapTypeId.ROADMAP,
		disableDefaultUI : true
	};

	var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

	$('#center').click(function(){
		center(map);
	});
}

initialize();
