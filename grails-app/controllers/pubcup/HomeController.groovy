package pubcup

import java.awt.GraphicsConfiguration.DefaultBufferCapabilities;
import grails.converters.JSON


class HomeController {

	def locationService

    def index() {
	}

	def showLocationToaster(){
		def location = Location.get(params.locationId)
		def initialGameTime = new Date()
		initialGameTime.hours -= 2
		def event = location.events.find{ it.game.date > initialGameTime }
		render(template: "toaster", model: [event: event, location: location])
	}	

	def showToaster() {
		def event = Event.get(params.id)
		def location = event.location
		render(template: "toaster", model: [event: event, location: location])
	}

	def find = {
        def locations = locationService.find(params?.q)

        render locations
    }

    def near(Float lat1, Float long1, Float lat2, Float long2, String gameId ){
        def locations

    	def box = [ [ lat1 , long1 ] , [ lat2 , long2 ] ]
    	
    	if(gameId)
    		locations = Location.findAllByLocationWithinBoxAndEventGameId(box, gameId)
    	else
    		locations = Location.findAllByLocationWithinBox(box)

    	if(!locations)
    		locations = []

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
