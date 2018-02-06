<%-- 
    Document   : statusSFP
    Created on : 02/02/2018, 12:06:59 PM
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

                <div class="panel panel-primary col-lg-10">
                    <div class="panel-body">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <header>
                                <h2>Estado de Solicitudes Fuera de Plazo</h2>
                            </header>


                            <div>
                                <div class="row">
                                    <div class="form-group col-md-3 col-xs-12" >
                                        <label class="">Dirección :</label>
                                        <select class="form-control select_direccion" >
                                            <option value="" selected disabled>[Seleccione]</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3 col-xs-12" >
                                        <label class="">Departamento :</label>
                                        <select class="form-control select_dep" >
                                            <option value="" selected disabled>[Seleccione]</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3 col-xs-12" >
                                        <label class="">Área :</label>
                                        <select class="form-control select_area" >
                                            <option value="" selected disabled>[Seleccione]</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3 col-xs-12" >
                                        <label class="">Sección :</label>
                                        <select class="form-control select_seccion" >
                                            <option value="" selected disabled>[Seleccione]</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3 col-xs-12" >
                                        <label class="text-success">Puesto :</label>
                                        <select class="form-control select_puesto">
                                            <option value="" selected disabled>[Seleccione]</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <table  class="table table-striped table-hover table-responsive table_list_sol">
                                <thead>
                                    <tr>
                                        <th>Estado</th>
                                        <th><strong>Solicitante</strong></th>
                                        <th><strong>Puesto Solicitado</strong></th>
                                        <th><strong>Temporada</strong></th>
                                        <th><strong>Trabajadores Extra</strong></th>
                                        <th>Fecha Solicitud</th>
                                        <th>Procesado por</th>
                                        <th>Departamento</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody_list_solicitud">

                                </tbody>
                            </table>
                        </div>
                    </div>
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
                                <table class="table table-hover table-striped  table-responsive tabla_detalle_sol" >
                                    <tr><td class="td">Solicitante:</td><td><label id="spsol">Cargando...</label></td></tr>   
                                    <tr><td class="td">Departamento:</td><td><label id="spdep">Cargando...</label></td></tr>   
                                    <tr><td class="td">Àrea:</td><td><label id="spare">Cargando...</label></td></tr>   
                                    <tr><td class="td">Puesto:</td><td><label id="sppto">Cargando...</label></td></tr>  
                                    <tr><td class="td">Temporada:</td><td><label id="sptem">Cargando...</label></td></tr>  
                                    <tr><td class="td">Requerimiento:</td><td><label id="spreq">Cargando...</label></td></tr> 
                                    <tr><td class="td">N° Trabajadores:</td><td><label id="spntr">Cargando...</label></td></tr> 
                                    <tr><td class="td">Motivo(Justificación):</td><td><label id="spcom">Cargando...</label></td></tr> 
                                    <tr><td class="td">Procesado Por:</td><td><label id="sppro">Cargando...</label></td></tr> 
                                    <tr><td class="td">Comentario(Observación):</td><td><label id="spobs">Cargando...</label></td></tr> 
                                    <tr><td class="td">Estado:</td><td><label id="spest">Cargando...</label></td></tr> 
                                </table>
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
        function listar_opciones(opc, id) {
            var ap = "";
            if (opc == 'Listar_direccion') {
                var a = $(".select_direccion");
                $(".select_dep").empty();
                $(".select_dep").append("<option value='' selected disabled>[Seleccione]</option>");
                $(".select_area").empty();
                $(".select_area").append("<option value='' selected disabled>[Seleccione]</option>");
                a.empty();
                a.append("<option value='' selected disabled>[Seleccione]</option>");
            }
            if (opc == 'Listar_dir_dep') {
                var a = $(".select_dep");
                $(".select_area").empty();
                $(".select_area").append("<option value='' selected disabled>[Seleccione]</option>");
                ap = "&id=" + id;
                a.empty();
                a.append("<option value='' selected disabled>[Seleccione]</option>");
            }
            if (opc == 'Listar_area2') {
                var a = $(".select_area");
                ap = "&id=" + id;
                $(".select_seccion").empty();
                $(".select_seccion").append("<option value='' selected disabled>[Seleccione]</option>");
                a.empty();
                a.append("<option value='' selected disabled>[Seleccione]</option>");
            }
            if (opc === "Listar_sec2") {
                var a = $(".select_seccion");
                ap = "&id=" + id;
                $(".select_puesto").empty();
                $(".select_puesto").append("<option value='' selected disabled>[Seleccione]</option>");
                a.empty();
                a.append("<option value='' selected disabled>[Seleccione]</option>");
            }
            if (opc === "Listar_pu_id") {
                var a = $(".select_puesto");
                ap = "&id=" + id;
                a.empty();
                a.append("<option value='' selected disabled>[Seleccione]</option>");
            }
            $.ajax("../../Direccion_Puesto?opc=" + opc + ap, {
                type: 'POST',
                success: function (objJson) {
                    var list = objJson.lista;
                    for (var i = 0; i < list.length; i++) {
                        a.append("<option value='" + list[i].id + "**" + list[i].nombre + "'>" + list[i].nombre + "</option>");
                    }
                }
            });
        }

        function init() {
            var opc = 'Listar_direccion';
            var id = "";
            listar_opciones(opc, id);
            $(".select_direccion").change(function () {
                var opc = 'Listar_dir_dep';
                var id = $(".select_direccion").val().split("**")[0];
                listar_opciones(opc, id);
            });
            $(".select_dep").change(function () {
                var opc = 'Listar_area2';
                var id = $(".select_dep").val().split("**")[0];
                listar_opciones(opc, id);
                listSFP(1);
            });
            $(".select_area").change(function () {
                var id = $(".select_area").val().split("**")[0];
                var opc = 'Listar_sec2';
                listar_opciones(opc, id);
                listSFP(2);
            });
            /*$(".select_cc").change(function () {
             var id = $(".select_cc").val().split("**")[0];
             $("#id_cc").attr("value", id);
             });*/
            $(".select_seccion").change(function () {
                var id = $(".select_seccion").val().split("**")[0];
                var opc = 'Listar_pu_id';
                listar_opciones(opc, id);
                listSFP(3);
            });
            $(".select_puesto").change(function () {
                listSFP(4);
            });
        }

        var table;
        function listSFP(fltr) {
            var data;
            switch (fltr) {
                case 0:
                    data = {
                    };
                    break;
                case 1:
                    data = {
                        idDep: $(".select_dep").val().split("**")[0]
                    };
                    break;
                case 2:
                    data = {
                        idDep: $(".select_dep").val().split("**")[0],
                        idArea: $(".select_area").val().split("**")[0]
                    };
                    break;
                case 3:
                    data = {
                        idDep: $(".select_dep").val().split("**")[0],
                        idArea: $(".select_area").val().split("**")[0],
                        idSeccion: $(".select_seccion").val().split("**")[0]
                    };
                    break;
                case 4:
                    data = {
                        idDep: $(".select_dep").val().split("**")[0],
                        idArea: $(".select_area").val().split("**")[0],
                        idSeccion: $(".select_seccion").val().split("**")[0],
                        idPuesto: $(".select_puesto").val().split("**")[0]
                    };
                    break;
            }
            $.ajax("../../pres?opc=listAllSFP", {
                data: data,
                type: 'POST',
                async: true,
                success: function (data) {
                    console.log(data);
                    data = data.rpta;
                    var info = "";
                    var tipo = "";
                    var text = "";
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].ESTADO === "0") {
                            tipo = "info";
                            text = "En Proceso";
                        } else if (data[i].ESTADO === "1") {
                            tipo = "success";
                            text = "Aprobado";
                        } else if (data[i].ESTADO === "2") {
                            tipo = "danger";
                            text = "Denegado";
                        } else {
                            tipo = "warning";
                            text = "Info Perdida";
                        }
                        info += '<tr>';
                        if (data[i]['PROCESADOR'] == null) {
                            data[i].PROCESADOR = 'Aún no Procesado';
                        }
                        info += "<td><button onclick='loadModal(" + JSON.stringify(data[i]) + ")' class='btn btn-" + tipo + " btn-labeled'><span class='btn-label'><i class='fa fa-reorder'></i></span>" + text + "</button></td>";
                        /*info += '<td><div class="btn-group"> <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Accion <span class="caret"></span></button><ul class="dropdown-menu"><li><a href="#"> Ver Detalle</a></li>';
                         info += '<li><button class="btn btn-success btn-labeled" type="button"><span class="btn-label"><i class="fa fa-check"></i></span> Aprobar</button></li>';
                         info += '<li><button class="btn btn-danger btn-labeled" type="button"><span class="btn-label"><i class="fa fa-frown-o"></i></span> Rechazar</button></li></ul></div></td>';*/
                        info += '<td>' + data[i].SOLICITANTE + '</td>';
                        info += '<td>' + data[i].NO_PUESTO + '</td>';
                        info += '<td>' + data[i].NOMBRE_TEMP + '</td>';
                        info += '<td>' + data[i].N_TRABAJADORES + '</td>';
                        info += '<td>' + data[i].FECHA + '</td>';
                        info += '<td>' + data[i].PROCESADOR + '</td>';
                        info += '<td>' + data[i].NO_DEP + '</td>';
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
            var estado;
            if (datos.ESTADO === "0") {
                $("#spest").text("En Proceso");
                $("#spest").attr("class", "text-primary");
            } else if (datos.ESTADO === "1") {
                $("#spest").text("Aprobado");
                $("#spest").attr("class", "text-success");
            } else if (datos.ESTADO === "2") {
                $("#spest").text("Denegado");
                $("#spest").attr("class", "text-danger");
            } else {
                $("#spest").text("Problemas en el servidor");
                $("#spest").attr("class", "text-warning");
            }
            $("#spsol").text(datos.SOLICITANTE);
            $("#spdep").text(datos.NO_DEP);
            $("#spare").text(datos.NO_AREA);
            $("#sppto").text(datos.NO_PUESTO);
            $("#sptem").text(datos.NOMBRE_TEMP + " > " + datos.FECHA_INICIO + " - " + datos.FECHA_FIN);
            $("#spreq").text(datos.NO_REQ);
            $("#spntr").text(datos.N_TRABAJADORES);
            $("#spcom").text(datos.COMENTARIO);
            $("#sppro").text(datos.PROCESADOR);
            if (datos['OBSERVACION'] == null) {
                datos.OBSERVACION = 'Aún no Procesado';
            }
            $("#spobs").text(datos.OBSERVACION);
            $("#myModal").modal('show');
        }


        $(document).ready(function () {
            pageSetUp();
            $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>");
            });
            init();
            listSFP(0);
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