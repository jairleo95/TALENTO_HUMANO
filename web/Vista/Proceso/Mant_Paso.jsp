<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Prueba_Nestable_List
    Created on : 07-ene-2015, 15:23:08
    Author     : ALFA 3
--%>


<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Mantenimiento de Proceso </title>
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

        <!-- HEADER -->
        <header>

        </header>
        <!-- END HEADER -->

        <!-- Left panel : Navigation area -->
        <!-- Note: This width of the aside area can be adjusted through LESS variables -->

        <!-- END NAVIGATION -->

        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin: 0px;">

            <!-- MAIN CONTENT -->
            <div id="content" >



                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <!-- NEW COL START -->
                        <article class="col-sm-12 col-md-12 col-lg-12" >

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false">
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
                                    <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                    <h2>Mantenimiento de Procesos</h2>				
                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding">

                                        <form id="checkout-form" class="smart-form FormProcess" novalidate="novalidate">

                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-4">
                                                        <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                                            <input type="text" id="nom_pro" name="proceso" placeholder="Nombre Proceso">
                                                        </label>
                                                    </section>
                                                    <section class="col col-8">
                                                        <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                                            <input type="text" id="desc_pro" name="detalle" placeholder="Detalle Proceso">
                                                        </label>
                                                    </section>
                                                </div>

                                            </fieldset>



                                            <footer>
                                                <button type="button" class="btn btn-success btnUpdProcess">
                                                    Actuallizar
                                                </button>
                                                <input type="hidden" id="opid" value="">
                                                <button type="button" class="btn btn-danger cancelbtn">
                                                    Cancelar
                                                </button>
                                                <button type="button" class="btn btn-primary btnAddProcess">
                                                    Agregar
                                                </button>

                                            </footer>
                                        </form>
                                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-lg-offset-3">
                                            <div class="jarviswidget jarviswidget-color-greenDark" id="wid-id-2" data-widget-editbutton="false">
                                                <header>
                                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                                    <h2>Procesos del Sistema<strong><label class="lb-list_pasos"></label></strong> </h2>
                                                </header>
                                                <div>
                                                    <div class="jarviswidget-editbox">
                                                    </div>
                                                    <div class="widget-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Nombre</th>
                                                                        <th>Descripción</th>
                                                                        <th>Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="tbodyp">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->

                        </article>
                        <!-- END COL -->

                    </div>

                    <!-- end row -->


                </section>
                <!-- end widget grid -->

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

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->

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

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->

        <!-- BOOTSTRAP JS -->

        <!-- CUSTOM NOTIFICATION -->
        <script src="../../js/notification/SmartNotification.min.js"></script>

        <!-- JARVIS WIDGETS -->

        <!-- EASY PIE CHARTS -->
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->

        <!-- JQUERY SELECT2 INPUT -->

        <!-- JQUERY UI + Bootstrap Slider -->

        <!-- browser msie issue fix -->

        <!-- FastClick: For mobile devices -->

        <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->

        <!-- Demo purpose only -->

        <!-- MAIN APP JS FILE -->

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->

        <!-- PAGE RELATED PLUGIN(S) -->



        <!-- Your GOOGLE ANALYTICS CODE Below -->

    </body>
    <script type="text/javascript">
            function statupdate(id, obj) {
                var datos;
                if (obj.is(":checked")) {
                    datos = {
                        id: id,
                        es: 1
                    };
                } else {
                    datos = {
                        id: id,
                        es: 0
                    };
                }
                $.ajax({
                    async: false,
                    url: '../../Proceso?opc=statupdate',
                    data: datos,
                    type: 'POST'
                });
            }
            function listar_Proceso() {
                var s = $(".tbodyp");
                $.post("../../Proceso", "opc=ListarT", function (objJson) {
                    s.empty();
                    var lista = objJson.lista;
                    var text;
                    for (var j = 0; j < lista.length; j++) {
                        if (lista[j].desc === undefined) {
                            lista[j].desc = "Sin Datos";
                        }
                        text = "<tr>";
                        text += "<td class='td_nom" + lista[j].id + "'>" + lista[j].nombre + "</td>";
                        text += "<td class='td_desc" + lista[j].id + "'>" + lista[j].desc + "</td>";
                        text += "<td><div class='smart-form'><div class='pull-right col-xs-6 col-sm-6 col-md-6 col-lg-6'><button class='btn btn-success btn-sm btn-editar' value='" + lista[j].id + "' ><i class='fa fa-pencil' ></i></button></div>";
                        var info = 'statupdate("' + lista[j].id + '",$(this))';
                        if (lista[j].es == 1) {
                            text += "<div class='pull-left col-xs-6 col-sm-6 col-md-6 col-lg-6'><label class='toggle'>" +
                                    "<input type='checkbox' onchange='" + info + "' name='checkbox-toggle' checked='checked'>" +
                                    "<i data-swchon-text='ACTIVO' data-swchoff-text='INACTIVO'></i></label></div></div></td>";
                        } else {
                            text += "<div class='pull-left col-xs-6 col-sm-6 col-md-6 col-lg-6'><label class='toggle'>" +
                                    "<input type='checkbox' onchange='" + info + "' name='checkbox-toggle'>" +
                                    "<i data-swchon-text='ACTIVO' data-swchoff-text='INACTIVO'></i></label></div></div></td>";
                        }
                        text += "</tr>";
                        s.append(text);
                        $(".btn-editar").click(function () {
                            var id = $(this).val();
                            console.log("id: " + id);
                            $("#opid").val(id);
                            $("#nom_pro").val($(".td_nom" + id).text());
                            $("#desc_pro").val($(".td_desc" + id).text());
                            $(".btnAddProcess").hide();
                            $(".btnUpdProcess").show();
                            $(".cancelbtn").show();
                        });
                    }
                });
            }
            $(document).ready(function () {
                $(".cancelbtn").hide();
                $(".btnUpdProcess").hide();
                listar_Proceso();
                $(".btnUpdProcess").click(function () {
                    var nom = $("#nom_pro").val();
                    var desc = $("#desc_pro").val();
                    var id = $("#opid").val();
                    $.post("../../Proceso", {
                        opc: "Modificar",
                        nom: nom,
                        desc: desc,
                        id: id
                    }, function () {
                        listar_Proceso();
                        $(".cancelbtn").hide();
                        $(".btnUpdProcess").hide();
                        $("#opid").val("");
                        $(".btnAddProcess").show();
                        $("#nom_pro").val("");
                        $("#desc_pro").val("");
                    });
                });
                $(".btnAddProcess").click(function () {
                    var nom = $("#nom_pro").val();
                    var desc = $("#desc_pro").val();
                    $.post("../../Proceso", {
                        opc: "Registrar",
                        nom: nom,
                        desc: desc
                    }, function (x) {
                        var rpta = x.rpta;
                        if (rpta == "1") {
                            listar_Proceso();
                            $("#nom_pro").val("");
                            $("#desc_pro").val("");
                        }else if(rpta=="-1"){
                            alert("Error al crear un nuevo proceso");
                        }
                    });
                });
            });
    </script>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>