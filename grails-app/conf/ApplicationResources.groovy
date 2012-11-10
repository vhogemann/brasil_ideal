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
   
   kkcountdown{
     dependsOn 'jquery'
     resource url: 'js/kkcountdown.js'
   }
   
   countdown{
     dependsOn 'kkcountdown'
     resource url: 'js/countdown.js'
   }
   
   autocomplete {
   		dependsOn 'jquery'
   		resource url: 'js/jquery-ui-1.9.1.custom.min.js'
   }
   
   index {
   		dependsOn 'autocomplete','countdown'
   		resource url: 'js/index.js'
   }
}