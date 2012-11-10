package pubcup

import java.awt.GraphicsConfiguration.DefaultBufferCapabilities;
import grails.converters.JSON


class HomeController {

    def index() {
		/*def event = Event.first()
		
		def location = event.location()
		
		[location: location, event:event]*/
	}

	def find = {
        def locations = Location.findAllByNameIlike("%${params?.q}%")

        render locations.collect{ [location: it.location, id: it.id, name: it.name] } as JSON
    }
}
