<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="windows-1252">
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
        <header>
            <h1 class="page-title text-center">Agregar Roles</h1>
        </header>
        <div class="well">
            <form class="smart-form formm">
                <div class="row">
                    <section class="col col-xs-6">
                        <label class="label">Nombre</label>
                        <label class=" input">
                            <input type="text" name="NOMBRE" class="form-control" >
                        </label>
                    </section>
                    <section class="col col-xs-4">
                        <label class="label">Estado</label>
                        <label class="select">
                            <select name="ESTADO">
                                <option value="1">Activado</option>
                                <option>Desactivado</option>
                            </select>
                            <i></i></label>
                    </section>
                    <section class="col col-xs-2">
                        <input type="button" name="opc"  class="btn btn-primary btn-block reg" style="margin-top: 25px;height: 32px;" value="Registrar">
                    </section>
                </div>
            </form>
        </div>
        <div class="well">
            <div class="table-responsive cont_t">
                <table class="tabla_t table table-bordered table-hover table-striped">
                    <thead>
                        <tr>
                            <th class="text-center semi-bold">Nro</th>
                            <th class="text-center semi-bold">Rol</th>
                            <th class="text-center semi-bold">Estado</th>
                            <th class="text-center semi-bold">Opciones</th>
                        </tr>
                    </thead>
                    <tbody class="tbodys">
                    </tbody>
                </table>
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
        <script>
            $(document).ready(function () {

                list_rol();
                $('.reg').click(function () {
                    var data = $('.formm').serialize();
                    $.post("../../../Roles?opc=REGISTRAR", data, function () {
                    });
                });
                function list_rol() {
                    $.post("../../../Roles?opc=Listar_Rol", function (objJson) {

                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            var text = "";
                            for (var i = 0; i < lista.length; i++) {
                                text += "<tr>";
                                text += "<td>" + (i + 1) + "</td>";
                                text += "<td>" + lista[i].no_rol + "</td>";
                                if(lista[i].es_rol==0){
                                    text+="<td><span class='label label-danger font-sm semi-bold'>Desactivado</span></td>";
                                }else if(lista[i].es_rol==1){
                                    text+="<td><span class='label label-success font-sm semi-bold'>Activado</span></td>";
                                }
                                text += "<td>"+barra_acciones(lista[i].id_rol)+"</td>";
                                text += "</tr>";
                            }
                            crear_t();
                            $('.tbd').append(text);
                            $('.tabla_t').DataTable();
                        }
                    });
                }
                function crear_t() {
                    var text = '<table class="tabla_t table table-bordered table-hover table-striped"><thead><tr><th class="text-center semi-bold">Nro</th>';
                    text += '<th class="text-center semi-bold">Rol</th><th class="text-center semi-bold">Estado</th><th class="text-center semi-bold">Opciones</th>\n\
                            </tr></thead><tbody class="tbd">';
                    text += '</tbody></table>';
                    $('.cont_t').empty();
                    $('.cont_t').append(text);
                }
                function barra_acciones(idrol) {
                        var tex = '<center><div class="btn-group">';
                        tex += '<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">';
                        tex += 'Action <span class="caret"></span></button>';
                        tex += '<ul class="dropdown-menu" role="menu">';
                        tex += '<li><a href="#" id='+idrol+'>Modificar</a></li>';
                        tex += '<li><a href="#" id='+idrol+'>Activar</a></li>';
                        tex += '<li><a href="#" id='+idrol+'>Desactivar</a></li>';
                        tex += '</ul>';
                        tex += '</div></center>';
                        return tex;
                    }
            });
        </script>
    </body>
</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>