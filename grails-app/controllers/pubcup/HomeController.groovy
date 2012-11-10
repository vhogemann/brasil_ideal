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
}
