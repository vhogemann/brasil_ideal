package pubcup

import org.springframework.dao.DataIntegrityViolationException
import java.net.HttpURLConnection
import java.net.URL
import java.util.Properties
import java.net.HttpURLConnection
import java.net.URL
import grails.converters.*
import groovy.json.JsonSlurper

class LocationService {

    static find(String searchKey) {

    	def locations = Location.findAllByNameIlike("%${searchKey}%")

    	if( locations.size() == 0 ) {

    		def searchParam		= URLEncoder.encode(searchKey,'UTF-8')

    		def params = [
    			sensor:false, 
          		output:'json', 
          		q:searchParam,
          		key:"ABQIAAAAF0RqRyWNd_7X3e0RobCNCBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQrL4ScHXqQm1WlqT2XNOKPl5k8bw"
          	]

    		def urlString 	= "http://maps.google.com/maps/geo?" + params.collect { k,v -> "$k=$v" }.join('&')
    		def url 		= new URL(urlString)
    		def connection 	= url.openConnection()
            def mapReturn = [:]
            connection.setRequestMethod("GET")
            connection.doOutput = true
            connection.connect()

            def response 	= new JsonSlurper().parseText(connection.content.text)
            def name 		= response.name
            def location 	= response.Placemark.Point.coordinates[0]

            location 		= [location[1],location[0]]

            println "location: ${location}"
            println "response: ${response}"

            return "[{\"location\": $location, \"name\": \"$name\"}]"
    	} else {
    		return locations.collect{ [location: it.location, id: it.id, name: it.name] } as JSON
    	}
    }
}
