package pubcup

class Location {
	String id
	String name
	String description
	String address
	List location
	String lat
	String lng

	public void setLocation(List location){
		this.location = location
		lat = "${location[0]}"
		lng = "${location[1]}"
	}

	static mapWith = "mongo"
	
	static hasMany = [ events:Event ]
	
	static mappings = {
		location geoIndex: true
	}

}
