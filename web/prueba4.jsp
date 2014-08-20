<%-- 
    Document   : prueba4
    Created on : 06-ago-2014, 14:31:28
    Author     : Docente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css1/style3.css">
	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'></script>
        <script src="js2/organictabs.jquery.js"></script>
        <script>
            $(function() {    
                $("#example-one").organicTabs();
                $("#example-two").organicTabs({
                    "speed": 100
                });    
            });
        </script>
    </head>
    <body>
        <div id="demo-top-bar">

  <div id="demo-bar-inside">

    <h2 id="demo-bar-badge">
      <a href="/">CSS-Tricks Example</a>
    </h2>

    <div id="demo-bar-buttons">
      <a class='header-button' href='/organic-tabs/'>&larr; Back to Article</a> &nbsp; <a class='header-button' href='/examples/'>More Demos &rarr;</a>    </div>

  </div>

</div>
	<div id="page-wrap">
	
        <div id="example-one">
        	<ul class="nav">
                <li class="nav-one"><a href="#featured" class="current">Datos Personales</a></li>
                <li class="nav-two"><a href="#core">Datos Académicos</a></li>
                <li class="nav-three"><a href="#jquerytuts">Domicilio del Trabajador</a></li>
                <li class="nav-four last"><a href="#classics">Domicilio Legal</a></li>
                <li class="nav-four last"><a href="#classics">Ingresos Quinta Categoria</a></li>
                <li class="nav-four last"><a href="#classics">Información religiosa</a></li>
                
            </ul>
            
        	<div class="list-wrap">
        	
        		<ul id="featured">
                            <div style="margin-top: 30px; border: #ffffff 1px solid; padding: 20px;">
                            <form>
                                <label>Nombres</label>
                                <input type="text" name="nombre" >
                                <input type="button" id="tab1" value="Guardar">    
                            </form>
                            </div>
        		</ul>
        		 
        		 <ul id="core" class="hide">
                    <li><a href="http://css-tricks.com/video-screencasts/58-html-css-the-very-basics/">The VERY Basics of HTML &amp; CSS</a></li>
                    <li><a href="http://css-tricks.com/the-difference-between-id-and-class/">Classes and IDs</a></li>
                    <li><a href="http://css-tricks.com/the-css-box-model/">The CSS Box Model</a></li>
                    <li><a href="http://css-tricks.com/all-about-floats/">All About Floats</a></li>
                    <li><a href="http://css-tricks.com/the-css-overflow-property/">CSS Overflow Property</a></li>
        			<li><a href="http://css-tricks.com/css-font-size/">CSS Font Size - (px - em - % - pt - keyword)</a></li>
        			<li><a href="http://css-tricks.com/css-transparency-settings-for-all-broswers/">CSS Transparency / Opacity</a></li>
        			<li><a href="http://css-tricks.com/css-sprites/">CSS Sprites</a></li>
        			<li><a href="http://css-tricks.com/nine-techniques-for-css-image-replacement/">CSS Image Replacement</a></li>
        		 	<li><a href="http://css-tricks.com/what-is-vertical-align/">CSS Vertial Align</a></li>
        			<li><a href="http://css-tricks.com/the-css-overflow-property/">The CSS Overflow Property</a></li>
        		 </ul>
        		 
        		 <ul id="jquerytuts" class="hide">
        		    <li><a href="http://css-tricks.com/anythingslider-jquery-plugin/">Anything Slider jQuery Plugin</a></li>
        		    <li><a href="http://css-tricks.com/moving-boxes/">Moving Boxes</a></li>
        			<li><a href="http://css-tricks.com/simple-jquery-dropdowns/">Simple jQuery Dropdowns</a></li>
        			<li><a href="http://css-tricks.com/creating-a-slick-auto-playing-featured-content-slider/">Featured Content Slider</a></li>
        			<li><a href="http://css-tricks.com/startstop-slider/">Start/Stop Slider</a></li>
        			<li><a href="http://css-tricks.com/banner-code-displayer-thing/">Banner Code Displayer Thing</a></li>
        			<li><a href="http://css-tricks.com/highlight-certain-number-of-characters/">Highlight Certain Number of Characters</a></li>
        			<li><a href="http://css-tricks.com/auto-moving-parallax-background/">Auto-Moving Parallax Background</a></li>
        		 </ul>
        		 
        		 <ul id="classics" class="hide">
                    <li><a href="http://css-tricks.com/css-wishlist/">Top Designers CSS Wishlist</a></li>
                    <li><a href="http://css-tricks.com/what-beautiful-html-code-looks-like/">What Beautiful HTML Code Looks Like</a></li>
                    <li><a href="http://css-tricks.com/easily-password-protect-a-website-or-subdirectory/">Easily Password Protect a Website or Subdirectory</a></li>
                    <li><a href="http://css-tricks.com/how-to-create-an-ie-only-stylesheet/">IE-Only Stylesheets</a></li>
                    <li><a href="http://css-tricks.com/ecommerce-considerations/">eCommerce Considerations</a></li>
                    <li><a href="http://css-tricks.com/php-for-beginners-building-your-first-simple-cms/">PHP: Build Your First CMS</a></li>
        		 </ul>
        		 
        	 </div> <!-- END List Wrap -->
         
         </div> <!-- END Organic Tabs (Example One) -->
		 
		 <p>This is a plugin, so you can call it on multiple tabbed areas, which can be styled totally differently</p>
	
	     <div id="example-two">
					
    		<ul class="nav">
                <li class="nav-one"><a href="#featured2" class="current">Featured</a></li>
                <li class="nav-two"><a href="#core2">Core</a></li>
                <li class="nav-three"><a href="#jquerytuts2">jQuery</a></li>
                <li class="nav-four last"><a href="#classics2">Classics</a></li>
            </ul>
    		
    		<div class="list-wrap">
    		
    			<ul id="featured2">
    				<li><a href="http://css-tricks.com/perfect-full-page-background-image/">Full Page Background Images</a></li>
    				<li><a href="http://css-tricks.com/designing-for-wordpress-complete-series-downloads/">Designing for WordPress</a></li>
    				<li><a href="http://css-tricks.com/build-your-own-social-home/">Build Your Own Social Home!</a></li>
    				<li><a href="http://css-tricks.com/absolute-positioning-inside-relative-positioning/">Absolute Positioning Inside Relative Positioning</a></li>
    				<li><a href="http://css-tricks.com/ie-css-bugs-thatll-get-you-every-time/">IE CSS Bugs That'll Get You Every Time</a></li>
    				<li><a href="http://css-tricks.com/404-best-practices/">404 Best Practices</a></li>
    				<li><a href="http://css-tricks.com/date-display-with-sprites/">Date Display with Sprites</a></li>
    			</ul>
        		 
        		 <ul id="core2" class="hide">
                    <li><a href="http://css-tricks.com/video-screencasts/58-html-css-the-very-basics/">The VERY Basics of HTML &amp; CSS</a></li>
                    <li><a href="http://css-tricks.com/the-difference-between-id-and-class/">Classes and IDs</a></li>
                    <li><a href="http://css-tricks.com/the-css-box-model/">The CSS Box Model</a></li>
                    <li><a href="http://css-tricks.com/all-about-floats/">All About Floats</a></li>
                    <li><a href="http://css-tricks.com/the-css-overflow-property/">CSS Overflow Property</a></li>
    				<li><a href="http://css-tricks.com/css-font-size/">CSS Font Size - (px - em - % - pt - keyword)</a></li>
    				<li><a href="http://css-tricks.com/css-transparency-settings-for-all-broswers/">CSS Transparency / Opacity</a></li>
    				<li><a href="http://css-tricks.com/css-sprites/">CSS Sprites</a></li>
    				<li><a href="http://css-tricks.com/nine-techniques-for-css-image-replacement/">CSS Image Replacement</a></li>
        		 	<li><a href="http://css-tricks.com/what-is-vertical-align/">CSS Vertial Align</a></li>
    				<li><a href="http://css-tricks.com/the-css-overflow-property/">The CSS Overflow Property</a></li>
        		 </ul>
        		 
        		 <ul id="jquerytuts2" class="hide">
        		    <li><a href="http://css-tricks.com/anythingslider-jquery-plugin/">Anything Slider jQuery Plugin</a></li>
        		    <li><a href="http://css-tricks.com/moving-boxes/">Moving Boxes</a></li>
    				<li><a href="http://css-tricks.com/simple-jquery-dropdowns/">Simple jQuery Dropdowns</a></li>
    				<li><a href="http://css-tricks.com/creating-a-slick-auto-playing-featured-content-slider/">Featured Content Slider</a></li>
    				<li><a href="http://css-tricks.com/startstop-slider/">Start/Stop Slider</a></li>
    				<li><a href="http://css-tricks.com/banner-code-displayer-thing/">Banner Code Displayer Thing</a></li>
    				<li><a href="http://css-tricks.com/highlight-certain-number-of-characters/">Highlight Certain Number of Characters</a></li>
    				<li><a href="http://css-tricks.com/auto-moving-parallax-background/">Auto-Moving Parallax Background</a></li>
        		 </ul>
        		 
        		 <ul id="classics2" class="hide">
                    <li><a href="http://css-tricks.com/css-wishlist/">Top Designers CSS Wishlist</a></li>
                    <li><a href="http://css-tricks.com/what-beautiful-html-code-looks-like/">What Beautiful HTML Code Looks Like</a></li>
                    <li><a href="http://css-tricks.com/easily-password-protect-a-website-or-subdirectory/">Easily Password Protect a Website or Subdirectory</a></li>
                    <li><a href="http://css-tricks.com/how-to-create-an-ie-only-stylesheet/">IE-Only Stylesheets</a></li>
                    <li><a href="http://css-tricks.com/ecommerce-considerations/">eCommerce Considerations</a></li>
                    <li><a href="http://css-tricks.com/php-for-beginners-building-your-first-simple-cms/">PHP: Build Your First CMS</a></li>
        		 </ul>
        		 
    		 </div> <!-- END List Wrap -->
		 
		 </div> <!-- END Organic Tabs (Example One) -->
	
		 <p>This is some content below the tabs. I will be moved up or down to accommodate the tabbed area above me.</p>
	
	</div>
	
 <style type="text/css" style="display: none !important;">
	* {
		margin: 0;
		padding: 0;
	}
	body {
		overflow-x: hidden;
	}
	#demo-top-bar {
		text-align: left;
		background: #222;
		position: relative;
		zoom: 1;
		width: 100% !important;
		z-index: 6000;
		padding: 20px 0 20px;
	}
	#demo-bar-inside {
		width: 960px;
		margin: 0 auto;
		position: relative;
	}
	#demo-bar-buttons {
		padding-top: 10px;
		float: right;
	}
	#demo-bar-buttons a {
		font-size: 12px;
		margin-left: 20px;
		color: white;
		margin: 2px 0;
		text-decoration: none;
		font: 14px "Lucida Grande", Sans-Serif !important;
	}
	#demo-bar-buttons a:hover,
	#demo-bar-buttons a:focus {
		text-decoration: underline;
	}
	#demo-bar-badge {
		display: inline-block;
		width: 302px;
		padding: 0 !important;
		margin: 0 !important;
		background-color: transparent !important;
	}
	#demo-bar-badge a {
		display: block;
		width: 100%;
		height: 38px;
		border-radius: 0;
		bottom: auto;
		margin: 0;
		background: url(/images/examples-logo.png) no-repeat;
		background-size: 100%;
		overflow: hidden;
		text-indent: -9999px;
	}
	#demo-bar-badge:before, #demo-bar-badge:after {
		display: none !important;
	}
</style>        
    </body>
</html>
