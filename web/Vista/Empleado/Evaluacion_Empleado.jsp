<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Evaluacion_Empleado
    Created on : 05-dic-2014, 15:44:19
    Author     : ALFA 3
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title>Evaluación Empleado</title>
        <link rel="stylesheet" href="../../css/Css_Formulario/form.css"  type="text/css" > 

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

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <link href="../../css/businessLogic/Empleado/evaluacionEmpleado.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
    <center>
        <!--begin widget-->
        <div class="jarviswidget slideInDown fast animated" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false">

            <header>
                <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                <h2><b>Evaluar Empleado</b></h2>				

            </header>

            <!-- widget div-->
            <div >

                <!-- widget edit box -->
                <div class="jarviswidget-editbox">
                    <!-- This area used as dropdown edit box -->

                </div>
                <!-- end widget edit box -->

                <!-- widget content -->
                <div class="widget-body no-padding">

                    <form action="../../empleado" id="checkout-form" class="smart-form" novalidate="novalidate">

                        <header>
                            <b>¿El Empleado Es Jefe?</b>
                        </header>

                        <fieldset >
                            <center>
                                <section class="col col-4" id="sec">
                                    <label class="select" >
                                        <select name="RE_EVALUACION" required="" class="input-sm">
                                            <option value="" selected=""  disabled="">[Seleccione]</option>
                                            <option value="0">No es Jefe</option>
                                            <option value="1">Jefe de Sección</option>
                                            <option value="2">Jefe de Area</option>
                                            <option value="3">Jefe de Departamento</option>
                                            <option value="4">Jefe de Dirección</option>

                                        </select> 
                                        <i></i> 
                                    </label>
                                </section>
                            </center>
                        </fieldset>

                        <input type="hidden" value="Reg_Evaluar_Emp" name="opc"/>
                        <input type="hidden" value="1" name="ESTADO"/>
                        <input type="hidden" name="ID_TRABAJADOR" value="<%=request.getParameter("idtr")%>"  >
                        <footer>
                            <button type="submit" class="btn btn-primary" name="opc">
                                Registrar
                            </button>
                        </footer>
                    </form>

                </div>
                <!-- end widget content -->

            </div>
            <!-- end widget div -->

        </div>
        <!-- end widget -->



    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>