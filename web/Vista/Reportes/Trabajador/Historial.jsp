<%-- 
    Document   : Historial
    Created on : 14/04/2015, 10:05:59 AM
    Author     : Andres
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial de Modificaciones</title>

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

                                <h1 class="text-center">Historial de Modificaciones <small>/ Trabajadores</small></h1><br>
                                <h1 class="text-left font-md semi-bold">Filtros:</h1><br>
                                <div class="row">
                                    <div class="col col-xs-9">
                                        <section class="col col-sm-6">
                                            <label>Desde:</label>
                                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
                                                <input type="text"  placeholder="Seleccionar Fecha" class="datepicker" id="dtp1" data-dateformat='dd/mm/yy' name="fe_inicio">
                                            </label>
                                        </section>
                                        <section class="col col-sm-6">
                                            <label>Hasta:</label>
                                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
                                                <input type="text"  placeholder="Seleccionar Fecha" class="datepicker" id="dtp2" data-dateformat='dd/mm/yy' name="fe_fin">
                                            </label>
                                        </section>
                                    </div>
                                    <div class="col col-xs-3">
                                        <center>
                                            <section class="col col-sm-12">
                                                <a class="btn btn-primary btn-circle btn-xl btnEnviar"><i class="glyphicon glyphicon-search"></i></a>
                                            </section>
                                        </center>
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
                                            <th class="text-center semi-bold">Trabajador</th>
                                            <th class="text-center semi-bold">Acciones</th>
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







        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>
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
                $("#dtp1").datepicker({
                    dateFormat: "dd/mm/yy",
                    defaultDate: "+1d",
                    prevText: '<<',
                    nextText: '>>',
                    numberOfMonths: 2,
                    onClose: function (selectedDate) {
                        $("#dtp2").datepicker("option", "minDate", selectedDate);
                        $("#dtp2").datepicker("setDate", selectedDate);
                    }
                });
                $("#dtp2").datepicker({
                    dateFormat: "dd/mm/yy",
                    defaultDate: "+1d",
                    prevText: '<<',
                    nextText: '>>',
                    numberOfMonths: 2,
                    onClose: function (selectedDate) {

                        $("#dtp1").datepicker("option", "maxDate", selectedDate);
                    }
                });
                $('.tabla_t').DataTable();
                $('.btnEnviar').click(function () {
                    var data = $('.form_f').serializeArray();
                    var d = "opc=list_mod_fecha";
                    jQuery.each(data, function (index, field) {
                        d += "&" + field.name + "=" + field.value;
                    });
                    $.post("../../../RHistorial?", d, function (objJson) {
                        var lista = objJson.lista;
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
                            var t = "";
                            for (var i = 0; i < lista.length; i++) {
                                t += "<tr>";
                                t += "<td>" + (i + 1) + "</td>";
                                t += "<td>" + lista[i].no_tra + " " + lista[i].ap_pat + " " + lista[i].ap_mat + "</td>";
                                t += '<td>' + barra_acciones(lista[i].id_tra) + '</td></tr>';
                            }

                            crear_t();
                            $('.tbodys').append(t);
                            $('.tabla_t').DataTable();
                        }
                    });
                    function crear_t() {
                        var text = '<table class="tabla_t table table-bordered table-hover table-striped"><thead><tr><th class="text-center semi-bold">Nro</th>';
                        text += '<th class="text-center semi-bold">Trabajador</th><th class="text-center semi-bold">Detalle</th></tr></thead><tbody class="tbodys">';
                        text += '</tbody></table>';
                        $('.cont_t').empty();
                        $('.cont_t').append(text);
                    }
                    function barra_acciones(idtr) {
                        var tex = '<center><div class="btn-group">';
                        tex += '<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">';
                        tex += 'Action <span class="caret"></span></button>';
                        tex += '<ul class="dropdown-menu" role="menu">';
                        tex += '<li><a href="../../../RHistorial?opc=mod_tra&idtr=' + idtr + '">Detalle</a></li>';
                        tex += '</ul>';
                        tex += '</div></center>';
                        return tex;
                    }
                });
            });
        </script>
    </body>

</html>
