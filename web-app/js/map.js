var map;
var animation = false;

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

  map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions);
 
  $('#center').click(function(){
		center(map);
	});

  ajax({ 
  	 url: config.contextPath + "/location/something/",
  	 traditional : true,
  	 data: {lat : map.getCenter().Ya , lng: map.getCenter().Za, zoom:map.getZoom()},
  	 success : findLocations
  	});
}

function findLocations(locations){
	var marker;
	for(i=0 ; i<locations.length ;i++) {
		marker = new google.maps.Marker({
    	position: new google.maps.LatLng(locations[i].x,locations[i].y),
    	map: map,
    	title: locations[i].name,
  	});
		google.maps.event.addListener(marker, 'mouseover', turnMarkerReady);
		google.maps.event.addListener(marker,'mouseout', activeAnimation);
	}	
}

function ajax(options){
	$.ajax(options);
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
		this.setAnimation(google.maps.Animation.BOUNCE);
	} else {
		this.setAnimation(null);
	}
}

initialize();
