<%@page import="pe.edu.upeu.application.dao_imp.InterfaceComentario_DGPDAO"%>
<%@page import="pe.edu.upeu.application.dao.Comentario_DGPDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<jsp:useBean class="java.util.ArrayList" id="Det_Autorizacion" scope="session" />
<%@page import="pe.edu.upeu.application.model.X_List_De_Autorizacion"%>
<!DOCTYPE html >
<html lang="">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
        <title> Autorizaciones DGP </title>
      <meta name="description" content="">
		<meta name="author" content="">
			
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<!-- #CSS Links -->
		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

		<!-- SmartAdmin RTL Support -->
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-rtl.min.css"> 

		<!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

		<!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">

		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">

		<!-- #GOOGLE FONT -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

		<!-- #APP SCREEN / ICONS -->
		<!-- Specifying a Webpage Icon for Web Clip 
			 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
		<link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
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

        <%InterfaceComentario_DGPDAO cm = new Comentario_DGPDAO();
            HttpSession sesion = request.getSession();
            String rol = (String) sesion.getAttribute("IDROL");%>
        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">



            <!-- MAIN CONTENT -->
            <div id="content">


                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-yellow" id="wid-id-0" data-widget-editbutton="false">
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
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Historial de Autorizaciones</h2>

                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding prueba" id="contenido">
                                        <table  class="table table-striped table-bordered table-hover" width="100%">
                                            <thead>
                                                <tr>
                                                    <td >Paso <%=Det_Autorizacion.size()%></td>
                                                    <td data-hide="phone,tablet"><i class="fa fa-fw fa-calendar txt-color-blue hidden-md hidden-sm hidden-xs"></i> Detalle</td>
                                                    <td data-class="expand"><i class="fa fa-fw fa-user text-muted hidden-md hidden-sm hidden-xs"></i> Estado</td>
                                                    <td data-hide="phone"><i class="fa fa-fw fa-phone text-muted hidden-md hidden-sm hidden-xs"></i> Encargado</td>
                                                    <td>Cargo Encargado</td>
                                                    <td> Usuario</td>
                                                    <td data-hide="phone,tablet"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Area</td>
                                                    <td data-hide="phone,tablet">Departamento</td>
                                                    <td data-hide="phone,tablet">Fecha Autorizacion</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (int i = 0; i < Det_Autorizacion.size(); i++) {
                                                        X_List_De_Autorizacion a = new X_List_De_Autorizacion();
                                                        a = (X_List_De_Autorizacion) Det_Autorizacion.get(i);
                                                %>
                                                <tr>
                                                    <td class="caji"><%=a.getNu_pasos()%></td>
                                                    <td ><%=a.getDe_pasos()%></td>
                                                    <% if (a.getEs_autorizacion() != null) {%>
                                                    <td class="caji" >
                                                        <%
                                                            if (a.getEs_autorizacion() != null) {

                                                                if (a.getEs_autorizacion().equals("1")) { %>

                                                        <img src="../../img/Aprobado.png" width="20" height="20">
                                                        <% }
                                                            if (a.getEs_autorizacion().equals("2")) {
                                                        %>
                                                        <img src="../../img/Desaprobado.png" width="20" height="20">
                                                        <% }
                                                        } else {%>
                                                        No registrado
                                                        <%}%><input type="hidden" class="estado-aut" value="<%=a.getEs_autorizacion()%>"></td>
                                                    <td ><%
                                                        if (a.getUs_ap_mat() != null) {
                                                            out.println(a.getUs_ap_p().toUpperCase() + " " + a.getUs_ap_mat().toUpperCase() + " " + a.getUs_no_tr().toUpperCase());
                                                        } else {
                                                            out.println("No Registrado");
                                                        }
                                                        %></td> 
                                                    <td  ><%=a.getUs_no_puesto()%></td> 
                                                    <td  ><%=a.getNo_usuario()%></td> 
                                                    <td ><%=a.getUs_no_area()%></td> 
                                                    <td ><%=a.getUs_no_dep()%></td> 
                                                       <td><%=a.getFe_creacion()%></td>
                                                    <%} else {%>
                                                    <td colspan="7" style="text-align:center;">No definido</td>
                                                    <%}%>

                                                    <%
                                                        //if () {
                                                        if (a.getEs_autorizacion() != null) {

                                                            if (a.getEs_autorizacion().equals("2") & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005")| rol.trim().equals("ROL-0001"))) {

                                                    %>

                                                 
                                            <div class="alert alert-danger alert-block">
                                                <a class="close" data-dismiss="alert" href="#">×</a>
                                                <h4 class="alert-heading">DGP fuera de Proceso!</h4>
                                                <p>El DGP se ha rechazado por uno de los Usuarios... <a href="../../autorizacion?opc=HDGP&iddgp=<%=a.getId_dgp().trim()%>&ID<%=a.getId_departamento()%>" class="btn btn-primary"><strong><i class="fa fa-arrow-circle-right"></i> Habilitar</strong></a>  <a href="../../dgp?opc=MODIFICAR REQUERIMIENTO&iddgp=<%=a.getId_dgp().trim()%>" class="btn btn-primary"><strong><i class="fa fa-pencil-square-o"></i> Editar DGP</strong></a> <a data-toggle="modal" href="#myModal6" class="btn btn-primary"><i class="glyphicon glyphicon-remove"></i> Ver Motivo</a>
                                                </p>
                                                <input type="hidden" class="id-autorizacion" value="<%=a.getId_autorizacion()%>">
                                            </div>
                                            <div class="modal fade" id="myModal6" tabindex="-1" role="dialog">
                                                <div class="modal-dialog">
                                                    <div class="modal-content" align="center">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                &times;
                                                            </button>
                                                        </div>
                                                        <div class="modal-body no-padding">
                                                            <fieldset>
                                                                <section align="center">
                                                                    <div class="row" >
                                                                        <h1 class="h1" style="color:#218FDD ; font-size:20px;"><strong>MOTIVO</strong></h1>
                                                                        <div class="col col-10"  >
                                                                            <label class="input">
                                                                                <% if (a.getCm_comentario() != null & a.getId_autorizacion() != null & a.getId_dgp() != null) {
                                                                                        String inf = "";
                                                                                        inf = cm.Comentario_dgp_aut(a.getId_dgp(), a.getId_autorizacion());
                                                                                        String info[] = inf.split("/");
                                                                                %>
                                                                                <P class="list_motivo"><%=info[0]%></P>
                                                                                <P class="list_motivo"><strong>Usuario:</strong><%=info[1]%></P>
                                                                                <P class="list_motivo"><strong>Fecha:</strong><%=info[2]%></P>
                                                                                    <%} else {%>
                                                                                <p>No se Comento Rechazo</p>
                                                                                <%}%>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </section>
                                                            </fieldset>
                                                            <footer align="center">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal" >
                                                                    Cancel
                                                                </button>
                                                            </footer>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                         
                                            <%}
                                                    }
                                                }%>
                                            </tr> 
                                            </tbody>
                                        </table>
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

                    <!-- end row -->

                </section>
                <!-- end widget grid -->

            </div>
            <!-- END MAIN CONTENT -->

        </div>
        <!-- END MAIN PANEL -->




        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>-->

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script>
            if (!window.jQuery) {
                document.write('<script src="../../js/libs/jquery-2.1.1.min.js"><\/script>');
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

        <!-- Demo purpose only 
        <script src="../../js/demo.min.js"></script>-->

        <!-- MAIN APP JS FILE -->
        <script src="../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../js/speech/voicecommand.min.js"></script>

    </body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
