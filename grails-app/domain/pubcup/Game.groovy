package pubcup

class Game {
	
	Date date
	List teams
	
	String toString(){
		teams?.join(" x ")
	}
		
	static mapWith = "mongo"
	
	TeamsEnum teamA() {
		teams?.first()
	}
	
	TeamsEnum teamB() {
		teams?.last()
	}
	
	def formattedDate() {
		def formattedDate = date.format("yyyy-MM-dd")
		formattedDate.toString()
	}
	
	def formattedTime() {
		def formattedTime = date.format("HH:mm")
		formattedTime.toString()
	}
}
