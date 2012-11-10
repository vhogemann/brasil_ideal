package pubcup

import java.awt.GraphicsConfiguration.DefaultBufferCapabilities;

class HomeController {

    def index() {
		def event = Event.first()
		
		def location = event.location()
		
		[location: location, event:event]
	}
}
