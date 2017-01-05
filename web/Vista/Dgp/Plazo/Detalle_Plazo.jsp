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
<jsp:useBean id="Lista_detalle_plazo" scope="session" class="java.util.ArrayList"/>
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
            <link rel="stylesheet" type="text/css" media="screen" href="../../../8css/smartadmin-production-plugins.min.css">
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
    <body  >
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

</body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>