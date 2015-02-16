<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.V_Usuario"%>
<%@page import="pe.edu.upeu.application.model.V_Var_Usuario"%>
<jsp:useBean id="Lista_Usuarios" scope="application" class="java.util.ArrayList" />
<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Perfil de Usuario </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">

    </head>
    <body class="">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->




        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left:0px;">


            <!-- MAIN CONTENT -->
            <div id="content">

                <!-- Bread crumb is created dynamically -->

                <!-- row -->

                <div class="row">

                    <div class="col-sm-12">


                        <div class="well well-sm">

                            <div class="row">

                                <div class="col-sm-12 col-md-12 col-lg-6">
                                    <div class="well well-light well-sm no-margin no-padding">

                                        <div class="row">
                                            <%

                                            V_Usuario  vu=  new V_Usuario();
                                            vu=(V_Usuario)Lista_Usuarios.get(0);
                                            %>
                                            <div class="col-sm-12">
                                                <div id="myCarousel" class="carousel fade profile-carousel">
                                                    <div class="air air-bottom-right padding-10">
                                                        <a href="javascript:void(0);" class="btn txt-color-white bg-color-teal btn-sm"><i class="fa fa-check"></i>Regresar</a>&nbsp; <a href="../inicio.jsp" class="btn txt-color-white bg-color-pinkDark btn-sm"><i class="fa fa-link"></i> Connect</a>
                                                    </div>
                                                    <div class="air air-top-left padding-10">
                                                        <h4 class="txt-color-white font-md">Jan 1, 2014</h4>
                                                    </div>
                                                    <ol class="carousel-indicators">
                                                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                                                        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                                                    </ol>
                                                    <div class="carousel-inner">
                                                        <!-- Slide 1 -->
                                                        <div class="item active">
                                                            <img src="../../img/demo/s1.jpg" alt="demo user">
                                                        </div>
                                                        <!-- Slide 2 -->
                                                        <div class="item">
                                                            <img src="../../img/demo/s2.jpg" alt="demo user">
                                                        </div>
                                                        <!-- Slide 3 -->
                                                        <div class="item">
                                                            <img src="../../img/demo/m3.jpg" alt="demo user">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-12">

                                                <div class="row">

                                                    <div class="col-sm-3 profile-pic">
                                                        <img src="../../img/avatars/sunny-big.png" alt="demo user">
                                                        <div class="padding-10">
                                                            <h4 class="font-md"><strong>1,543</strong>
                                                              
                                                                <small>Connections</small></h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <h1><%=vu.getNo_usuario()%> <span class="semi-bold">telf: <%=vu.getTe_trabajador()%></span>
                                                            <br>
                                                            <small> <a href="../../Usuario?opc=editar_Perfil&id=<%=(String)sesion_1.getAttribute("IDUSER")%>">Editar Perfil</a></small></h1>

                                                        <ul class="list-unstyled">
                                                              <li>
                                                                <p class="text-muted">
                                                                    <i class="fa fa-unlock" ></i>&nbsp;<input disabled="disabled" type="password" value="<%=vu.getPw_usuario()%>">
                                                                    
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p class="text-muted">
                                                                    <i class="fa fa-phone"></i>&nbsp;&nbsp;(<span class="txt-color-darken"><%=vu.getTe_trabajador()%></span>)
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p class="text-muted">
                                                                    <i class="fa fa-envelope"></i>&nbsp;&nbsp;<a href=""><%=vu.getDi_correo_personal()%></a>
                                                                </p>
                                                            </li>
                                                          
                                                            <li>
                                                            
                                                             <li >
                                                                <p class="text-muted" >
                                                                    <i class="fa fa-mobile-phone" ></i>&nbsp;&nbsp;<span class="txt-color-darken" ><%=vu.getCl_tra()%></span>
                                                                </p>
                                                            </li>
                                                             <li>
                                                                <p class="text-muted">
                                                                    <i class="fa  fa-th"></i>&nbsp;&nbsp;<span class="txt-color-darken"><%=vu.getLi_di_dom_a_d1()+vu.getDi_dom_a_d2()+vu.getDi_dom_a_d4()+vu.getDi_dom_a_d6()+vu.getDi_dom_a_ref()%></span>
                                                                </p>
                                                            </li>
                                                          
                                                               <li>
                                                                <p class="text-muted">
                                                                    <i class="fa  fa-tasks"></i>&nbsp;&nbsp;<span class="txt-color-darken"><%=vu.getNo_departamento_ub()%></span>
                                                                </p>
                                                            </li>
                                                             <li>
                                                                <p class="text-muted">
                                                                    <i class="fa fa-tasks"></i>&nbsp;&nbsp;<span class="txt-color-darken"><%=vu.getNo_provincia_ub()%></span>
                                                                </p>
                                                            </li>
                                                             <li>
                                                                <p class="text-muted">
                                                                    <i class="fa fa-tasks"></i>&nbsp;&nbsp;<span class="txt-color-darken"><%=vu.getNo_distrito_ub()%></span>
                                                                </p>
                                                            </li>
                                                            
                                                        
                                                        </ul>
                                                                 
             
                                                 
                                                      
                                                        <br>
                                                        <a href="javascript:void(0);" class="btn btn-default btn-xs"><i class="fa fa-envelope-o"></i> Send Message</a>
                                                        <br>
                                                        <br>
                                                      <ul class="nav nav-tabs tabs-pull-right">
                                                       <li class="pull-left">
                                                            <span class="margin-top-10 display-inline"><i class="fa fa-rss text-success"></i> Activity</span>
                                                        </li>
                                                    </ul>

                                                    </div>
                                                         

                                                </div>

                                            </div>

                                        </div>


                                    </div>

                                </div>
                                <div class="col-sm-12 col-md-12 col-lg-6">

                                    <form method="post" class="well padding-bottom-10" onsubmit="return false;">
                                        <textarea rows="2" class="form-control" placeholder="What are you thinking?"></textarea>
                                        <div class="margin-top-10">
                                            <button type="submit" class="btn btn-sm btn-primary pull-right">
                                                Post
                                            </button>
                                            <a href="javascript:void(0);" class="btn btn-link profile-link-btn" rel="tooltip" data-placement="bottom" title="Add Location"><i class="fa fa-location-arrow"></i></a>
                                            <a href="javascript:void(0);" class="btn btn-link profile-link-btn" rel="tooltip" data-placement="bottom" title="Add Voice"><i class="fa fa-microphone"></i></a>
                                            <a href="javascript:void(0);" class="btn btn-link profile-link-btn" rel="tooltip" data-placement="bottom" title="Add Photo"><i class="fa fa-camera"></i></a>
                                            <a href="javascript:void(0);" class="btn btn-link profile-link-btn" rel="tooltip" data-placement="bottom" title="Add File"><i class="fa fa-file"></i></a>
                                        </div>
                                    </form>
                                    <div class="timeline-seperator text-center"> <span>11:30PM November 27th, 2013</span>
                                        <div class="btn-group pull-right">
                                            <a href="javascript:void(0);" data-toggle="dropdown" class="btn btn-default btn-xs dropdown-toggle"><span class="caret single"></span></a>
                                            <ul class="dropdown-menu text-left">
                                                <li>
                                                    <a href="javascript:void(0);">Hide this post</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);">Hide future posts from this user</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);">Mark as spam</a>
                                                </li>
                                            </ul>
                                        </div> 
                                    </div>
                                   
                                </div>
                            </div>

                        </div>


                    </div>

                </div>

                <!-- end row -->

            </div>
            <!-- END MAIN CONTENT -->

        </div>
    

        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
                                        if (!window.jQuery) {
                                            document.write('<script src="../../js/libs/jquery-2.0.2.min.js"><\/script>');
                                        }
        </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
                                        if (!window.jQuery.ui) {
                                            document.write('<script src="../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                                        }
        </script>

        <!-- IMPORTANT: APP CONFIG -->
        <script src="../../js/app.config.js"></script>

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
        <script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

        <!-- BOOTSTRAP JS -->
        <script src="../../js/bootstrap/bootstrap.min.js"></script>

        <!-- CUSTOM NOTIFICATION -->
        <script src="../../js/notification/SmartNotification.min.js"></script>

        <!-- JARVIS WIDGETS -->
        <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS -->
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="../../js/plugin/fastclick/fastclick.min.js"></script>

        <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->

        <!-- Demo purpose only -->
        <script src="../../js/demo.min.js"></script>

        <!-- MAIN APP JS FILE -->
        <script src="../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../js/speech/voicecommand.min.js"></script>

        <!-- PAGE RELATED PLUGIN(S) 
        <script src="..."></script>-->

        <script type="text/javascript">

                                        // DO NOT REMOVE : GLOBAL FUNCTIONS!

                                        $(document).ready(function () {

                                            pageSetUp();

                                        })

        </script>

        <!-- Your GOOGLE ANALYTICS CODE Below -->
        
        <div id="dialog_simple" title="Dialog Simple Title">
	<p>
		Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	</p>
</div>

<div id="dialog-message" title="Dialog Simple Title">
	<p>
		Esta seguro de modificar?
	</p>

	<div class="hr hr-12 hr-double"></div>

	
		Currently using
		<b>36% of your storage space</b>
		<div class="progress progress-striped active no-margin">
			<div class="progress-bar progress-primary" role="progressbar" style="width: 36%"></div>
		</div>
                <div id="addtab" title="<div class='widget-header'><h4><i class='fa fa-plus'></i> Add another tab</h4></div>">

				<form>

					<fieldset>
						<input name="authenticity_token" type="hidden">
						<div class="form-group">
							<label>Tab Title</label>
							<input class="form-control" id="tab_title" value="" placeholder="Text field" type="text">
						</div>

						<div class="form-group">
							<label>Content</label>
							<textarea class="form-control" name="tab_content" id="tab_content" placeholder="Tab Content" rows="3"></textarea>
						</div>

					</fieldset>

				</form>

			</div>
	
</div><!-- #dialog-message -->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();
          
                       
        </script>
        <div class="well well-sm well-light">
			<h3>Dialogue</h3>
			<a href="#" id="dialog_link" class="btn btn-info"> Open Dialog </a>
			&nbsp;
			<a href="#" id="modal_link" class="btn bg-color-purple txt-color-white"> Open Modal Dialog </a>
		</div>
        
        		<script type="text/javascript">
		
		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		
		$(document).ready(function() {
			
			pageSetUp();
			
		
			$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
				_title : function(title) {
					if (!this.options.title) {
						title.html("&#160;");
					} else {
						title.html(this.options.title);
					}
				}
			}));
		
/*
			* DIALOG SIMPLE
			*/
		
			// Dialog click
			$('#dialog_link').click(function() {
				$('#dialog_simple').dialog('open');
				return false;
		
			});
		
			$('#dialog_simple').dialog({
				autoOpen : false,
				width : 600,
				resizable : false,
				modal : true,
				title : "<div class='widget-header'><h4><i class='fa fa-warning'></i> Empty the recycle bin?</h4></div>",
				buttons : [{
					html : "<i class='fa fa-trash-o'></i>&nbsp; Delete all items",
					"class" : "btn btn-danger",
					click : function() {
						$(this).dialog("close");
					}
				}, {
					html : "<i class='fa fa-times'></i>&nbsp; Cancel",
					"class" : "btn btn-default",
					click : function() {
						$(this).dialog("close");
					}
				}]
			});
		
			/*
			* DIALOG HEADER ICON
			*/
		
			// Modal Link
			$('#modal_link').click(function() {
				$('#dialog-message').dialog('open');
				return false;
			});
		
			$("#dialog-message").dialog({
				autoOpen : false,
				modal : true,
				title : "<div class='widget-header'><h4><i class='icon-ok'></i> jQuery UI Dialog</h4></div>",
				buttons : [{
					html : "Cancel",
					"class" : "btn btn-default",
					click : function() {
						$(this).dialog("close");
					}
				}, {
					html : "<i class='fa fa-check'></i>&nbsp; OK",
					"class" : "btn btn-primary",
					click : function() {
						$(this).dialog("close");
					}
				}]
		
			});
		
			/*
			 * Remove focus from buttons
			 */
			$('.ui-dialog :button').blur();
		
			/*
			 * Just Tabs
			 */
		
			$('#tabs').tabs();
		
			/*
			 *  Simple tabs adding and removing
			 */
		
			$('#tabs2').tabs();
		
			// Dynamic tabs
		
			// modal dialog init: custom buttons and a "close" callback reseting the form inside
			var dialog = $("#addtab").dialog({
				autoOpen : false,
				width : 600,
				resizable : false,
				modal : true,
				buttons : [{
					html : "<i class='fa fa-times'></i>&nbsp; Cancel",
					"class" : "btn btn-default",
					click : function() {
						$(this).dialog("close");
		
					}
				}, {
		
					html : "<i class='fa fa-plus'></i>&nbsp; Add",
					"class" : "btn btn-danger",
					click : function() {
						addTab();
						$(this).dialog("close");
					}
				}]
			});
		
			
		
			
			$("#add_tab").button().click(function() {
				dialog.dialog("open");
			});
		
			// close icon: removing the tab on click
			$("#tabs2").on("click", 'span.delete-tab', function() {
		
				var panelId = $(this).closest("li").remove().attr("aria-controls");
				$("#" + panelId).remove();
				tabs.tabs("refresh");
			});
		
		
		});

		</script>

    </body>

</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>
