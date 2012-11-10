package pubcup

class Game {
	
	Date date
	List teams
	
	String toString(){
		teams?.join(" x ")
	}
		
	static mapWith = "mongo"
	
	def teamAName() {
		teams?.first()
	}
	
	def teamBName() {
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
