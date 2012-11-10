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
}
