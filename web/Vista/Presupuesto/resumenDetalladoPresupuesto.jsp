<%-- 
    Document   : resumenDetalladoPresupuesto
    Created on : 21/02/2018, 11:20:35 AM
    Author     : AlphaLeader
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
        <title>Resúmen de Presupuesto</title>

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
        <link href="../../js/plugin/pfnotify/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/datatable.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/plugins/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>



    </head>
    <body class="body"  >
        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">

                <div class="panel panel-primary col-lg-10">
                    <div class="panel-body">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 row">
                            <header>
                                <h2>Resúmen de Presupuesto</h2>
                            </header>
                            <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label class="">Dirección :</label>
                                    <select class="form-control select_direccion" >
                                        <option value="0" selected>Todos</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label class="">Departamento :</label>
                                    <select class="form-control select_dep" >
                                        <option value="0" selected>Todos</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label class="">Área :</label>
                                    <select class="form-control select_area" >
                                        <option value="0" selected>Todos</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label class="">Sección :</label>
                                    <select class="form-control select_seccion" >
                                        <option value="0" selected>Todos</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label class="">Puesto :</label>
                                    <select class="form-control select_puesto">
                                        <option value="0" selected>Todos</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6 col-xs-12" >
                                    <label class="">Condición laboral - Requerimiento :</label>
                                    <select id="nom_req" class="form-control" required="" multiple="multiple">
                                        <option value="0" selected>Todos</option>
                                    </select>
                                    <input type="checkbox" id="checkbox">Seleccionar Todos 
                                </div>
                            </div>
                            <table  class="table table-striped table-hover table-responsive table_list_sol" width="100%">
                                <thead class="thead_list">
                                </thead>
                                <tbody class="tbody_list_solicitud">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

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
    <script src="../../js/plugin/select2/select2.min.js" type="text/javascript"></script>
    <script src="../../js/plugin/pfnotify/pnotify.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function listar_opciones(opc, id) {
            var ap = "";
            if (opc === 'Listar_direccion') {
                var a = $(".select_direccion");
                $(".select_dep").empty();
                $(".select_dep").append("<option value='0' selected >Todos</option>");
                $(".select_area").empty();
                $(".select_area").append("<option value='0' selected >Todos</option>");
                a.empty();
                a.append("<option value='0' selected >Todos</option>");
            }
            if (opc === 'Listar_dir_dep') {
                var a = $(".select_dep");
                $(".select_area").empty();
                $(".select_area").append("<option value='0' selected >Todos</option>");
                ap = "&id=" + id;
                a.empty();
                a.append("<option value='0' selected >Todos</option>");
            }
            if (opc === 'Listar_area2') {
                var a = $(".select_area");
                ap = "&id=" + id;
                $(".select_seccion").empty();
                $(".select_seccion").append("<option value='0' selected >Todos</option>");
                a.empty();
                a.append("<option value='0' selected >Todos</option>");
            }
            if (opc === "Listar_sec2") {
                var a = $(".select_seccion");
                ap = "&id=" + id;
                $(".select_puesto").empty();
                $(".select_puesto").append("<option value='0' selected >Todos</option>");
                a.empty();
                a.append("<option value='0' selected >Todos</option>");
            }
            if (opc === "Listar_pu_id") {
                var a = $(".select_puesto");
                ap = "&id=" + id;
                a.empty();
                a.append("<option value='0' selected >Todos</option>");
            }
            if (opc === "list_req") {
                var a = $("#nom_req");
                a.empty();
            }
            $.ajax("../../Direccion_Puesto?opc=" + opc + ap, {
                type: 'POST',
                async: false,
                success: function (objJson) {
                    var list = objJson.lista;
                    for (var i = 0; i < list.length; i++) {
                        a.append("<option value='" + list[i].id + "'>" + list[i].nombre + "</option>");
                    }
                }
            });
        }

        var c = 0;
        var rq = $("#nom_req");
        function init() {
            var opc = 'Listar_direccion';
            var id = "";
            listar_opciones(opc, id);
            listar_opciones("list_req", null);
            $(".select_direccion").change(function () {
                var opc = 'Listar_dir_dep';
                var id = $(".select_direccion").val();
                listar_opciones(opc, id);
                listSFP();
            });
            $(".select_dep").change(function () {
                var opc = 'Listar_area2';
                var id = $(".select_dep").val();
                listar_opciones(opc, id);
                listSFP();
            });
            $(".select_area").change(function () {
                var id = $(".select_area").val();
                var opc = 'Listar_sec2';
                listar_opciones(opc, id);
                listSFP();
            });
            /*$(".select_cc").change(function () {
             var id = $(".select_cc").val().split("**")[0];
             $("#id_cc").attr("value", id);
             });*/
            $(".select_seccion").change(function () {
                var id = $(".select_seccion").val();
                var opc = 'Listar_pu_id';
                listar_opciones(opc, id);
            });
            $(".select_puesto").change(function () {
                var id = $(".select_puesto").val();
                listSFP();
            });
            $("#nom_req").change(function () {
                listSFP();
            });
            rq.select2({
                placeholder: 'Seleccione una o más opciones',
                allowClear: true,
                maximumSelectionLength: 6
            });
            $("#checkbox").click(function () {
                if ($("#checkbox").is(':checked')) {
                    $("#nom_req > option").prop("selected", "selected");// Select All Options
                    $("#nom_req").trigger("change");// Trigger change to select 2
                } else {
                    $("#nom_req > option").removeAttr("selected");
                    $("#nom_req").trigger("change");// Trigger change to select 2
                }
            });
        }

        var table;
        var totalc = 0, totalp = 0;
        function listSFP() {
            var data;
            var req = $("#nom_req").val();
            /*if (req != null) {*/
            if (req === null) {

                var optionValues = [];

                $('#nom_req option').each(function () {
                    if (optionValues.length < 6) {
                        optionValues.push($(this).val());
                    }
                });
                req = optionValues;
            }
            data = {
                idDep: $(".select_dep").val(),
                idArea: $(".select_area").val(),
                idPuesto: $(".select_puesto").val(),
                idDir: $(".select_direccion").val(),
                idSeccion: $(".select_seccion").val(),
                'req[]': req
            };
            $.ajax("../../pres?opc=listResumenDetPres", {
                data: data,
                type: 'POST',
                async: true,
                success: function (data) {
                    var info = "";
                    info = "<tr>";
                    info += "<th data-class='expand'>Departamento</th>";
                    info += "<th data-hide='phone'>Área</th>";
                    for (var i = 0; i < req.length; i++) {
                        info += "<th data-hide='phone,tablet'>" + $("#nom_req  option[value='" + req[i] + "']").text() + "</th>";
                    }
                    info += "</tr>";
                    $(".thead_list").empty();
                    $(".thead_list").append(info);
                    data = data.rpta;
                    info = '';
                    for (var i = 0; i < data.length; i++) {
                        info += '<tr>';
                        info += '<td>' + data[i].NO_DEP + '</td>';
                        info += '<td>' + data[i].NO_AREA + '</td>';
                        var mp = {};
                        for (var j = 0; j < data[i].detpres.length; j++) {
                            mp[data[i].detpres[j].ID_REQUERIMIENTO] = data[i].detpres[j].N_TRABAJADORES;
                        }
                        for (var k = 0; k < req.length; k++) {
                            if (mp[req[k]] != null) {
                                info += "<td class='text-center'>" + mp[req[k]] + "</td>";
                            } else {
                                info += "<td class='text-center'>0</td>";
                            }
                        }
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
                            "sEmptyTable": "Uy! No hemos encontrado ninguna información.",
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
                        },
                        "responsive": true,
                        "autoWidth": true
                    });

                }

            });

        }


        $(document).ready(function () {
            pageSetUp();
            $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>");
            });
            $("#checkbox").attr("checked", false);
            init();
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
