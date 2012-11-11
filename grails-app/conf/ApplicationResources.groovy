modules = {
   application {}
   
   jquery {
		resource url: '/js/jquery-1.8.2.js', disposition: 'head'
	}
   bootstrap {
	   dependsOn 'jquery'
	   resource url: '/css/bootstrap.min.css'
	   resource url: '/css/bootstrap-responsive.min.css'
	   resource url: 'js/bootstrap.min.js'
   }
   googlemaps {
  	   resource url: 'js/map.js'
   }

   kkcountdown{
     dependsOn 'jquery'
     resource url: 'js/kkcountdown.js'
   }
   countdown{
     dependsOn 'kkcountdown'
     resource url: 'js/countdown.js'
   }
   jqueryui {
   		dependsOn 'jquery'
   		resource url: 'js/jquery.ui/jquery-ui-1.9.1.custom.min.js', disposition: 'head'
      resource url: 'js/jquery.ui/jquery-ui-1.9.1.custom.min.css'
   }
   index {
   		dependsOn 'jqueryui','countdown'
   		resource url: 'js/index.js?13213123'
   }
   games {
    dependsOn 'jqueryui'
    resource url: '/js/games.js'
   }
}