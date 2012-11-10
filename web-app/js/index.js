jQuery(function($) {
	var url =  new String(window.location);

	var urlparts = url.split("/");
	var host = urlparts[0]+'//'+urlparts[2]+'/'+urlparts[3];
	$('.searchKey').autocomplete(host+'/home/find', {
		dataType: 'json',
		parse: function(locations) {
			return $.map(locations, function(location) {
				return {
					data: location,
					value: location.name,
					result: location.name
				};
			});
		},
		formatItem: function(location) {
			return location.name;
		}
	}).result(function(event, location, formatted) {
		var obj = {};
	 	obj.id = location.id;
	 	obj.lat = location.location[0];
	 	obj.lng = location.location[1];
	 	obj.name = location.name;
	 	var marker = createMarker(obj);
	 	map.panTo(marker.getPosition());
	});
});