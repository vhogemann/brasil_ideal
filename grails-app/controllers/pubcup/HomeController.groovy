package pubcup

import java.awt.GraphicsConfiguration.DefaultBufferCapabilities;
import grails.converters.JSON


class HomeController {

    def index() {
		/*def event = Event.first()
		
		def location = event.location()
		
		[location: location, event:event]*/
	}

	def find(String searchKey) {

        def locations = Location.findAllByNameIlike("%${searchKey}%")

        render locations as JSON
    }
	
	def nextGames() {
		def initialGameTime = new Date()
		initialGameTime.hours -= 2
		
		def gameCriteria = Game.createCriteria()
		def games = gameCriteria.list() {
			gt("date", initialGameTime)
			order("date","asc")
		}
		
		render(view:"nextGames", model:[games : games])
	}
}
