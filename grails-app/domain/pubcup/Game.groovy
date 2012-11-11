package pubcup

class Game {
	
	Date date
	List teams
	
	String toString(){
		"${teamA().code} x ${teamB().code}"
	}
		
	static mapWith = "mongo"
	
	TeamsEnum teamA() {
		teams?.first()
	}
	
	TeamsEnum teamB() {
		teams?.last()
	}
	
	def formattedDate() {
		def date = new Date()
		def formattedDate = date.format("yyyy-MM-dd")
		formattedDate.toString()
	}
	
	def formattedTime() {
		def date = new Date()
		def formattedTime = date.format("HH:mm")
		formattedTime.toString()
	}
}
