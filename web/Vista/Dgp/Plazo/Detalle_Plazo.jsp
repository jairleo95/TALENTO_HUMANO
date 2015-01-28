<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%-- 
    Document   : Detalle_Plazo
    Created on : 23-ene-2015, 10:12:56
    Author     : ALFA 3
--%>

<%@page import="pe.edu.upeu.application.model.V_Dgp_Plazo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="Lista_detalle_plazo" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Detalle de los plazos </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">

    </head>
    <body class="">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->


        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">

            <!-- MAIN CONTENT -->
            <div id="content">



                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <%
                        V_Dgp_Plazo d = new V_Dgp_Plazo();
                        d = (V_Dgp_Plazo) Lista_detalle_plazo.get(0);
                    %>
                    <div class="row">

                        <center> <h2 class="row-seperator-header"> <label style="color:blue;"> <%=d.getNo_req()%> </label></h2></center>
                        <!-- NEW WIDGET START -->
                        <article class="col-sm-12 col-md-12 col-lg-12">
                            <!-- end widget -->

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget" id="wid-id-5" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-sortable="false">
                                <!-- widget options:
                                usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

                                data-widget-colorbutton="false"
                                data-widget-editbutton="false"
                                data-widget-togglebutton="false"
                                data-widget-deletebutton="false"
                                data-widget-fullscreenbutton="false"
                                data-widget-custombutton="false"
                                data-widget-collapsed="true"
                                data-widget-sortable="false"

                                -->
                                <header>
                                    <h2>Detalle de  plazos establecidos </h2>
                                    <div class="widget-toolbar hidden-phone">

                                    </div>
                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body">

                                        <div class="tabs-left">


                                            <ul class="nav nav-tabs tabs-left" id="demo-pill-nav">
                                                <%

                                                    for (int i = 0; i < Lista_detalle_plazo.size(); i++) {
                                                        V_Dgp_Plazo pl = new V_Dgp_Plazo();
                                                        pl = (V_Dgp_Plazo) Lista_detalle_plazo.get(i);


                                                %>
                                                <li class="">
                                                    <a href="#tab-r<%=(i + 1)%>" data-toggle="tab"><%if (Integer.parseInt(pl.getEs_plazo_cumplido()) == 0) {
                                                            out.print("<span class='badge bg-color-red txt-color-white fa-fw fa fa-times'>.</span>");
                                                        } else {
                                                            out.print("<span class='badge bg-color-green txt-color-white fa-fw fa fa-check'>.</span>");
                                                        }

                                                        %>  <%="Plazo Nº" + (i + 1)%> </a>
                                                </li>

                                                <%}%>
                                            </ul>
                                            <div class="tab-content">
                                                <%

                                                    for (int i = 0; i < Lista_detalle_plazo.size(); i++) {
                                                        V_Dgp_Plazo p = new V_Dgp_Plazo();
                                                        p = (V_Dgp_Plazo) Lista_detalle_plazo.get(i);
                                                %>
                                                <div class="tab-pane" id="tab-r<%=(i + 1)%>">


                                                    <p>
                                                        <strong> Nombre : </strong> <%=p.getNo_plazo()%><br>
                                                        <strong> Descripción : </strong> <%=p.getDet_alerta()%><br>
                                                        <strong> Fecha inicio de plazo : </strong> <%=p.getFe_desde()%><br>
                                                        <strong> Fecha fin de plazo : </strong> <%=p.getFe_hasta()%><br>
                                                        <strong style="color:blue;"> Fecha en que se elaboró requerimiento : </strong> <%=p.getFe_creacion()%><br>

                                                        <%if (Integer.parseInt(p.getEs_plazo_cumplido()) == 0) {
                                                                out.print("<strong style='color:red;'> Estado : </strong>Fuera de plazo");
                                                            } else {
                                                                out.print("<strong style='color:green;'>Estado : </strong> Dentro de Plazo");
                                                            }%><br>
                                                    </p>
                                                </div>

                                                <%}%>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->

                        </article>
                        <!-- WIDGET END -->



                    </div>

                    <!-- end row -->

                    <!-- start row -->










            </div>
            <!-- end row -->

        </section>
        <!-- end widget grid -->



    </div>
    <!-- END MAIN CONTENT -->

