package pubcup

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*

class LocationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [locationInstanceList: Location.list(params), locationInstanceTotal: Location.count()]
    }

    def create() {
        [locationInstance: new Location(params)]
    }

    def save() {
        def locationInstance = new Location(params)
        if (!locationInstance.save(flush: true)) {
            render(view: "create", model: [locationInstance: locationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'location.label', default: 'Location'), locationInstance.id])
        redirect(action: "show", id: locationInstance.id)
    }

    def show(String id) {
        def locationInstance = Location.findById(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        [locationInstance: locationInstance]
    }

    def edit(Long id) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        [locationInstance: locationInstance]
    }

    def update(Long id, Long version) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (locationInstance.version > version) {
                locationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'location.label', default: 'Location')] as Object[],
                          "Another user has updated this Location while you were editing")
                render(view: "edit", model: [locationInstance: locationInstance])
                return
            }
        }

        locationInstance.properties = params

        if (!locationInstance.save(flush: true)) {
            render(view: "edit", model: [locationInstance: locationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'location.label', default: 'Location'), locationInstance.id])
        redirect(action: "show", id: locationInstance.id)
    }

    def delete(Long id) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        try {
            locationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "show", id: id)
        }
    }

    def circle() {
        def center = [params.lat, params.long]
        def radius = params.radius
        def locations = Location.findByLocationWithinCircle([center, radius])
        render(text: locations, contenType: "text/json")
    }
	
	def associate(){
		def location = pubcup.Location.get(params.id)
        def gameList = Game.withCriteria{
            not{
                'in'('id', location.events.game.id)
            }
        }
		return [location: location, gameList: gameList]
	}
	
    def eventSave(){
        def location = Location.get(params.id)
        params.list("gameId").each{ gameId ->
            def game = Game.get(gameId)
            if(game && location){
                new Event(location: location, game: game).save(flush: true)
            }    
        }
		flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), ''])
		redirect(action: "show", id: location.id)
    }

}
