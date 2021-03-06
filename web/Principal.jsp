<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
        Usuario us = new Usuario();
        String id_rol = (String) sesion.getAttribute("IDROL");
%>
<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
<%@page import="pe.edu.upeu.application.model.V_Privilegio"%>
<%@page import="pe.edu.upeu.application.model.V_Usuario"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<jsp:useBean id="listarURL" scope="session" class="java.util.ArrayList"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> TALENTO HUMANO </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="Expires" content="0" /> 
        <meta http-equiv="Pragma" content="no-cache" />

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->
        <link href="css/your_style.css" rel="stylesheet" type="text/css"/>

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <script type="text/javascript" src="js/JQuery/jquery.autoheight.js"></script>
    </head>

    <body class="smart-style-1 fixed-header fixed-footer mainBody"  onload="nobackbutton();
            document.getElementById('link').click()">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->

        <!-- HEADER -->
        <header id="header">
            <div id="logo-group" >
                <!-- PLACE YOUR LOGO HERE -->
                <span id="logo"> <img src="img/logoRRHH.png" style=" position: absolute;top: 8px; width:100px; height:36px " alt="Talento Humano"> </span>
                <!-- END LOGO PLACEHOLDER -->

                <!-- Note: The activity badge color changes when clicked and resets the number to 0
                Suggestion: You may want to set a flag when this happens to tick off all checked messages / notifications -->
                <span id="activity" class="activity-dropdown hola2"> <i class="fa fa-user"></i> <b class="badge total"> 0 </b> </span>

                <!-- AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
                <div class="ajax-dropdown">

                    <!-- the ID links are fetched via AJAX to the ajax container "ajax-notifications" -->
                    <div class="btn-group btn-group-justified"  data-toggle="buttons">
                        <label class="btn btn-default autorizacionList">
                            <input type="radio" name="activity">
                            Autorizados </label>
                        <label class="btn btn-default rechazarList">
                            <input type="radio" name="activity" >
                            Rechazados </label>
                    </div>
                    <!-- notification content -->
                    <div class="ajax-notifications custom-scroll">
                        <ul class="notification-body autnot recnot poraut" >
                            <div class="alert alert-transparent">
                                <h4>Click en el boton para mostrar el mensaje</h4>
                            </div>
                            <i class="fa fa-lock fa-4x fa-border"></i>
                        </ul>
                    </div>
                    <!-- end notification content -->
                </div>
                <!-- END AJAX-DROPDOWN -->
            </div>
            <!-- pulled right: nav area -->
            <div class="pull-right">

                <!-- collapse menu button -->
                <div id="hide-menu" class="btn-header pull-right">
                    <span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
                </div>
                <!-- end collapse menu -->

                <!-- #MOBILE -->
                <!-- Top menu profile link : this shows only when top menu is active -->
                <ul id="mobile-profile-img" class="header-dropdown-list hidden-xs padding-5">
                    <li class="">
                        <a href="#" class="dropdown-toggle no-margin userdropdown" data-toggle="dropdown"> 
                            <img src="img/avatar_default.jpg" alt="<%out.println((String) sesion.getAttribute("USER")); %>" class="online" />  
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li>
                                <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0"><i class="fa fa-cog"></i> Setting</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="profile.html" class="padding-10 padding-top-0 padding-bottom-0"> <i class="fa fa-user"></i> <u>P</u>rofile</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="toggleShortcut"><i class="fa fa-arrow-down"></i> <u>S</u>hortcut</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i> Full <u>S</u>creen</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="login.html" class="padding-10 padding-top-5 padding-bottom-5" data-action="userLogout"><i class="fa fa-sign-out fa-lg"></i> <strong><u>L</u>ogout</strong></a>
                            </li>
                        </ul>
                    </li>
                </ul>

                <!-- logout button -->
                <div id="logout" class="btn-header transparent pull-right">
                    <span> 
                        <a href="menu?opc=logout" title="Sign Out" data-action="userLogout" data-logout-msg="�Est� complemetamente seguro de cerrar sesi�n?">
                            <i class="fa fa-sign-out"></i>
                            <label class="hidden-xs hidden-sm">Salir</label>
                        </a> 
                    </span>
                </div>
                <!-- end logout button -->

                <!-- search mobile button (this is hidden till mobile view port) -->
                <div id="search-mobile" class="btn-header transparent pull-right hidden-xs">
                    <span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
                </div>
                <!-- end search mobile button -->

                <!-- input: search field -->
                <!--
                <form action="" class="header-search pull-right">
                    <input id="search-fld"   type="text" name="param" placeholder="Buscar reportes y m�s" data-autocomplete='[
                           "ActionScript",
                           "AppleScript",
                           "Asp",
                           "BASIC",
                           "C",
                           "C++",
                           "Clojure",
                           "COBOL",
                           "ColdFusion",
                           "Erlang",
                           "Fortran",
                           "Groovy",
                           "Haskell",
                           "Java",
                           "JavaScript",
                           "Lisp",
                           "Perl",
                           "PHP",
                           "Python",
                           "Ruby",
                           "Scala",
                           "Scheme"]'>
                    <button type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                    <a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>
                </form>-->
                <!-- end input: search field -->

                <!-- fullscreen button -->
                <div id="fullscreen" class="btn-header transparent pull-right">
                    <span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
                </div>
                <!-- logout button -->
                <div id="logout" class="btn-header transparent pull-right">
                    <span> <a href="menu" title="Inicio" ><i class="fa fa-home"></i></a> </span>
                </div>


            </div>
            <!-- end pulled right: nav area -->

        </header>
        <!-- END HEADER -->

        <!-- Left panel : Navigation area -->
        <!-- Note: This width of the aside area can be adjusted through LESS variables -->
        <aside id="left-panel">

            <!-- User info -->
            <div class="logininfo">
                <div class="row">
                    <div class="avatar-user col-md-3">
                        <input id="id_trabajador" type="hidden" value="<%out.println(sesion.getAttribute("IDTR"));%>" />
                        <input id="iuser" type="hidden" value="<%out.println(id_user);%>" />
                        <a href="trabajador?opc=edit_perfil" target="myframe" id="show-shortcut" >
                            <img id="foto_usuario" src="img/avatar_default.jpg" class="bounceIn animated" />
                        </a>  
                    </div>
                    <div class="col-md-9">
                        <div class="login-info text-right">
                            <span class="spanuser"> <%out.println((String) sesion.getAttribute("USER")); %></span>  
                        </div>

                        <div class="login-info text-right">
                            <span ><%out.println((String) sesion.getAttribute("NOMBRE_AP").toString().trim()); %> </span> 
                        </div>
                    </div>
                </div>

            </div>


            <!-- end user info -->

            <!-- NAVIGATION : This navigation is also responsive

            To make this navigation dynamic please make sure to link the node
            (the reference to the nav > ul) after page load. Or the navigation
            will not initialize.
            -->

            <nav>
                <!-- NOTE: Notice the gaps after each icon usage <i></i>..
                Please note that these links work a bit different than
                traditional href="" links. See documentation for details.
                -->

                <ul>
                    <%
                        V_Privilegio gpres = null;
                        V_Privilegio rspres = null;
                        V_Privilegio spres = null;
                        V_Privilegio respres = null;
                        V_Privilegio resdetpres = null;
                        for (int i = 0; i < listarURL.size(); i++) {
                            V_Privilegio dp = new V_Privilegio();
                            dp = (V_Privilegio) listarURL.get(i);
                    %>
                    <%  if (dp.getId_privilegio().equals("PRV-000012")) {%>
                    <li class="li-privilegio bounceInDown animated">
                        <a href="#" data-value="fa fa-lg fa-fw fa-file"><i class="fa fa-lg fa-fw fa-file-text"></i> <span class="menu-item-parent">Generar Requerimiento</span></a>
                        <ul>
                            <%if (!id_rol.trim().equals("ROL-0011") | id_rol.trim().equals("ROL-0001")) {
                            %>
                            <li>
                                <a href="Vista/Dgp/Requerimiento.jsp?opc=Planilla" target="myframe"><i class="fa fa-lg fa-fw fa-file"></i> En Planilla</a>
                            </li>
                            <%}
                                if (id_rol.trim().equals("ROL-0011") | id_rol.trim().equals("ROL-0001")) {%>
                            <li>
                                <a href="#" class="repCargaAcademica"><i class="fa fa-lg fa-fw fa-file"></i>Carga Academica <span class="badge pull-right inbox-badge bg-color-blue">�Nuevo!</span></a>
                            </li>
                            <%}%>
                        </ul>
                    </li>
                    <%} else if (dp.getId_privilegio().equals("PRV-000046")) {
                        gpres = dp;
                    } else if (dp.getId_privilegio().equals("PRV-000048")) {
                        spres = dp;
                    } else if (dp.getId_privilegio().equals("PRV-000049")) {
                        respres = dp;
                    } else if (dp.getId_privilegio().equals("PRV-000050")) {
                        resdetpres = dp;
                    } else if (dp.getId_privilegio().equals("PRV-000047")) {
                        rspres = dp;
                    } else {%>
                    <li class="li-privilegio bounceInDown animated">
                        <%if (id_rol.trim().equals("ROL-0013")) {%>
                        <%if (dp.getNo_link().trim().equals("Ficha del Trabajador")) {%>
                        <a href="<%=dp.getDi_url()%>" target="myframe" title="<%=dp.getNo_link()%>" data-value="<%=dp.getIc_link().trim()%>" class="link"  id="link"><i class="<%=dp.getIc_link().trim()%>"></i> <span class="menu-item-parent"><%=dp.getNo_link()%></span></a>
                            <%}
                                }
                                if (!id_rol.trim().equals("ROL-0013")) {
                                    if (dp.getNo_link().trim().equals("Procesar Requerimiento")) {%>
                        <a href="<%=dp.getDi_url()%>" target="myframe" title="<%=dp.getNo_link()%>" class="link"  data-value="<%=dp.getIc_link().trim()%>" id="link"><i class="<%=dp.getIc_link().trim()%> "></i> <span class="menu-item-parent"><%=dp.getNo_link()%></span></a>
                            <%} else if (dp.getNo_link().trim().equals("Reporte de trabajadores")) {%>
                        <a href="#" class="repEmployees"><i class="fa fa-lg fa-fw fa-users"></i>    Trabajadores</a>

                        <%} else {%>
                        <a href="<%=dp.getDi_url()%>" target="myframe" title="<%=dp.getNo_link()%>" data-value="<%=dp.getIc_link().trim()%>" ><i class="<%=dp.getIc_link().trim()%> "></i> <span class="menu-item-parent" ><%=dp.getNo_link()%></span></a>

                        <%}
                            }%>
                    </li>
                    <%}
                        }%>
                        <%if (gpres != null || rspres != null || spres != null || resdetpres != null || respres != null) {%>
                    <li class="li-privilegio bounceInDown animated">
                        <a href="#" data-value="fa fa-lg fa-fw fa-file"><i class="fa fa-lg fa-fw fa-file-text"></i> <span class="menu-item-parent">Presupuesto</span></a>
                        <ul>
                            <%if (gpres != null) {%>
                            <li>
                                <a href="<%=gpres.getDi_url()%>" target="myframe"><i class="<%=gpres.getIc_link()%>"></i> <%=gpres.getNo_link()%></a>
                            </li>
                            <%}
                                if (rspres != null) {%>
                            <li>
                                <a href="<%=rspres.getDi_url()%>" target="myframe"><i class="<%=rspres.getIc_link()%>"></i> <%=rspres.getNo_link()%></a>
                            </li>
                            <%}
                                if (spres != null) {%>
                            <li>
                                <a href="<%=spres.getDi_url()%>" target="myframe"><i class="<%=spres.getIc_link()%>"></i> <%=spres.getNo_link()%></a>
                            </li>
                            <%}
                                if (resdetpres != null) {%>
                            <li>
                                <a href="<%=resdetpres.getDi_url()%>" target="myframe"><i class="<%=resdetpres.getIc_link()%>"></i> <%=resdetpres.getNo_link()%></a>
                            </li>
                            <%}
                                if (respres != null) {%>
                            <li>
                                <a href="<%=respres.getDi_url()%>" target="myframe"><i class="<%=respres.getIc_link()%>"></i> <%=respres.getNo_link()%></a>
                            </li>
                            <%}%>
                        </ul>
                    </li>
                    <%}%>

                </ul>

            </nav>
            <span id="btn-ocultar" class="minifyme" data-action="minifyMenu">
                <i class="fa fa-arrow-circle-left hit"></i> 
            </span>

        </aside>
        <!-- END NAVIGATION -->

        <!-- MAIN PANEL -->
        <div id="main" role="main">
            <!-- RIBBON -->
            <div id="ribbon">
                <!--  <span class="ribbon-button-alignment"> 
                      <span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> �Alerta! Esto actualizar� la pagina." data-html="true">
                          <i class="fa fa-refresh"></i>
                      </span> 
                  </span>-->

                <!-- breadcrumb -->
                <ol class="breadcrumb">
                    <%if (sesion.getAttribute("DEPARTAMENTO") != null) {%>
                    <li><%out.println("Departamento de  " + ((String) sesion.getAttribute("DEPARTAMENTO")) + " / Area de "
                                + ((String) sesion.getAttribute("AREA")) + " / Secci�n de "
                                + ((String) sesion.getAttribute("SECCION")) + " / Puesto de "
                        );
                        %><%=((String) sesion.getAttribute("PUESTO"))%></li>
                        <%}%>
                </ol>
                <!-- end breadcrumb -->
            </div>
            <!-- END RIBBON -->
            <!-- MAIN CONTENT -->
            <div  id="content" style="display:none" class="newContent"></div>
            <div id="content" class="oldContent">

                <div class="row"  >
                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4" >
                        <h1 class="page-title txt-color-blueDark" style="margin: 0px 0px 0px;"><i class="fa-fw fa fa-home" id="icon_menu"></i><label class="titulo_menu" >Inicio</label><span> </span></h1>
                    </div>
                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
                        <div class="animacion_load"></div>
                    </div>

                    <iframe id="myframe" name="myframe" class="iframe_principal" scrolling="si"  width="100%" height="2000" frameborder="0"  src="Vista/inicio.jsp"></iframe>
                </div>
                <!-- end row -->
                <!-- end widget grid -->
            </div>
            <!-- END MAIN CONTENT -->
        </div>
        <!-- END MAIN PANEL -->
        <!-- PAGE FOOTER -->
        <div class="page-footer">
            <div class="row">
                <div class="col-xs-12 col-sm-6">
                    <span class="txt-color-white">AlphaTeam � 2017</span>
                </div>
                <%if (false) {
                %>
                <div class="col-xs-6 col-sm-6 text-right hidden-xs">
                    <div class="txt-color-white inline-block">
                        <i class="txt-color-blueLight hidden-mobile">Last account activity <i class="fa fa-clock-o"></i> <strong>52 mins ago &nbsp;</strong> </i>
                        <div class="btn-group dropup">
                            <button class="btn btn-xs dropdown-toggle bg-color-blue txt-color-white" data-toggle="dropdown">
                                <i class="fa fa-link"></i> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu pull-right text-left">
                                <li>
                                    <div class="padding-5">
                                        <p class="txt-color-darken font-sm no-margin">Download Progress</p>
                                        <div class="progress progress-micro no-margin">
                                            <div class="progress-bar progress-bar-success" style="width: 50%;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="padding-5">
                                        <p class="txt-color-darken font-sm no-margin">Server Load</p>
                                        <div class="progress progress-micro no-margin">
                                            <div class="progress-bar progress-bar-success" style="width: 20%;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="padding-5">
                                        <p class="txt-color-darken font-sm no-margin">Memory Load <span class="text-danger">*critical*</span></p>
                                        <div class="progress progress-micro no-margin">
                                            <div class="progress-bar progress-bar-danger" style="width: 70%;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="padding-5">
                                        <button class="btn btn-block btn-default">refresh</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <!-- END PAGE FOOTER -->

        <!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
        Note: These tiles are completely responsive,
        you can add as many as you like
        -->
        <div id="shortcut">
            <ul>
                <li>
                    <a href="#inbox.html" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i class="fa fa-envelope fa-4x"></i> <span>Correo<span class="label pull-right bg-color-darken">14</span></span> </span> </a>
                </li>
                <li>
                    <a href="#calendar.html" class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span class="iconbox"> <i class="fa fa-calendar fa-4x"></i> <span>Calendario</span> </span> </a>
                </li>
                <li>
                    <a href="#gmap-xml.html" class="jarvismetro-tile big-cubes bg-color-purple"> <span class="iconbox"> <i class="fa fa-map-marker fa-4x"></i> <span>Mapas</span> </span> </a>
                </li>
                <li>
                    <a href="#invoice.html" class="jarvismetro-tile big-cubes bg-color-blueDark"> <span class="iconbox"> <i class="fa fa-book fa-4x"></i> <span>Invoice <span class="label pull-right bg-color-darken">99</span></span> </span> </a>
                </li>
                <li>
                    <a href="#gallery.html" class="jarvismetro-tile big-cubes bg-color-greenLight"> <span class="iconbox"> <i class="fa fa-picture-o fa-4x"></i> <span>Galeria </span> </span> </a>
                </li>
                <li>
                    <a href="Usuario?opc=Ver_Perfil&id=<%=(String) sesion.getAttribute("IDUSER")%>" target="myframe" title="SS" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"  > <span class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>Mi Perfil </span> </span> </a>
                </li>
            </ul>
        </div>
        <!-- END SHORTCUT AREA -->
        <!--Modal content-->
        <div class="modalContent"></div>
        <!--End Modal content-->


        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
        if (!window.jQuery) {
            document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
        }
        </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
        if (!window.jQuery.ui) {
            document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
        }
        </script>

        <!-- IMPORTANT: APP CONFIG -->
        <script src="js/app.config.js"></script>

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
        <script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

        <!-- BOOTSTRAP JS -->
        <script src="js/bootstrap/bootstrap.min.js"></script>

        <!-- CUSTOM NOTIFICATION -->
        <script src="js/notification/SmartNotification.min.js"></script>

        <!-- JARVIS WIDGETS -->
        <script src="js/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS 
        <script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

        <!-- SPARKLINES -->
        <script src="js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>


        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="js/plugin/fastclick/fastclick.min.js"></script>

        <!-- Demo purpose only
        <script src="js/demo.min.js"></script> -->

        <!-- MAIN APP JS FILE -->
        <script src="js/app.min.js"></script>
        <!--Business Logic -->
        <script src="js/businessLogic/Principal.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    </body>

</html>
<%} else {
        out.print("<script> window.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
