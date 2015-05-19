<%-- 
    Document   : MantCCosto
    Created on : 19/05/2015, 09:55:03 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">
    </head>
    <body>
        <div class="well caja_t">
            <div class="row">

            </div>
        </div>
        <div class="well">
            <div class="row">
                <div class="table-responsive cont_t">
                    <table class="table table-bordered table-striped table-responsive tabla_t">
                        <thead>
                            <tr>
                                <td class="text-center semi-bold" width="10%">Nro</td>
                                <td class="text-center semi-bold">Codigo</td>
                                <td class="text-center semi-bold">Detalle</td>
                                <td class="text-center semi-bold">Departamento</td>
                                <td class="text-center semi-bold">Area</td>
                                <td class="text-center semi-bold">Acciones</td>
                            </tr>
                        </thead>
                        <tbody class="tbodys">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
            if (!window.jQuery) {
                document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
            }
        </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
            if (!window.jQuery.ui) {
                document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
            }
        </script>
        <script src="../../js/app.config.js"></script>
        <script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 
        <script src="../../js/bootstrap/bootstrap.min.js"></script>
        <script src="../../js/notification/SmartNotification.min.js"></script>
        <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
        <script src="../../js/plugin/select2/select2.min.js"></script>
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
        <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>
        <script src="../../js/plugin/fastclick/fastclick.min.js"></script>
        <script src="../../js/demo.min.js"></script>
        <script src="../../js/app.min.js"></script>
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

        <script>
            $(document).ready(function () {
                $('.caja_t').hide();
                $('.tabla_t').DataTable();
                cargar_T();
                function cargar_T() {
                    $.post("../../MCCosto?opc=list_ccosto", function (objJson) {
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            var t = "";
                            for (var i = 0; i < lista.length; i++) {
                                t += "<tr id="+lista[i].ID_CENTRO_COSTO+">";
                                t += "<td>" + (i + 1) + "</td>";
                                t += "<td>"+lista[i].CO_CENTRO_COSTO+"</td>";
                                t += "<td>"+lista[i].DE_CENTRO_COSTO+"</td>";
                                if(lista[i].NO_DEP!=undefined){
                                    t += "<td>"+lista[i].NO_DEP+"</td>";
                                }else{
                                    t += "<td style='background-color : #d6dde7'>Sin Asignar</td>";
                                }
                                if(lista[i].NO_AREA!=undefined){
                                    t += "<td>"+lista[i].NO_AREA+"</td>";
                                }else{
                                    t += "<td style='background-color : #d6dde7'>Sin Asignar</td>";
                                }
                                t += "<td>Acciones</td>";
                                t += "</tr>";
                            }
                            crear_T();
                            $('.tbodys').append(t);
                            $('.tabla_t').DataTable();                          
                        }
                    });
                }
                function crear_T() {
                    var t = '<table class="table table-bordered table-striped table-responsive tabla_t">';
                    t += ' <thead>';
                    t += '   <tr>';
                    t += '         <td class="text-center semi-bold" width="10%">Nro</td>';
                    t += '         <td class="text-center semi-bold">Codigo</td>';
                    t += '         <td class="text-center semi-bold">Detalle</td>';
                    t += '         <td class="text-center semi-bold">Departamento</td>';
                    t += '         <td class="text-center semi-bold">Area</td>';
                    t += '         <td class="text-center semi-bold">Acciones</td>';
                    t += '     </tr>';
                    t += ' </thead>';
                    t += ' <tbody class="tbodys"></tbody>';
                    t += '</table>';
                    $('.cont_t').empty();
                    $('.cont_t').append(t);
                }
                function barra_acciones(){
                    var t='';
                }
            });
        </script>
    </body>
</html>
