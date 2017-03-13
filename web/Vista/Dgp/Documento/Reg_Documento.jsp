<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import='pe.edu.upeu.application.dao.DocumentoDAO'%>
<%@page import='pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO'%>
<%@page import='pe.edu.upeu.application.model.Usuario'%>
<%@page import='pe.edu.upeu.application.model.Datos_Hijo_Trabajador'%>
<%@page import='pe.edu.upeu.application.model.Padre_Madre_Conyugue'%>
<%@page import='pe.edu.upeu.application.model.V_Reg_Dgp_Tra'%>
<jsp:useBean id='List_Hijos' scope='session' class='java.util.ArrayList'/>
<jsp:useBean id='List_Conyugue' scope='session' class='java.util.ArrayList'/>
<jsp:useBean id='List_Adventista' scope='session' class='java.util.ArrayList'/>
<jsp:useBean id='List_doc_req_pla' scope='session' class='java.util.ArrayList'/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <!--<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>-->

        <title> Registrar Documento </title>
        <meta name='description' content=''>
        <meta name='author' content=''>
        <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>

        <!-- Basic Styles -->
        <link rel='stylesheet' type='text/css' media='screen' href='../../../css/bootstrap.min.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='../../../css/font-awesome.min.css'>

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel='stylesheet' type='text/css' media='screen' href='../../../css/smartadmin-production-plugins.min.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='../../../css/smartadmin-production.min.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='../../../css/smartadmin-skins.min.css'>

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel='stylesheet' type='text/css' media='screen' href='css/smartadmin-rtl.min.css'> -->

        <!-- We recommend you use 'your_style.css' to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel='stylesheet' type='text/css' media='screen' href='css/your_style.css'> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel='stylesheet' type='text/css' media='screen' href='../../../css/demo.min.css'>

        <!-- FAVICONS -->
        <link rel='shortcut icon' href='../../../img/favicon/favicon.ico' type='image/x-icon'>
        <link rel='icon' href='../../../img/favicon/favicon.ico' type='image/x-icon'>

        <!-- GOOGLE FONT -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700'>

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel='apple-touch-icon' href='../../../img/splash/sptouch-icon-iphone.png'>
        <link rel='apple-touch-icon' sizes='76x76' href='../../../img/splash/touch-icon-ipad.png'>
        <link rel='apple-touch-icon' sizes='120x120' href='../../../img/splash/touch-icon-iphone-retina.png'>
        <link rel='apple-touch-icon' sizes='152x152' href='../../../img/splash/touch-icon-ipad-retina.png'>

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name='apple-mobile-web-app-capable' content='yes'>
        <meta name='apple-mobile-web-app-status-bar-style' content='black'>
        <!-- Startup image for web apps -->
        <link rel='apple-touch-startup-image' href='../../../img/splash/ipad-landscape.png' media='screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)'>
        <link rel='apple-touch-startup-image' href='../../../img/splash/ipad-portrait.png' media='screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)'>
        <link rel='apple-touch-startup-image' href='../../../img/splash/iphone.png' media='screen and (max-device-width: 320px)'>


        <link rel='stylesheet' type='text/css' href='../../../js/shadowbox/shadowbox.css'/>

        <!--   <link href='http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css' rel='stylesheet'>-->
        <link href='../../../css/Css_Bootstrap/fileinput.css' media='all' rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%
            // HttpSession sesion_1 = request.getSession(true);
            out.print("<input type='hidden' class='iddgp' value='" + request.getParameter("iddgp") + "' />");
            out.print("<input type='hidden' class='idtr' value='" + request.getParameter("idtr") + "' />");

            if (request.getParameter("pro") != null) {
                if (request.getParameter("pro").equals("pr_dgp")) {
                    out.print("<input type='hidden' class='enterToDGPProcess' value='true' />");
                } else if (request.getParameter("pro").equals("regTR")) {
                    out.print("<input type='hidden' class='enterToRegTrabajador' value='true' />");
                } else if (request.getParameter("pro").equals("casosEspeciales")) {
                    out.print("<input type='hidden' class='enterToCasosEspecialesProcess' value='true' />");
                }

            }


        %>
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->
        <!-- MAIN PANEL -->
        <div id='main' role='main' style='margin: 0px;'>
            <!-- MAIN CONTENT -->
            <div id='content'>
                <!-- widget grid -->
                <section id='widget-grid' class=''>
                    <!-- START ROW -->
                    <div class=''>
                        <!-- NEW COL START -->
                        <article class='col-sm-12 col-md-12 col-lg-12'>

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class='jarviswidget jarviswidget-color-darken' id='wid-id-1' data-widget-editbutton='false' data-widget-custombutton='false'   data-widget-deletebutton='false'>
                                <!-- widget options:
                                        usage: <div class='jarviswidget' id='wid-id-0' data-widget-editbutton='false'>
                                        
                                        data-widget-colorbutton='false'	
                                        data-widget-editbutton='false'
                                            data-widget-togglebutton='false'
                                        data-widget-deletebutton='false'
                                        data-widget-fullscreenbutton='false'
                                        data-widget-custombutton='false'
                                        data-widget-collapsed='true' 
                                        data-widget-sortable='false'
                                -->
                                <header>
                                    <span class='widget-icon'> <i class='fa fa-edit'></i> </span>
                                    <h2>Registrar Documentos</h2>

                                </header>


                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class='jarviswidget-editbox'>
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <!--<div class='widget-body'  >-->
                                    <div class='listDocument'  >


                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->


                        </article>
                        <!-- END COL -->
                    </div>
                    <!-- END ROW -->
                </section>
                <!-- end widget grid -->

                <!-- Modal -->
            </div>
            <!-- END MAIN CONTENT -->
        </div>
        <!-- END MAIN PANEL -->


        <!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
        Note: These tiles are completely responsive,
        you can add as many as you like
        -->

        <!-- END SHORTCUT AREA -->

        <!--================================================== -->
        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js'></script>
        <script>
            if (!window.jQuery) {
                document.write('<script src="../../../js/libs/jquery-2.0.2.min.js"><\/script>');
            }
        </script>

        <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js'></script>
        <script>
            if (!window.jQuery.ui) {
                document.write('<script src="../../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
            }
        </script>

        <!-- IMPORTANT: APP CONFIG -->
        <script src='../../../js/app.config.js'></script>

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
        <script src='../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js'></script> 

        <!-- BOOTSTRAP JS -->
        <script src='../../../js/bootstrap/bootstrap.min.js'></script>

        <!-- CUSTOM NOTIFICATION -->

        <!-- JARVIS WIDGETS -->
        <script src='../../../js/smartwidgets/jarvis.widget.min.js'></script>

        <!-- EASY PIE CHARTS 
        <script src='../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js'></script>-->

        <!-- SPARKLINES 
        <script src='../../../js/plugin/sparkline/jquery.sparkline.min.js'></script>-->

        <!-- JQUERY VALIDATE -->
        <script src='../../../js/plugin/jquery-validate/jquery.validate.min.js'></script>

        <!-- JQUERY MASKED INPUT 
        <script src='../../../js/plugin/masked-input/jquery.maskedinput.min.js'></script>-->

        <!-- JQUERY SELECT2 INPUT 
        <script src='../../../js/plugin/select2/select2.min.js'></script>-->

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src='../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js'></script>

        <!-- browser msie issue fix -->
        <script src='../../../js/plugin/msie-fix/jquery.mb.browser.min.js'></script>

        <!-- FastClick: For mobile devices -->
        <script src='../../../js/plugin/fastclick/fastclick.min.js'></script>
        <!--[if IE 8]>
        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->
        <!-- Demo purpose only
        <script src='../../../js/demo.min.js'></script> -->

        <!-- MAIN APP JS FILE -->
        <script src='../../../js/app.min.js'></script>
        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin 
        <script src='../../../js/speech/voicecommand.min.js'></script>-->

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src='../../../js/plugin/jquery-form/jquery-form.min.js'></script>
        <!--<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'></script>-->
        <script src='../../../js/bootstrap/fileinput.js' type='text/javascript'></script>
        <!--  <script src='http://netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js' type='text/javascript'></script>-->
        <script src='../../../js/bootstrap/es.js' type='text/javascript'></script>
        <script src='../../../js/notification/SmartNotification.min.js'></script>
        <script type='text/javascript' src='../../../js/shadowbox/shadowbox.js'></script>

        <script src='../../../js/businessLogic/Trabajador/RegDocumentoDGP.js?v=<%=globalProperties.VERSION_JS%>' type='text/javascript'></script>
    </body>
</html>
<%  } else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
