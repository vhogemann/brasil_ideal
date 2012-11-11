var geocoder;
var map;
var marker;
var plotMapControl = {};
var holdNearSearch = false;
 
function initialize() {
	
    var latlng = new google.maps.LatLng(-18.8800397, -47.05878999999999);
    var options = {
        zoom: 5,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scaleControl: false,
        streetViewControl: false,
        overviewMapControl: false,
        mapTypeControl: false
        , panControl: false
        , zoomControl: false
        , zoomControlOptions: {
        	position: google.maps.ControlPosition.BOTTOM_RIGHT,
        	style: google.maps.ZoomControlStyle.SMALL
        }
    };
 
    map = new google.maps.Map(document.getElementById("map_canvas"), options);
 
    geocoder = new google.maps.Geocoder();
 
    marker = new google.maps.Marker({
        map: map,
        draggable: true,
    });
 
    marker.setPosition(latlng);
    google.maps.event.addListener(map,'center_changed', function(){
        holdNearSearch = false;
    });

    window.setInterval(function() {
        if(!holdNearSearch) {
            var bound = map.getBounds();
            var lat1 = bound.ca.f;
            var long1 = bound.ca.b;
            var lat2 = bound.ea.f;
            var long2 = bound.ea.b;
            ajax({
                url : config.contextPath + "/home/near/",
                data : {lat1:lat1 , long1:long1 , lat2:lat2, long2:long2},
                traditional : true,
                success : plotLocations
            });
        }	
	}, 5000);
}

function plotLocations(locations){
	for(i=0 ; i<locations.length ;i++) {
		createMarker(locations[i]);
	}	
}

function loadToasterCreate(args){
    var template = $("#new-location-template");
    template.find(".address").text(args.name);
    template.find(".btn-create").attr('href', config.contextPath + "/location/create?lat=" + args.lat + "&lng=" + args.lng + "&address=" + args.name);
    $("#toasterPlace").html(template.html());
}

function loadToaster(obj){
	$("#toasterPlace").load(config.contextPath + '/home/showLocationToaster', {locationId: obj.id}, function(){
        reloadCountDown();
    });
	$(".infobar").addClass('opened')
}

function recolorOthersPins() {
    var pinColor = "FE7569";
    var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
        new google.maps.Size(21, 34),
        new google.maps.Point(0,0),
        new google.maps.Point(10, 34)
    );
    for(m in plotMapControl){
        plotMapControl[m].setIcon(pinImage);
    }
}

function createMarker(obj){
	var hash = getKey(obj);
	var marker = plotMapControl[hash]; 
	if(!marker){
		marker = new google.maps.Marker({
    		position: new google.maps.LatLng(obj.lat,obj.lng),
    		map: map,
    		title: obj.name,
    		animation : google.maps.Animation.DROP
  		});
        var pinColor = "00AEFF";
        var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
            new google.maps.Size(21, 34),
            new google.maps.Point(0,0),
            new google.maps.Point(10, 34)
        );
      	google.maps.event.addListener(marker,'click', function(){
            recolorOthersPins();
            marker.setIcon(pinImage);
            if(obj.id){
                loadToaster(obj);
            }else{
                loadToasterCreate(obj);
            }
    	});
    	plotMapControl[hash]=marker;
  	}
  	return marker;
}

function getKey(obj){
	return obj.lat+" "+obj.lng+" "+obj.name;
}


function ajax(options){
	$.ajax(options);
}

function center( map ){
	if( navigator.geolocation ){
		navigator.geolocation.getCurrentPosition(function(position) {
            var pos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
            map.setCenter(pos);
            map.setZoom(18);
		});
	}
}

$(document).ready( function() {
	initialize();
	
	function loadOnMap(address) {
        geocoder.geocode({ 'address': address + ', Brasil', 'region': 'BR' }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
 
                    $('#searchKey').val(results[0].formatted_address);
                    $('#txtLatitude').val(latitude);
                    $('#txtLongitude').val(longitude);
 
                    var location = new google.maps.LatLng(latitude, longitude);
                    marker.setPosition(location);
                    map.setCenter(location);
                    map.setZoom(16);
                }
            }
        });
    }
 
    $("#searchKey").blur(function() {
        if($(this).val() != "")
        	loadOnMap($(this).val());
    });
	
	google.maps.event.addListener(marker, 'drag', function () {
        geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                	$('#searchKey').val(results[0].formatted_address);
                	$('#txtLatitude').val(marker.getPosition().lat());
                	$('#txtLongitude').val(marker.getPosition().lng());
                }
            }
        });
    });
    
	$("#searchKey").autocomplete({
        source: function (request, response) {
        	ajax({
        		url: config.contextPath + '/home/find',
        		traditional: true,
        		data: {q : request.term},
        		success : function(data) {
	        		geocoder.geocode({ 'address': request.term + ', Brasil', 'region': 'BR' }, function (results, status) {
	                	var r = $.map(data, function(item){
	                		return {
	                			id: item.id,
	                			label: item.name,
	                			value: item.name,
	                			latitude: item.lat,
	                			longitude: item.lng
	                		}
	                	});
	                	var googleRs = $.map(results, function (item) {
	                    	return {
	                        	label: item.formatted_address,
	                        	value: item.formatted_address,
	                        	latitude: item.geometry.location.lat(),
	                        	longitude: item.geometry.location.lng()
	                    	}
	                	});
	                	response(r.concat(googleRs));
	            	});
        		}
        	});
        },
        select: function (event, ui) {
            $("#txtLatitude").val(ui.item.latitude);
            $("#txtLongitude").val(ui.item.longitude);
            var locationData = {
            	id: ui.item.id,
                lat: ui.item.latitude,
                lng: ui.item.longitude,
                name: ui.item.label
            };
            createMarker(locationData);
            var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
            map.setCenter(location);
            map.setZoom(16);
            if(locationData.id){
            	loadToaster(locationData);
            }else{
            	loadToasterCreate(locationData);
            }
        }
    });
	
	$('#center').click(function(){
		center(map);
	}).trigger('click');
	
    function clearMarkers(){
        for(m in plotMapControl){
            plotMapControl[m].setMap(null);
            delete plotMapControl[m];
        }
    }

	$('#bt_show_game_list').click(function(e) {
        $('#games-list').fadeToggle('slow');
    });

    $('#games-list a').click(function(e) {
        clearMarkers(); holdNearSearch=true;
        var id      = this.id.replace(/[a-z_]+/,'');
        var data    = {};

        if( id != null && id != "" )
            data = { id : id };

        $.ajax({
            type: "GET",
            url : config.contextPath + "/location/findAllByGameId",
            data : data,
            dataType: 'json',
            success: function(data) {
                plotLocations(data);
            }
        });

        e.preventDefault();
    });
    
    function resizeMap() {
    	var header = $("#header").height();
    	var footer = $("#footer").height();
    	var total = $(window).height() - (header + footer);  
    	$(".map").height(total);
    }
    
    $(window).resize(resizeMap());
    window.onresize = function(event) {
    	resizeMap();
    }
    resizeMap();
    
});
