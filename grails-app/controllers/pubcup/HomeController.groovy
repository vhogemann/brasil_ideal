package pubcup

import java.awt.GraphicsConfiguration.DefaultBufferCapabilities;
import grails.converters.JSON


class HomeController {

    def index() {
	}
	
	def showToaster() {
		def event = Event.get(params.id)
		def location = event.location
		
		render(template: "toaster", model: [event: event, location: location])
	}

	def find(String searchKey) {

        def locations = Location.findAllByNameIlike("%${searchKey}%")

        render locations as JSON
    }

    def near(Float lat1, Float long1, Float lat2, Float long2, String gameId ){
        def locations = []

    	def box = [ [ lat1 , long1 ] , [ lat2 , long2 ] ]
    	
    	if(latitude && longitude){
	    	if(gameId)
	    		locations = Location.findByLocationWithinBoxAndEventGameId(box, gameId)
	    	else
	    		locations = Location.findByLocationWithinBox(box)
    	}

    	render locations as JSON

    }
}
