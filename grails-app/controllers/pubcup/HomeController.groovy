package pubcup

import grails.converters.JSON

class HomeController {

    def index() {
		
	}

	def find(String searchKey) {

        def locations = Location.findAllByNameIlike("%${searchKey}%")

        render locations as JSON
    }
}
