window._site.forumUser = "";

$(document).ready( function () {
	if ( $('#ad').length ) {
		$('div.toolbar').addClass( 'ad' );

		var script = document.createElement("script")
		script.type = "text/javascript";

		if ( script.readyState ) { // Poor old IE
			script.onreadystatechange = function () {
				if ( script.readyState == "loaded" || script.readyState == "complete" ){
					script.onreadystatechange = null;
					_site.adCheck();
				}
			};
		}
		else {
			script.onload = function () {
				_site.adCheck();
			};
			script.onerror = function () {
				_site.adCheck();
			};
		}

		script.id = '_adpacks_js';
		script.src = '//cdn.adpacks.com/adpacks.js?legacyid=1266180&zoneid=1386&key=4b4cb470d035b673ad498e2a46300b4d&serve=C6SI42Y&placement=datatablesnet&circle=dev';
	
		// No jQuery, it strips out the DOM0 events
		var el = document.getElementById( 'ad' );
		el.appendChild( script );
		el.style.display = 'block';
	}
} );


$(document).ready( function () {
	window._site.dynamicLoaded();
} );