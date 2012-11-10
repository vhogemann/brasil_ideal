package pubcup

class Game {
	
	Date date
	List teams
	
	static belongsTo = [event:Event]
	
	String toString(){
		teams.join(" x ")
	}
		
	static mapWith = "mongo"
	
	def teamAName() {
		teams.first().name
	}
	
	def teamBName() {
		teams.last().name
	}
}
