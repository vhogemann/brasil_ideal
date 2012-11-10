class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"/near/$longitude/$latitude"(controller: "home", action: "near")
		"/"(view:"/home/index")
		"500"(view:'/error')

		// TODO: somente para testar o js
		"/countdown"(view: '/countdown')
	}
}
