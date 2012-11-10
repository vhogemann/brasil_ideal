package pubcup

class HomeController {

    def index() {
		def location = Location.list().first()
		def event = location.getEvents().first()
		def game = event.getGame() 
	}
}
