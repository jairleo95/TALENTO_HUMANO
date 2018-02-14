<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<jsp:useBean class="java.util.ArrayList" id="LIST_DGP_PROCESO" scope="session" />
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title>Requerimiento </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">

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
        <link href="../../css/businessLogic/Dgp/Requerimiento.css" rel="stylesheet" type="text/css"/>

    </head>
    <body class="">

        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content" style="margin: 0px;" >
                <center>
                    <div class="well">

                        <%String opc = request.getParameter("opc");
                        if (opc.equals("Planilla")) {%>

                        <section id="service" class="wow fadeInUp" style="margin: 0px; ">
                            <div class="container" style="margin: 0px; margin-top: 2%;">
                                <div class="row">
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=1"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Contrato - Tiempo Completo</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End first service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=2"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Contrato - Medio Tiempo</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 2nd service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content bounceIn animated">
                                            <a href=Generar_Dgp.jsp?text=3><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Contrato - Tiempo Parcial</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 3rd service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content last bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=5"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Extranjero</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 4th service -->
                                    <div class="col-md-3 col-sm-3" style="display: none">
                                        <div class="service-content last bounceIn animated">
                                            <a href="#."><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Tiempo Parcial (Trabajador Docente)</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 4th service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=7"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Practicas Pre Profesionales</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End first service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=8"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Practicas Profesionales</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 2nd service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=9"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Convenio Laboral Juvenil</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 3rd service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=10"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Locación de Servicios</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 4th service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content last bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=11"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>No Domiciliado (Expositores extranjeros)</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 4th service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content last bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=20"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>MFL - Medio Tiempo</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 4th service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content last bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=21"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>MFL - Tiempo Completo</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 4th service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content last bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=22"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Empleado</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 4th service -->
                                    <div class="col-md-3 col-sm-3">
                                        <div class="service-content last bounceIn animated">
                                            <a href="Generar_Dgp.jsp?text=23"><span class="service-icon"><i class="fa fa-file img-circle wow flipInX"></i></span></a>
                                            <h3>Misionero</h3>
                                            <p>

                                            </p>
                                        </div>
                                    </div><!--/ End 4th service -->
                                </div>
                            </div>
                        </section><!-- Service box end -->
                        <%}%>
                        <!-- end widget grid -->
                    </div>
                </center>
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
