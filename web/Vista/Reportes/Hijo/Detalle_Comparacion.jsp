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
                                                <input type="text" class="idtr" value="<%%>">
                                            </label>
                                        </section>
                                        <section class="col col-sm-6">
                                            <label><strong>Hijo(a)</strong></label>
                                            <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                                <select name="trabajador" required="" class="hijo">
                                                    <option value='' >[SELECCIONE]</option>
                                                </select>
                                                <input type="text" class="idh" value="<%="DHT-001665"%>">
                                            </label>
                                        </section>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-lg-12">
                                        <section class="col col-sm-6">
                                            <label><strong>Fecha</strong></label>
                                            <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                                <select class="fecha1" required="">
                                                    <option value='' >[SELECCIONE]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-sm-6">
                                            <label><strong>Fecha</strong></label>
                                            <label class="select"><i class="icon-append fa fa-calendar"></i>
                                                <select class="fecha2" required="">
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
                $.post("../../../RHistorial", "opc=Fe_Modif_Hijo&hijo=" + $(".idh").val(), function (objJson) {
                    var select1 = $(".fecha1");
                    var select2 = $(".fecha2");
                    var lista = objJson.lista;
                    for (var i = 0; i < lista.length; i++) {
                        select1.append("<option value='" + lista[i].fecha + "'>" + lista[i].fecha + "</option>");
                        select2.append("<option value='" + lista[i].fecha + "'>" + lista[i].fecha + "</option>");
                    }

                });

                $(".fecha2").change(function () {
                    var tbody = $(".tbodys");
                    var num = 1;
                    tbody.empty();
                    $.post("../../../RHistorial", "opc=Comparar_dato_Hijo&id=" + $(".idh").val() + "&fecha1=" + $(".fecha1").val() + "&fecha2=" + $(".fecha2").val(), function (objJson) {
                        var lista = objJson.lista;
                        var texto_html = "";

                        for (var i = 0; i < lista.length; i++) {
                            if (num == 2) {
                                texto_html += "<td>" + lista[i].ap_p + "</td></tr>";
                                num = 1;

                            } else if (num == 1) {
                                texto_html += "<tr><td>" + (i + 1) + "</td><td>" + lista[i].ap_p + "</td>";
                                num++;
                            }
                        }
                        tbody.append(texto_html);
                        texto_html = "";
                    });
                });


            });
        </script>
    </body>
</html>
