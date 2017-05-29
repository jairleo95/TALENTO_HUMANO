<%-- 
    Document   : Actualizar_ws_academico
    Created on : 29/03/2016, 05:00:35 PM
    Author     : AlphaTeam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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

        <link href="../../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../../css/your_style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <style>
            .mload{
                display: none;
                position: absolute;
                top: 0%;
                left: 0%;
                width: 100%;
                height: 100%;
                padding: 16px;
                background-color: white;
                z-index:1001;
                -moz-opacity: 0.9;
                opacity:.90;
                filter: alpha(opacity=90); 
            }
            .loading{
                display: none;
                position: absolute;
                top: 25%;
                left: 40%;
                width: 150px;
                height:150px;

            }
        </style>

        <div class="col-lg-offset-1">
            <div class="jarviswidget jarviswidget-color-blueDark jarviswidget-sortable col-lg-11" id="wid-id-12" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false" role="widget" style="">

                <header role="heading">
                    <span class="widget-icon"> <i class="fa fa-refresh"></i> </span>
                    <h2> Actualizar Base de Datos Academico </h2>				
                    <div class="widget-toolbar" role="menu">

                        <div class="btn-group">

                            <select class="semestre form-control" style="color: black;">
                                <option value="2016-1">2016-1</option>
                                <option value="2015-1">2015-1</option>
                                <option value="2015-2">2015-2</option>
                            </select>
                        </div>
                    </div>

                    <span class="jarviswidget-loader"><i class="fa fa-refresh fa-spin"></i></span></header>

                <!-- widget div-->
                <div role="content">

                    <!-- widget edit box -->
                    <div class="jarviswidget-editbox">
                        <!-- This area used as dropdown edit box -->
                    </div>
                    <!-- end widget edit box -->
                    <!-- widget content -->
                    <div class="widget-body col-lg-offset-2">

                        <ul id="external-events" class="list-inline">
                            <li  >
                                <span class="bg-color-darken txt-color-white" 
                                      data-description="(2016-1) presente Ciclo" data-icon="fa-time"><span style="font-size: 50px;height: 70px;" class="fa fa-calendar"></span> Ciclo :<h1 class="semest"></h1></span>
                            </li>
                            <li >
                                <span class="bg-color-blue txt-color-white" 
                                      data-description="Personas en la BD RRHH" data-icon="fa-pie"><span style="font-size: 50px;height: 70px;" class="fa fa-user"></span> Personas : <h1 class="personas"></h1></span>
                            </li>
                            <li >
                                <span class="bg-color-greenLight txt-color-white" 
                                      data-description="Personas actualizadas" data-icon="fa-alert"><span style="font-size: 50px;height: 70px;" class="fa fa-check"></span> New : <h1 class="personas"></h1></span>
                            </li>
                            <li >
                                <span class="bg-color-red txt-color-white" 
                                      data-description="Actualizar BD academico" data-icon="fa-alert"><span style="font-size: 50px; height: 85px;" class="fa fa-refresh"></span> Actualizar :<br/><button class="updatebtn btn btn-block btn-warning">Actualizar</button></span>
                            </li>

                        </ul>

                    </div>
                    <!-- end widget content -->
                </div>
                <!-- end widget div -->

                <span class="jarviswidget-loader"><i class="fa fa-refresh fa-spin"></i></span></header>

                <!-- widget div-->
                <div role="content">

                    <!-- widget edit box -->
                    <div class="jarviswidget-editbox">
                        <!-- This area used as dropdown edit box -->
                    </div>
                    <!-- end widget edit box -->
                    <!-- widget content -->
                    <div class="widget-body col-lg-offset-2">

                        <ul id="external-events" class="list-inline">
                            <li  >
                                <span class="bg-color-darken txt-color-white" 
                                      data-description="(2016-1) presente Ciclo" data-icon="fa-time"><span style="font-size: 50px;height: 70px;" class="fa fa-calendar"></span> Ciclo :<h1 class="semest"></h1></span>
                            </li>
                            <li >
                                <span class="bg-color-blue txt-color-white" 
                                      data-description="Personas en la BD RRHH" data-icon="fa-pie"><span style="font-size: 50px;height: 70px;" class="fa fa-user"></span> Personas : <h1 class="personas"></h1></span>
                            </li>
                            <li >
                                <span class="bg-color-greenLight txt-color-white" 
                                      data-description="Personas actualizadas" data-icon="fa-alert"><span style="font-size: 50px;height: 70px;" class="fa fa-check"></span> New : <h1 class="personas"></h1></span>
                            </li>
                            <li >
                                <span class="bg-color-red txt-color-white" 
                                      data-description="Actualizar BD academico" data-icon="fa-alert"><span style="font-size: 50px; height: 85px;" class="fa fa-refresh"></span> Actualizar :<br/><button class="updatebtn btn btn-block btn-warning">Actualizar</button></span>
                            </li>

                        </ul>

                    </div>
                    <!-- new widget -->
                    <div class="jarviswidget jarviswidget-color-blue" id="wid-id-4" data-widget-editbutton="false" data-widget-colorbutton="false">

                        <header>
                            <span class="widget-icon"> <i class="fa fa-check txt-color-white"></i> </span>
                            <h2> Cambios !! </h2>
                        </header>

                        <!-- widget div-->
                        <div>
                            <!-- widget edit box -->

                            <!-- end widget edit box -->

                            <div class="widget-body no-padding smart-form">
                                <!-- content goes here -->
                                <h5 class="todo-group-title"><i class="fa fa-warning"></i> Registros Afectados (<small class="num-of-tasks">1</small>)</h5>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <ul id="sortable1" class="todo">
                                            <li>
                                                <span class="handle"> <label class="checkbox">
                                                        <input type="checkbox" name="checkbox-inline">
                                                        <i></i> </label> </span>
                                                <p>
                                                    <strong>ID</strong>cambios [<a>Mas detalle</a>] <span class="text-muted">descripcion del cambio realizado</span>
                                                </p>
                                            </li>
                                            <li>
                                                <span class="handle"> <label class="checkbox">
                                                        <input type="checkbox" name="checkbox-inline">
                                                        <i></i> </label> </span>
                                                <p>
                                                    <strong>ID</strong>cambios [<a>Mas detalle</a>] <span class="text-muted">descripcion del cambio realizado</span>
                                                </p>
                                            </li>
                                            <li>
                                                <span class="handle"> <label class="checkbox">
                                                        <input type="checkbox" name="checkbox-inline">
                                                        <i></i> </label> </span>
                                                <p>
                                                    <strong>ID</strong>cambios [<a>Mas detalle</a>] <span class="text-muted">descripcion del cambio realizado</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div >
                                    <div class="col-lg-6">
                                        <ul id="sortable2 validar-datos" class="todo">
                                            <li>
                                                <span class="handle"> <label class="checkbox">
                                                        <input type="checkbox" name="checkbox-inline">
                                                        <i></i> </label> </span>
                                                <p>
                                                    <strong>ID</strong>cambios [<a>Mas detalle</a>] <span class="text-muted">descripcion del cambio realizado</span>
                                                </p>
                                            </li>
                                            <li>
                                                <span class="handle"> <label class="checkbox">
                                                        <input type="checkbox" name="checkbox-inline">
                                                        <i></i> </label> </span>
                                                <p>
                                                    <strong>ID</strong>cambios [<a>Mas detalle</a>] <span class="text-muted">descripcion del cambio realizado</span>
                                                </p>
                                            </li>
                                            <li>
                                                <span class="handle"> <label class="checkbox">
                                                        <input type="checkbox" name="checkbox-inline">
                                                        <i></i> </label> </span>
                                                <p>
                                                    <strong>ID</strong>cambios [<a>Mas detalle</a>] <span class="text-muted">descripcion del cambio realizado</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <h5 class="todo-group-title"><i class="fa fa-check"></i> Completed Tasks (<small class="num-of-tasks">1</small>)</h5>
                                <ul id="sortable1" class="todo">
                                    <li>
                                        <p>
                                            <strong>ID</strong>cambios [<a>Mas detalle</a>] <span class="text-muted">descripcion del cambio realizado</span>
                                        </p>
                                    </li>
                                </ul>

                                <!-- end content -->
                            </div>

                        </div>
                        <!-- end widget div -->
                    </div>
                </div>
            </div>
            <div class="panel panel-default tablaL col col-lg-12">

            </div>
            <div class="panel panel-default tablaR col col-lg-12">

            </div>
            <div class="mload">
                <img class="loading modal"  src="../../../img/ajax-loader.gif" alt=""/>
            </div>    
            <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
            <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>

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
            <script src="../../../js/plugin/jquery-form/jquery-form.min.js"></script>
            <script src="../../../js/plugin/datatables/jquery.dataTables.min.js"></script>
            <script src="../../../js/plugin/datatables/dataTables.colVis.min.js"></script>
            <script src="../../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
            <script src="../../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
            <script src="../../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
            <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>
            <script>
 $(document).ready(function () {

                var per = 0;
                var semest = "2016-1";
                var semest1, personas;
                        update_ws(semest);
                        
                     
                        $('.mload').show();
                        $('.loading').show();
                        
         $.post('../../../carga_academica', 'opc=actualizar_ws&semestre=' + semest, function (Data) {
                               update_ws(semest);
                                $('.mload').hide();
                     if (Data.rpta === true) {
                                var lista = Data.lista;
                                var t = "<table class='table table-bordered'>";
                                var t1 = "<table class='table table-bordered'>";
                                
                                for (var i = 0; i < lista.length; i++) {
                                    if (lista[i].TDATO == 0) {
                                                t += "<tr>";
                                                t += "<td>" + lista[i].ID + "</td>";
                                                t += "<td>" + lista[i].CAMPUS + "</td>";
                                                t += "<td>" + lista[i].AP_PATERNO + "</td>";
                                                t += "<td>" + lista[i].AP_MATERNO + "</td>";
                                                t += "<td>" + lista[i].NO_TRABAJADOR + "</td>";
                                                t += "<td>" + lista[i].ES_TIPO_DOC + "</td>";
                                                t += "<td>" + lista[i].NU_DOC + "</td>";
                                                t += "<td>" + lista[i].NO_FACULTAD + "</td>";
                                                t += "<td>" + lista[i].NO_CURSO + "</td>";
                                                t += "<td>" + lista[i].NU_GRUPO + "</td>";
                                                t += "<td>" + lista[i].CA_HLAB + "</td>";
                                                t += "<td>" + lista[i].DE_CONDICION + "</td>";
                                                t += "<td>" + lista[i].DE_TIPO_CURSO + "</td>";
                                                t += "<td>" + lista[i].DE_HORARIO + "</td>";
                                                t += "</tr>";
                                    } else {
                                                t1 += "<tr>";
                                                t1 += "<td>" + lista[i].ID + "</td>";
                                                t1 += "<td>" + lista[i].CAMPUS + "</td>";
                                                t1 += "<td>" + lista[i].AP_PATERNO + "</td>";
                                                t1 += "<td>" + lista[i].AP_MATERNO + "</td>";
                                                t1 += "<td>" + lista[i].NO_TRABAJADOR + "</td>";
                                                t1 += "<td>" + lista[i].ES_TIPO_DOC + "</td>";
                                                t1 += "<td>" + lista[i].NU_DOC + "</td>";
                                                t1 += "<td>" + lista[i].NO_FACULTAD + "</td>";
                                                t1 += "<td>" + lista[i].NO_CURSO + "</td>";
                                                t1 += "<td>" + lista[i].NU_GRUPO + "</td>";
                                                t1 += "<td>" + lista[i].CA_HLAB + "</td>";
                                                t1 += "<td>" + lista[i].DE_CONDICION + "</td>";
                                                t1 += "<td>" + lista[i].DE_TIPO_CURSO + "</td>";
                                                t1 += "<td>" + lista[i].DE_HORARIO + "</td>";
                                                t1 += "</tr>";
                                    }
                                }
                                        t += "</table>";
                                        t1 += "</table>";
                                        $('.tablaR').empty();
                                        $('.tablaR').append(t1);
                                        $('.tablaL').empty();
                                        $('.tablaL').append(t);
                                        $('.table').DataTable();

                                        $.smallBox({
                                        title: "¡Felicitaciones!",
                                                content: "<i class='fa fa-clock-o'></i> <i>Base de Datos Actualizado Correctamente !!!</i>",
                                                color: "#296191",
                                                iconSmall: "fa fa-cloud bounce animated",
                                                timeout: 6000
                                        });
                        }else{
                                        $.smallBox({
                                        title: "¡Alerta!",
                                                content: "<i class='fa fa-clock-o'></i> <i>Error en el servidos WebService Caido !!! </i>",
                                                color: "#C46A69",
                                                iconSmall: "fa fa-cloud bounce animated",
                                                timeout: 7000
                                        });
                        }

          });
                        
                        $('.semestre').change(function () {
                        $('.semestre option:selected').each(function () {
                                semest = $(this).val();
                                $('#dialog-message').dialog('open');
                                update_ws(semest);
                            });
                         });
                                function update_ws(s) {
                                console.log(s);
                                        if (semest1 != s) {
                                per = 0;
                                }
                                $.ajax({
                                        type: 'POST',
                                        url: '../../../carga_academica',
                                        data: 'opc=List_ws&semestre=' + s,
                                        success: function (Data) {
                                               console.log(Data);
                                               $.each(Data, function (i, obj) {
                                                   $.each(obj, function (j, json) {
                                                    per++;
                                                    });
                                                });   
                                                
                                                    personas = per;
                                                     $('.personas').text(per);
                                                      $('.semest').text(s);
                                                   }   
                                                
                                        });
                                    }

                                /*
                                 * TODO: add a way to add more todo's to list
                                 */
                                
                                // initialize sortable
                                $(function() {
                                $("#sortable1,#sortable2").sortable({

                                connectWith : ".todo",
                                        update : countTasks
                                }).disableSelection();
                                });
                                        
                                      
     }); //-- end INI jQyery --
            </script>
    </body>


</html>
