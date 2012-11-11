package pubcup

class Game {
	
	Date date
	List teams
	
	String toString(){
		teams?.join(" x ")
	}
		
	static mapWith = "mongo"
	
	def teamA() {
		teams?.first()
	}
	
	def teamB() {
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
