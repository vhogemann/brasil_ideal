package pubcup

class Location {
	String id
	String name
	String description
	String address
	List location
	
	static mapWith = "mongo"
	
	static hasMany = [ events:Game ]
	
	static mappings = {
		location geoIndex: true
	}

}
