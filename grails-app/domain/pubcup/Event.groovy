package pubcup

class Event {

	Game game
		
	static belongsTo = [location: Location]
	
	static mapWith = "mongo"
	
}
