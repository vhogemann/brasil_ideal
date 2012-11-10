package pubcup

import grails.converters.JSON

class HomeController {

    def index() {
		def location = Location.get(1)
		def event = location.getEvents().get(0)
		def game = event.getGame() 
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
