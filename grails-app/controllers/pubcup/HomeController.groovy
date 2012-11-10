package pubcup

import java.awt.GraphicsConfiguration.DefaultBufferCapabilities;
import grails.converters.JSON


class HomeController {

    def index() {
	}
	
	def showToaster() {
		def event = Event.get(params.id)
		def location = event.location
		
		println ">>" + event.game
		
		render(template: "toaster", model: [event: event, location: location])
	}

	def find = {
        def locations = Location.findAllByNameIlike("%${params?.q}%")

        render locations.collect{ [location: it.location, id: it.id, name: it.name] } as JSON
    }

    def near(Float lat1, Float long1, Float lat2, Float long2, String gameId ){
        def locations

    	def box = [ [ lat1 , long1 ] , [ lat2 , long2 ] ]
    	
    	if(gameId)
    		locations = Location.findByLocationWithinBoxAndEventGameId(box, gameId)
    	else
    		locations = Location.findByLocationWithinBox(box)

    	if(!locations)
    		locations = []

    	render locations as JSON

    }
}
