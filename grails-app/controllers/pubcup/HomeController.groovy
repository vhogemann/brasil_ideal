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

    def near(Float latitude, Float longitude, Float radius, String gameId ){
        def locations = []
    	def center = [ longitude, latitude ]
    	if(gameId)
    		locations = Location.findByLocationWithinCircle
    	else
    		locations = Location.findByLocationWithinCircleAndEventGameId([center, radius],gameId)

    	render locations as JSON

    }
}
