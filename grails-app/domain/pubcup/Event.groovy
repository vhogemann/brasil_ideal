package pubcup

class Event {
	
	static belongsTo = [location: Location]
	
	Date date
	
	Game game
	
	static mapWith = "mongo"
	
}
