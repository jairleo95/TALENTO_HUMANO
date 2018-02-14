<%-- 
    Document   : List_Fuera_Presupuesto
    Created on : 29/01/2018, 08:00:54 AM
    Author     : Cesar
--%>

<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Reporte de Solicitudes Fuera de Presupuesto</title>

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
    <body class="body"  >
        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <header>
                        <h2>Solicitudes Pendientes</h2>
                    </header>

                    <table  class="table table-striped table-hover table-responsive table_list_sol">
                        <thead>
                            <tr>
                                <th>Acciones</th>
                                <th><strong>Solicitante</strong></th>
                                <th><strong>Puesto Solicitado</strong></th>
                                <th><strong>Temporada</strong></th>
                                <th><strong>Trabajadores Extra</strong></th>
                                <th>Fecha Solicitud</th>
                            </tr>
                        </thead>
                        <tbody class="tbody_list_solicitud">

                        </tbody>
                    </table>
                </div>


                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel"><span class="btn-label"><i class="fa fa-envelope"></i></span> <strong>Solicitud de ampliación de Presupuesto</strong></h4>
                            </div>
                            <div class="modal-body">
                                <div id="progressC" class="well well-sm well-primary">

                                </div>
                                <table class="table table-hover table-striped  table-responsive tabla_detalle_sol" >
                                    <tr><td class="td">Solicitante:</td><td><label id="spsol">Cargando...</label></td></tr>   
                                    <tr><td class="td">Departamento:</td><td><label id="spdep">Cargando...</label></td></tr>   
                                    <tr><td class="td">Àrea:</td><td><label id="spare">Cargando...</label></td></tr>   
                                    <tr><td class="td">Puesto:</td><td><label id="sppto">Cargando...</label></td></tr>  
                                    <tr><td class="td">Temporada:</td><td><label id="sptem">Cargando...</label></td></tr>  
                                    <tr><td class="td">Requerimiento:</td><td><label id="spreq">Cargando...</label></td></tr> 
                                    <tr><td class="td">N° Trabajadores:</td><td><label id="spntr">Cargando...</label></td></tr> 
                                    <tr><td class="td">Motivo(Justificación):</td><td><label id="spcom">Cargando...</label></td></tr> 
                                </table>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="well well-sm well-primary">
                                            <div class="form-group">
                                                <textarea id="spobs" class="form-control" placeholder="Comentario (Observación)" rows="5" required></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer foot_sol">

                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->

            </div>
        </div>
    </body>



    <!--================================================== -->

    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>-->

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

    <!-- EASY PIE CHARTS 
    <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

    <!-- SPARKLINES 
    <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>-->

    <!-- JQUERY VALIDATE -->
    <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

    <!-- JQUERY MASKED INPUT 
    <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->



    <!-- JQUERY UI + Bootstrap Slider 
    <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>-->

    <!-- browser msie issue fix 
    <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>-->

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
    <!-- Voice command : plugin
    <script src="../../js/speech/voicecommand.min.js"></script> -->

    <!-- PAGE RELATED PLUGIN(S) -->
    <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>
    <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
    <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
    <script type="text/javascript">
        var table;
        function listSFP() {
            $.ajax("../../pres", {
                data: {
                    opc: 'listSFPP'
                },
                type: 'POST',
                async: true,
                success: function (data) {
                    //console.log(JSON.stringify(data.toString()));
                    data = data.rpta;
                    var info = "";
                    for (var i = 0; i < data.length; i++) {
                        info += '<tr>';
                        info += "<td><button onclick='loadModal(" + JSON.stringify(data[i]) + ")' class='btn btn-primary btn-labeled'><span class='btn-label'><i class='fa fa-reorder'></i></span> Ver Detalles</button></td>";
                        /*info += '<td><div class="btn-group"> <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Accion <span class="caret"></span></button><ul class="dropdown-menu"><li><a href="#"> Ver Detalle</a></li>';
                         info += '<li><button class="btn btn-success btn-labeled" type="button"><span class="btn-label"><i class="fa fa-check"></i></span> Aprobar</button></li>';
                         info += '<li><button class="btn btn-danger btn-labeled" type="button"><span class="btn-label"><i class="fa fa-frown-o"></i></span> Rechazar</button></li></ul></div></td>';*/
                        info += '<td>' + data[i].SOLICITANTE + '</td>';
                        info += '<td>' + data[i].NO_PUESTO + '</td>';
                        info += '<td>' + data[i].NOMBRE_TEMP + '</td>';
                        info += '<td>' + data[i].N_TRABAJADORES + '</td>';
                        info += '<td>' + data[i].FECHA + '</td>';
                        info += '</tr>';
                    }
                    if ($.fn.dataTable.isDataTable('.table_list_sol')) {
                        table.destroy();
                    }
                    $(".tbody_list_solicitud").empty();
                    $(".tbody_list_solicitud").append(info);
                    table = $('.table_list_sol').DataTable({
                        "language": {
                            "sProcessing": "Procesando...",
                            "sLengthMenu": "Mostrar _MENU_ registros",
                            "sZeroRecords": "No se encontraron resultados",
                            "sEmptyTable": "Yupi! No hay solicitudes fuera de presupuesto.",
                            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                            "sInfoPostFix": "",
                            "sSearch": "Buscar:",
                            "sUrl": "",
                            "sInfoThousands": ",",
                            "sLoadingRecords": "Cargando...",
                            "oPaginate": {
                                "sFirst": "Primero",
                                "sLast": "Último",
                                "sNext": "Siguiente",
                                "sPrevious": "Anterior"
                            },
                            "oAria": {
                                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                            }
                        }
                    });
                }

            });
        }

        function loadModal(datos) {
            console.log(datos);
            $("#spsol").text(datos.SOLICITANTE);
            $("#spdep").text(datos.NO_DEP);
            $("#spare").text(datos.NO_AREA);
            $("#sppto").text(datos.NO_PUESTO);
            $("#sptem").text(datos.NOMBRE_TEMP + " > " + datos.FECHA_INICIO + " - " + datos.FECHA_FIN);
            $("#spreq").text(datos.NO_REQ);
            $("#spntr").text(datos.N_TRABAJADORES);
            $("#spcom").text(datos.COMENTARIO);
            var info = '<button type="button" id="spbtnrec" onclick="authPres(\'' + datos.ID_SOL_FUERA_PRESUPUESTO + '\',2,' + datos.N_TRABAJADORES + ',\'' + datos.ID_PRESUPUESTO_PUESTO + '\')" class="btn btn-danger">Rechazar</button>';
            info += '<button type="button" id="spbtnapro" onclick="authPres(\'' + datos.ID_SOL_FUERA_PRESUPUESTO + '\',1,' + datos.N_TRABAJADORES + ',\'' + datos.ID_PRESUPUESTO_PUESTO + '\')" class="btn btn-success">Aprobar</button>';
            $(".foot_sol").empty();
            $(".foot_sol").append(info);
            $("#progressC").empty();
            info = "";
            var load;
            $.ajax("../../pres", {
                data: {
                    opc: 'compByIdPP',
                    idpp: datos.ID_PRESUPUESTO_PUESTO
                },
                type: 'POST',
                async: false,
                success: function (obj) {
                    load = (parseInt(obj.deptcont) * 100 / parseInt(obj.deptpres)).toFixed(2);
                    info = '<div id="presC" class="alert alert-info">';
                    info += '<strong>Situaciòn Actual: Por Departamento</strong><br/>';
                    info += '<strong>' + obj.deptcont + '</strong> trabajadores contratados de los <strong>' + obj.deptpres + '</strong> trabajadores presupuestados bajo el mismo requerimiento.<br/>';
                    info += '<div class="progress">';
                    info += '<div class="progress-bar progress-bar-striped progress-bar-info active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
                    info += load + '%';
                    info += '</div>';
                    info += '</div>';
                    info += '</div>';
                    load = (parseInt(obj.area.ntrac) * 100 / parseInt(obj.area.ntrap)).toFixed(2);
                    info += '<div id="presC" class="alert alert-warning">';
                    info += '<strong>Situaciòn Actual: Por Área</strong><br/>';
                    info += '<strong>' + obj.area.ntrac + '</strong> trabajadores contratados de los <strong>' + obj.area.ntrap + '</strong> trabajadores presupuestados bajo el mismo requerimiento.<br/>';
                    info += '<div class="progress">';
                    info += '<div class="progress-bar progress-bar-striped progress-bar-warning active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
                    info += load + '%';
                    info += '</div>';
                    info += '</div>';
                    info += '</div>';
                }
            });
            load = (parseInt(datos.trab.trac) * 100 / parseInt(datos.trab.trad)).toFixed(2);
            info += '<div id="presCP" class="alert alert-danger">';
            info += '<strong>Situaciòn Actual: Por Puesto</strong><br/>';
            info += '<strong>' + datos.trab.trac + '</strong> trabajadores contratados de los <strong>' + datos.trab.trad + '</strong> trabajadores presupuestados bajo el mismo requerimiento.<br/>';
            info += '<div class="progress">';
            info += '<div class="progress-bar progress-bar-striped progress-bar-danger active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
            info += load + '%';
            info += '</div>';
            info += '</div>';
            info += '</div>';
            $("#progressC").append(info);
            $("#myModal").modal('show');
        }

        function authPres(idsfp, est, ntra, idpp) {
            var obs = $("#spobs").val();
            console.log(obs);
            if (obs !== "") {
                $.SmartMessageBox({
                    title: "¡Advertencia!",
                    content: "¿Esta seguro de procesar esta solicitud?",
                    buttons: '[No][Sí]'
                }, function (ButtonPressed) {
                    if (ButtonPressed === "Sí") {
                        var url = "";
                        if (est === 1) {
                            url = "../../pres?ntra=" + ntra + "&idpp=" + idpp;
                        } else {
                            url = "../../pres";
                        }
                        $.ajax(url, {
                            data: {
                                opc: "authPres",
                                obs: obs,
                                idsfp: idsfp,
                                est: est
                            },
                            type: "POST",
                            success: function (obj) {
                                if (obj.rpta === 1) {
                                    $.smallBox({
                                        title: "¡Procesado con exito!",
                                        content: "<i class='fa fa-clock-o'></i> <i>Se ha procesado la solicituid correctamente...</i>",
                                        color: "#659265",
                                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                        timeout: 4000
                                    });
                                    listSFP();
                                    $("#myModal").modal('hide');
                                } else {
                                    $.smallBox({
                                        title: "¡Oh no!",
                                        content: "<i>Nuestro gatito encargado de enviar solicitudes se quedó dormido. Ya lo estamos despertando, inténtalo de nuevo más tarde ;)</i><img src='../../img/sleeping_cat.jpg' alt='Sleeping Cat' >",
                                        color: "#FF7A7A",
                                        iconSmall: "fa fa-close fa-2x fadeInRight animated",
                                        timeout: 6000
                                    });
                                }
                            }
                        });
                    }
                    if (ButtonPressed === "No") {
                    }
                });
            } else {
                $.smallBox({
                    title: "¡Espere!",
                    content: "<i>Es necesario que usted ingrese algún comentario u observación antes de procesar esta solicitud.</i>",
                    color: "#FFBF7A",
                    iconSmall: "fa fa-close fa-2x fadeInRight animated",
                    timeout: 4000
                });
            }
        }


        $(document).ready(function () {
            pageSetUp();
            $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>");
            });
            listSFP();
            //   $(".cod_aps").numeric();
            //listar_solicitudes("1");
            //listar_solicitudes("2");
        });

    </script>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>