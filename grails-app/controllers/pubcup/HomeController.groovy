package pubcup

class HomeController {

    def index() {
		def location = Location.get(1)
		def event = location.getEvents().get(0)
		def game = event.getGame() 
	}
}
