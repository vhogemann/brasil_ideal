package pubcup

class Game {
	
	Date date
	
	List teams
	
	String toString(){
		teams.join(" vs ")
	}
	
	static mapWith = "mongo"
	
}
