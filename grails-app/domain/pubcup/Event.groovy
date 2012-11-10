package pubcup

class Event {
	
	static belongsTo = [location: Location]
	static hasOne = [game:Game]
	
	static mapWith = "mongo"
	
}
