import pubcup.*

class BootStrap {

    def init = { servletContext ->

    	Game.list()*.delete()

    	def teams 		= TeamsEnum.values()
    	def gameTeams	= []
    	
    	teams.eachWithIndex { team, i ->
    		gameTeams << team
    		if((i+1)%2==0) {
    			new Game(date: new Date(), teams:gameTeams).save()
    			gameTeams = []

    		}
    	}
    }
    def destroy = {
    }
}