</div>
<!-- END MAIN PANEL -->


<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script>
    if (!window.jQuery) {
        document.write('<script src="../../../js/libs/jquery-2.0.2.min.js"><\/script>');
    }
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script>
    if (!window.jQuery.ui) {
        document.write('<script src="../../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
    }
</script>

<!-- IMPORTANT: APP CONFIG -->
<script src="../../../js/app.config.js"></script>

<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
<script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

<!-- BOOTSTRAP JS -->
<script src="../../../js/bootstrap/bootstrap.min.js"></script>

<!-- CUSTOM NOTIFICATION -->
<script src="../../../js/notification/SmartNotification.min.js"></script>

<!-- JARVIS WIDGETS -->
<script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>

<!-- EASY PIE CHARTS -->
<script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

<!-- SPARKLINES -->
<script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

<!-- JQUERY VALIDATE -->
<script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

<!-- JQUERY MASKED INPUT -->
<script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

<!-- JQUERY SELECT2 INPUT -->
<script src="../../../js/plugin/select2/select2.min.js"></script>

<!-- JQUERY UI + Bootstrap Slider -->
<script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

<!-- browser msie issue fix -->
<script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

<!-- FastClick: For mobile devices -->
<script src="../../../js/plugin/fastclick/fastclick.min.js"></script>

<!--[if IE 8]>

<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

<![endif]-->

<!-- Demo purpose only -->
<script src="../../../js/demo.min.js"></script>

<!-- MAIN APP JS FILE -->
<script src="../../../js/app.min.js"></script>

<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
<!-- Voice command : plugin -->
<script src="../../../js/speech/voicecommand.min.js"></script>

<!-- PAGE RELATED PLUGIN(S) -->
<script src="../../../js/plugin/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>



<script type="text/javascript">

    // DO NOT REMOVE : GLOBAL FUNCTIONS!

    $(document).ready(function () {

        pageSetUp();

        /*
         * Autostart Carousel
         */
        $('.carousel.slide').carousel({
            interval: 3000,
            cycle: true
        });
        $('.carousel.fade').carousel({
            interval: 3000,
            cycle: true
        });

        // Fill all progress bars with animation

        $('.progress-bar').progressbar({
            display_text: 'fill'
        });


        /*
         * Smart Notifications
         */
        $('#eg1').click(function (e) {

            $.bigBox({
                title: "Big Information box",
                content: "This message will dissapear in 6 seconds!",
                color: "#C46A69",
                //timeout: 6000,
                icon: "fa fa-warning shake animated",
                number: "1",
                timeout: 6000
            });

            e.preventDefault();

        })

        $('#eg2').click(function (e) {

            $.bigBox({
                title: "Big Information box",
                content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                color: "#3276B1",
                //timeout: 8000,
                icon: "fa fa-bell swing animated",
                number: "2"
            });

            e.preventDefault();
        })

        $('#eg3').click(function (e) {

            $.bigBox({
                title: "Shield is up and running!",
                content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                color: "#C79121",
                //timeout: 8000,
                icon: "fa fa-shield fadeInLeft animated",
                number: "3"
            });

            e.preventDefault();

        })

        $('#eg4').click(function (e) {

            $.bigBox({
                title: "Success Message Example",
                content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                color: "#739E73",
                //timeout: 8000,
                icon: "fa fa-check",
                number: "4"
            }, function () {
                closedthis();
            });

            e.preventDefault();

        })



        $('#eg5').click(function () {

            $.smallBox({
                title: "Ding Dong!",
                content: "Someone's at the door...shall one get it sir? <p class='text-align-right'><a href='javascript:void(0);' class='btn btn-primary btn-sm'>Yes</a> <a href='javascript:void(0);' class='btn btn-danger btn-sm'>No</a></p>",
                color: "#296191",
                //timeout: 8000,
                icon: "fa fa-bell swing animated"
            });

        });



        $('#eg6').click(function () {

            $.smallBox({
                title: "Big Information box",
                content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                color: "#5384AF",
                //timeout: 8000,
                icon: "fa fa-bell"
            });

        })

        $('#eg7').click(function () {

            $.smallBox({
                title: "James Simmons liked your comment",
                content: "<i class='fa fa-clock-o'></i> <i>2 seconds ago...</i>",
                color: "#296191",
                iconSmall: "fa fa-thumbs-up bounce animated",
                timeout: 4000
            });

        })

        function closedthis() {
            $.smallBox({
                title: "Great! You just closed that last alert!",
                content: "This message will be gone in 5 seconds!",
                color: "#739E73",
                iconSmall: "fa fa-cloud",
                timeout: 5000
            });
        }

        /*
         * SmartAlerts
         */
        // With Callback
        $("#smart-mod-eg1").click(function (e) {
            $.SmartMessageBox({
                title: "Smart Alert!",
                content: "This is a confirmation box. Can be programmed for button callback",
                buttons: '[No][Yes]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Yes") {

                    $.smallBox({
                        title: "Callback function",
                        content: "<i class='fa fa-clock-o'></i> <i>You pressed Yes...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                }
                if (ButtonPressed === "No") {
                    $.smallBox({
                        title: "Callback function",
                        content: "<i class='fa fa-clock-o'></i> <i>You pressed No...</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                }

            });
            e.preventDefault();
        })
        // With Input
        $("#smart-mod-eg2").click(function (e) {

            $.SmartMessageBox({
                title: "Smart Alert: Input",
                content: "Please enter your user name",
                buttons: "[Accept]",
                input: "text",
                placeholder: "Enter your user name"
            }, function (ButtonPress, Value) {
                alert(ButtonPress + " " + Value);
            });

            e.preventDefault();
        })
        // With Buttons
        $("#smart-mod-eg3").click(function (e) {

            $.SmartMessageBox({
                title: "Smart Notification: Buttons",
                content: "Lots of buttons to go...",
                buttons: '[Need?][You][Do][Buttons][Many][How]'
            });

            e.preventDefault();
        })
        // With Select
        $("#smart-mod-eg4").click(function (e) {

            $.SmartMessageBox({
                title: "Smart Alert: Select",
                content: "You can even create a group of options.",
                buttons: "[Done]",
                input: "select",
                options: "[Costa Rica][United States][Autralia][Spain]"
            }, function (ButtonPress, Value) {
                alert(ButtonPress + " " + Value);
            });

            e.preventDefault();
        });

        // With Login
        $("#smart-mod-eg5").click(function (e) {

            $.SmartMessageBox({
                title: "Login form",
                content: "Please enter your user name",
                buttons: "[Cancel][Accept]",
                input: "text",
                placeholder: "Enter your user name"
            }, function (ButtonPress, Value) {
                if (ButtonPress == "Cancel") {
                    alert("Why did you cancel that? :(");
                    return 0;
                }

                Value1 = Value.toUpperCase();
                ValueOriginal = Value;
                $.SmartMessageBox({
                    title: "Hey! <strong>" + Value1 + ",</strong>",
                    content: "And now please provide your password:",
                    buttons: "[Login]",
                    input: "password",
                    placeholder: "Password"
                }, function (ButtonPress, Value) {
                    alert("Username: " + ValueOriginal + " and your password is: " + Value);
                });
            });

            e.preventDefault();
        });


    })

</script>

<!-- Your GOOGLE ANALYTICS CODE Below -->
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

</body>

</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>