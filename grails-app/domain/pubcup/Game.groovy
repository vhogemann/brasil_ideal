package pubcup

class Game {
	
	Date date
	List teams
	
	String toString(){
		teams.join(" x ")
	}
	
	static mapWith = "mongo"
	
}
