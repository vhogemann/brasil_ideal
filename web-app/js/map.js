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

  google.maps.event.addListener(map,'bounds_changed', function(){
  	 var bound = this.getBounds();
  	 var lat1 = bound.ca.f;
  	 var long1 = bound.ca.b;
  	 var lat2 = bound.ea.f;
  	 var long2 = bound.ea.b;
  	 
  	 ajax({
  	 	url : config.contextPath + "/home/near/",
  	 	data : {lat1:lat1 , long1:long1 , lat2:lat2, long2:long2},
  	 	traditional : true,
  	 	success : function(data){
  	 		console.log(data);
  	 	}
  	 });
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


function plotLocation(obj){
	var marker = new google.maps.Marker({
    	position: new google.maps.LatLng(obj.location[0],obj.location[1]),
    	map: map,
    	title: obj.name,
  	});
		google.maps.event.addListener(marker, 'mouseover', turnMarkerReady);
		google.maps.event.addListener(marker,'mouseout', activeAnimation);
    google.maps.event.addListener(marker,'click', function(){
      $("#toasterPlace").load(config.contextPath + '/home/showLocationToaster', {locationId: obj.id}, function(){
        reloadCountDown();
      });
    });
		map.panTo(marker.getPosition());
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
