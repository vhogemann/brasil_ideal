var marker;
var map;
var animation = false;

function initialize() {
	var mapOptions = {
		center : new google.maps.LatLng(-22.909079507, -43.1770692),
		zoom : 18,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};

  map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions);

  $.ajax ({
  	  url: config.contextPath + "/location/something/",
  	  traditional : true,
  	  data: {lat : map.getCenter().Ya , lng: map.getCenter().Za, zoom:map.getZoom()},
  	  success : callback
  });

function callback(locations){
	for(i=0 ; i<locations.length ;i++) {
		var marker = new google.maps.Marker({
    	position: new google.maps.LatLng(locations[i].x,locations[i].y),
    	map: map,
    	title: locations[i].name,
  	});
	}	
}

}


function turnMarkerReady() {
  if(!animation){
  	animation=true;
  } else {
  	animation=false;
  }
}

function activeAnimation() {
	if (animation) {
		marker.setAnimation(google.maps.Animation.BOUNCE);
	} else {
		marker.setAnimation(null);
	}
}

initialize();