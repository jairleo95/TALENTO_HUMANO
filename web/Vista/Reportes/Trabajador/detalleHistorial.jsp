<%-- 
    Document   : detalleHistorial
    Created on : 20/04/2015, 10:03:16 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                                <h1 class="text-center ">Historial de Modificaciones <small>/ Trabajadores</small></h1><br>
                                <div class="row">
                                    <div class="col col-xs-9">
                                        <section class="col col-xs-12">
                                            <div class="custom-scroll table-responsive" style="height:190px; overflow-y: scroll;">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Fecha</th>
                                                            <th>Hora</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="s_fecha">
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                        </section>
                                    </div>
                                    <div class="col col-xs-3">
                                        <section class="col col-sm-12">
                                            <center>
                                                <a class="btn btn-primary btn-circle btn-xl btnEnviar"><i class="glyphicon glyphicon-search"></i></a>
                                            </center>
                                        </section>
                                    </div>


                                </div>
                            </form>


                        </div>

                    </div>
                    <div class="row">
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
                var idtrab = '<%= request.getParameter("idtr")%>';
                cargar_fechas();
                function cargar_fechas() {
                    var s = $('.s_fecha');
                    s.empty();
                    
                    $.post("../../../RHistorial?", "opc=list_mod_tra&idtr=" + idtrab, function (objJson) {
                        var lista = objJson.lista;
                        if (lista.length < 1) {
                            s.empty();
                            s.append("<tr>[No hay Datos]</tr>");
                        } else {
                            s.empty();
                            for (var i = 0; i < lista.length; i++) {
                                if (lista[i].fe_mod != undefined) {
                                    s.append("<tr>");
                                    s.append("<td>" + lista[i].fe_mod + "</td>");
                                    s.append("<td>" + lista[i].hora_mod+ "</td>");
                                    s.append("<td><a class='btn btn-primary'>Ver</a></td>");
                                    s.append("</tr>");
                                }
                                
                            }
                        }
                    });
                }
            });
        </script>
    </body>
</html>
