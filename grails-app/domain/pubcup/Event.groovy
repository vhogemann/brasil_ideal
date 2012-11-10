package pubcup

class Event {
	
	static belongsTo = [location: Location]
	
	Game game
	
	static mapWith = "mongo"
	
}
