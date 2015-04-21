<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle Historial</title>
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">
        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">
        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <!-- #GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
    </head>
    <body>
        <div id="main" role="main" style="margin: 0px;">
            <div id="content" >
                <section id="widget-grid" class="">
                    <div class="row">

                        <div class="well">
                            <form class="smart-form form_f">

                                <h1 class="text-center"><strong>Datos de Hijos </strong> <small> / Historial de Modificaciones </small></h1><br>
                                <h1 class="text-left font-md semi-bold">Comparar Modificaciones :</h1><br>
                                <div class="row">
                                    <div class="col col-lg-12">
                                        <section class="col col-sm-6">
                                            <label><strong>Trabajador</strong></label>
                                            <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                                <select name="trabajador" required="">
                                                    <option value='' >[SELECCIONE]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-sm-6">
                                            <label><strong>Hijo(a)</strong></label>
                                            <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                                <select name="trabajador" required="">
                                                    <option value='' >[SELECCIONE]</option>
                                                </select>
                                            </label>
                                        </section>

                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col col-lg-12">
                                        <section class="col col-sm-6">
                                            <label><strong>Fecha</strong></label>
                                            <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                                <select name="fecha1" required="">
                                                    <option value='' >[SELECCIONE]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-sm-6">
                                            <label><strong>Fecha</strong></label>
                                            <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                                <select name="fecha1" required="">
                                                    <option value='' >[SELECCIONE]</option>
                                                </select>
                                            </label>
                                        </section>
                                    </div>

                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="row">
                        <div class="well">
                            <div class="table-responsive cont_t">
                                <table class="tabla_t table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center semi-bold">Nro</th>
                                            <th class="text-center semi-bold">Data 1</th>
                                            <th class="text-center semi-bold">Data 2</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbodys">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>
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
        <script src="../../../js/app.config.js"></script>
        <script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 
        <script src="../../../js/bootstrap/bootstrap.min.js"></script>
        <script src="../../../js/notification/SmartNotification.min.js"></script>
        <script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>
        <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
        <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>
        <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>
        <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
        <script src="../../../js/plugin/select2/select2.min.js"></script>
        <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
        <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>
        <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>
        <!--[if IE 8]>
        
        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
        
        <![endif]-->

        <!-- Demo purpose only -->
        <script src="../../../js/demo.min.js"></script>
        <script src="../../../js/app.min.js"></script>
        <script src="../../../js/speech/voicecommand.min.js"></script>
        <script src="../../../js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="../../../js/plugin/fuelux/wizard/wizard.min.js"></script>
        <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>
        <script src="../../../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>
        <script src="../../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {


            });
            function obetnerDatos() {
                if ($('.form_f').valid()) {
                    var data = $('.form_f').serialize();
                    var d = "&opc=Filtro_hijo";
                    $.post("../../../RHistorial", data + d, function (objJson) {
                        var lista = objJson.lista;
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        if (lista.length < 1) {
                            $.smallBox({
                                title: "Busqueda de Historial",
                                content: "<i class='fa fa-ban'></i> <i>No hay modificaciones en ese rango de fechas</i>",
                                color: "#dfb56c",
                                iconSmall: "bounce animated",
                                timeout: 4000
                            });
                            crear_t();
                            $('.tabla_t').DataTable();
                        } else {
                            var t = "<tr>";
                            for (var i = 0; i < lista.length; i++) {
                                t += "<td>" + (i + 1) + "</td>";
                                t += "<td>" + lista[i].ap_pat_t + " " + lista[i].ap_mat_t + " " + lista[i].no_tra + "</td>";
                                t += "<td>" + lista[i].ap_pat_h + " " + lista[i].ap_mat_h + " " + lista[i].no_hijo + "</td>";
                                if (lista[i].estado_filtro == '1') {
                                    t += "<td>Modificado</td>";
                                } else if (lista[i].estado_filtro == '0') {
                                    t += "<td>Agregado</td>";
                                }
                                t += "<td>" + lista[i].fecha + "</td>";
                                t += "<td><a href='' class='btn btn-primary btn-labeled'>Ver Detalle <i class='fa fa-arrow-circle-right' ></i></a></td></tr> ";
                            }
                            crear_t();
                            $('.tbodys').append(t);
                            $('.tabla_t').DataTable();
                        }
                    });
                    $(".btnCancelar").click(function () {
                        $('.form_f')[0].reset();
                        crear_t();
                        $('.tabla_t').DataTable();
                    });
                } else {
                    $.smallBox({
                        title: "Busqueda de Historial",
                        content: "<i class='fa fa-ban'></i> <i>Complete los filtros...</i>",
                        color: "red",
                        iconSmall: "bounce animated",
                        timeout: 4000
                    });
                }
            }
            function crear_t() {
                var text = '<table class="tabla_t table table-bordered table-hover table-striped"><thead><tr><th class="text-center semi-bold">Nro</th>';
                text += '<th class="text-center semi-bold">Trabajador</th><th class="text-center semi-bold">Hijo(a)</th><th class="text-center semi-bold">Estado</th><th class="text-center semi-bold">Fecha</th><th class="text-center semi-bold">Detalle</th></tr></thead><tbody class="tbodys">';
                text += '</tbody></table>';
                $('.cont_t').empty();
                $('.cont_t').append(text);
            }
        </script>
    </body>
</html>
