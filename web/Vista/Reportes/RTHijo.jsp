<%-- 
    Document   : RTHijo
    Created on : 15/10/2015, 11:41:29 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de Hijos de Trabajadores</title>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
    </head>
    <style>
        .dt-toolbar{
            width: 50%;
        }
    </style>

    <body>
        <div class="row">
            <div class="page-header">
                <center><h1>Datos de Hijos</h1></center>
            </div>
        </div>
        <div class="well">
            <form class="smart-form">
                <div class="row">
                    <section class="col col-xs-12">
                        <div class="col col-xs-3">
                            <label class="label">Nombre</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Nombres">
                            </label>
                        </div>
                        <div class="col col-xs-2">
                            <label class="label">Apellido Paterno</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Paterno">
                            </label>
                        </div>
                        <div class="col col-xs-2">
                            <label class="label">Apellido Materno</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Materno">
                            </label>
                        </div>
                        <div class="col col-xs-2">
                            <label class="label">DNI</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="DNI">
                            </label>
                        </div>
                        <div class="col col-xs-3">
                            <label class="label">Genero</label>
                            <label class="select">
                                <select>
                                    <option value="">[Seleccione]</option>
                                    <option value="F">Femenino</option>
                                    <option value="M">Masculino</option>
                                </select>
                                <i></i></label>
                        </div>
                    </section>
                </div>
                <hr>
                <div class="row">
                    <section class="col col-xs-12">
                        <div class="col col-xs-3">
                            <label class="label">Edad Especifica</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Edad">
                            </label>
                        </div>
                        <div class="col col-xs-3">
                            <label class="label">Desde</label>
                            <label class="input">
                                <input class="form-control" type="date" placeholder="Desde">
                            </label>
                        </div>
                        <div class="col col-xs-3">
                            <label class="label">Hasta</label>
                            <label class="input">
                                <input class="form-control" type="date" placeholder="Hasta">
                            </label>
                        </div>
                    </section>                    
                </div>
                <div style="float: right">
                    <a class="btn btn-primary btn-circle btn-lg"><i class="fa fa-search"></i></a>
                    <a class="btn btn-danger btn-circle btn-lg"><i class="fa fa-times"></i></a>
                </div>
            </form>
        </div>
        <br>

        <div class="row" style="width: 200%">
            <section class="col col-xs-12">
                <div class="col col-xs-12">
                    <div class="well cont_t">
                        <h3>Reporte</h3>
                        <table id="tabladato" class="table table-striped table-responsive table-bordered">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>Apellidos y Nombres(Trabajador)</td>
                                    <td>DNI</td>
                                    <td>Departamento</td>
                                    <td>Area</td>
                                    <td>Seccion</td>
                                    <td>Puesto</td>
                                    <td>APS</td>
                                    <td>Condicion</td>
                                    <td>Tipo de Contrato</td>
                                    <td>Apellidos y Nombres(Hijo)</td>
                                    <td>Sexo</td>
                                    <td>Nacimiento</td>
                                    <td>Edad</td>
                                    <td>Tipo documento</td>
                                    <td>Nro Documento</td>
                                    <td>Apellidos y Nombres(Conyuge)</td>
                                    <td>DNI</td>
                                    <td>Trabaja UPeU</td>
                                </tr>
                            </thead>
                            <tbody class="tbdHijos">

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </div>
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>

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

        <!-- EASY PIE CHARTS -->
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="../../js/plugin/fastclick/fastclick.min.js"></script>

        <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->

        <!-- Demo purpose only -->
        <script src="../../js/demo.min.js"></script>

        <!-- MAIN APP JS FILE -->
        <script src="../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../js/speech/voicecommand.min.js"></script>

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script >
            $(document).ready(function () {

                pageSetUp();
                setTable();
                buscar();

                function buscar() {
                    $.post("../../CReporte_Hijo?opc=reporte_hijos", function (objJson) {
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            var t = "";
                            for (var i = 0; i < lista.length; i++) {
                                t += "<tr>";
                                t += "<td>" + (i + 1) + "</td>";
                                t += "<td>" + lista[i].AP_PATERNO+" "+ lista[i].AP_MATERNO+" "+ lista[i].NO_TRABAJADOR + "</td>";
                                t += "<td>" + lista[i].NU_DOC + "</td>";
                                t += "<td>" + lista[i].NO_DEP + "</td>";
                                t += "<td>" + lista[i].NO_AREA + "</td>";
                                t += "<td>" + lista[i].NO_SECCION + "</td>";
                                t += "<td>" + lista[i].NO_PUESTO + "</td>";
                                t += "<td>" + lista[i].CO_APS + "</td>";
                                t += "<td>" + lista[i].TI_CONTRATO + "</td>";
                                t += "<td>" + lista[i].TI_CONTRATO + "</td>";
                                t += "<td>" + lista[i].AP_PATERNO_HIJO+" "+lista[i].AP_MATERNO_HIJO+" "+lista[i].NO_HIJO_TRABAJADOR + "</td>";
                                t += "<td>" + lista[i].ES_SEXO + "</td>";
                                t += "<td>" + lista[i].FE_NACIMIENTO + "</td>";
                                t += "<td>" + lista[i].FE_NACIMIENTO + "</td>";
                                t += "<td>" + lista[i].ES_TIPO_DOC + "</td>";
                                t += "<td>" + lista[i].NU_DOC_HIJO + "</td>";
                                t += "<td>" + lista[i].AP_NOMBRES_C + "</td>";
                                t += "<td>" + lista[i].NU_DOC_C + "</td>";
                                t += "<td>" + lista[i].ES_TRABAJA_UPEU_C + "</td>";
                                t += "</tr>";
                            }
                            crear_tabla();
                            $('.tbdHijos').append(t);
                            setTable();

                        }
                    });
                }
                function crear_tabla() {
                    var t = "";
                    t += '<h3>Reporte</h3><table id="tabladato" class="table table-striped table-responsive table-bordered">';
                    t += ' <thead><tr><td>#</td><td>Apellidos y Nombres(Trabajador)</td><td>DNI</td><td>Departamento</td>';
                    t += '<td>Area</td><td>Seccion</td><td>Puesto</td><td>APS</td><td>Condicion</td>';
                    t += '<td>Tipo de Contrato</td><td>Apellidos y Nombres(Hijo)</td><td>Sexo</td>';
                    t += '<td>Nacimiento</td><td>Edad</td><td>Tipo documento</td><td>Nro Documento</td><td>Apellidos y Nombres(Conyuge)</td>';
                    t += '<td>DNI</td><td>Trabaja UPeU</td></tr></thead><tbody class="tbdHijos"></tbody></table>';
                    $('.cont_t').empty();
                    $('.cont_t').append(t);
                }


                function setTable() {
                    var responsiveHelper_datatable_tabletools = undefined;

                    var breakpointDefinition = {
                        tablet: 1024,
                        phone: 480
                    };

                    $('#tabladato').dataTable({
                        // Tabletools options: 
                        //   https://datatables.net/extensions/tabletools/button_options
                        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'T>r>" +
                                "t" +
                                "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
                        "oTableTools": {
                            "aButtons": [
                                "copy",
                                "csv",
                                "xls",
                                {
                                    "sExtends": "pdf",
                                    "sTitle": "SmartAdmin_PDF",
                                    "sPdfMessage": "SmartAdmin PDF Export",
                                    "sPdfSize": "letter"
                                },
                                {
                                    "sExtends": "print",
                                    "sMessage": "Generated by SmartAdmin <i>(press Esc to close)</i>"
                                }
                            ],
                            "sSwfPath": "../../js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
                        },
                        "autoWidth": false,
                        "preDrawCallback": function () {
                            // Initialize the responsive datatables helper once.
                            if (!responsiveHelper_datatable_tabletools) {
                                responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#tabladato'), breakpointDefinition);
                            }
                        },
                        "rowCallback": function (nRow) {
                            responsiveHelper_datatable_tabletools.createExpandIcon(nRow);
                        },
                        "drawCallback": function (oSettings) {
                            responsiveHelper_datatable_tabletools.respond();
                        }
                    });
                }
            });
        </script>
    </body>
</html>
