
<%-- 
    Document   : MantPrivilegio
    Created on : 22/07/2015, 10:22:15 AM
    Author     : Andres
--%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Privilegios</title>
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
        <div class="page-header">
            <center><h1 class="page-title">Mantenimiento de Privilegios</h1></center>
        </div>

        <div class="well">
            <div class="row">
                <center>
                    <button class="btn btn-info btn-lg btnNew" data-toggle="modal" data-target="#myModalNew">
                        <span class="fa fa-user"></span>
                        <span>&nbsp;&nbsp;Nuevo Privilegio</span>
                    </button>
                </center>
            </div>
            <hr>
            <div class="contTabla table-responsive">
                <table class="tablaT table table-responsive table-hover table-bordered">
                    <thead>
                    <th>Nro</th>
                    <th>Modulo</th>
                    <th>Privilegio</th>
                    <th>Estado</th>
                    <th style="width: 8%">Opciones</th>
                    </thead>
                    <tbody class="tbodys">

                    </tbody>
                </table>
            </div>
        </div>


        <!-- Modal   -->

        <div id="myModalNew" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Nuevo Privilegio</h4>
                    </div>

                    <div class="modal-body">
                        <form class="smart-form">
                            <div class="row">
                                <section class="col col-xs-12">
                                    <label class="label">Modulo</label>
                                    <input class="form-control txtModuloN" type="text" name="lmoduloN" list="listModuloN">
                                    <datalist id="listModuloN">
                                        <option value="SIN DATOS">
                                    </datalist>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-xs-12">
                                    <label class="label">Nombre de Privilegio</label>
                                    <label class="input">
                                        <input class="form-control txtPrN" type="text" maxlength="50" placeholder="Escribir Nombre">  
                                    </label>

                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-xs-12">
                                    <label class="label">Direccion Url</label>
                                    <label class="input">
                                        <input class="form-control txtUrlN" type="text" maxlength="300" placeholder="Escribir Direccion">  
                                    </label>

                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-xs-12">
                                    <label class="label">Icono</label>
                                    <label class="input">
                                        <input class="form-control txtIconN" type="text">  
                                    </label>

                                </section>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="modIdN" value="">
                        <button type="button" class="btn btn-primary modAceptarN" data-dismiss="modal">Aceptar</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                    </div>

                </div>

            </div>
        </div>
        <div id="myModalEdit" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modificar Privilegio</h4>
                    </div>

                    <div class="modal-body ">
                        <form class="smart-form">
                            <div class="row">
                                <section class="col col-xs-12">
                                    <label class="label">Modulo</label>
                                    <input class="form-control" type="text" list="listModuloE">
                                    <datalist id="listModuloE">
                                        <option value="SIN DATOS">
                                    </datalist>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-xs-12">
                                    <label class="label">Nombre de Privilegio</label>
                                    <label class="input">
                                        <input class="form-control" type="text" maxlength="50">  
                                    </label>

                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-xs-12">
                                    <label class="label">Direccion Url</label>
                                    <label class="input">
                                        <input class="form-control" type="text" maxlength="300">  
                                    </label>

                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-xs-12">
                                    <label class="label">Icono</label>
                                    <label class="input">
                                        <input class="form-control" type="text">  
                                    </label>

                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-xs-12">
                                    <label class="label">Estado</label>
                                    <label class="select">
                                        <select>
                                            <option value="-1">[Seleccione]</option>
                                            <option value="0">Activado</option>
                                            <option value="1">Deshabilitado</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="modId" value="">
                        <button type="button" class="btn btn-primary modAceptar" data-dismiss="modal">Aceptar</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                    </div>

                </div>

            </div>
        </div>
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>

        
        <script src="../../../js/libs/jquery-2.0.2.min.js" type="text/javascript"></script>
        <script src="../../../js/libs/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <script src="../../../js/bootstrap/bootstrap-modal.js" type="text/javascript"></script>
        <script src="../../../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>
        <script src="../../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script src="../../../js/notification/SmartNotification.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.tablaT').DataTable();

                listar_tabla();

                function listar_tabla() {
                    $.post("../../../Privilegio?opc=ListPrivilegio", function (objJson) {

                        var lista = objJson.Lista;
                        if (lista.length > 0) {
                            listar_modulo();
                            crearTabla();
                            var t = "";
                            for (var i = 0; i < lista.length; i++) {
                                t += "<tr>";
                                t += "<td>" + (i + 1) + "</td>";
                                t += "<td class='md" + (i + 1) + "' id=" + lista[i].id_md + ">" + lista[i].no_md + "</td>";
                                t += "<td class='pr" + (i + 1) + "' id=" + lista[i].id_pr + ">" + lista[i].no_pr + "</td>";
                                if (lista[i].es_pr == 1) {
                                    t += "<td id='es" + (i + 1) + "' class='1'><span class='label label-success font-sm semi-bold'>Activado</span></td>";
                                } else {
                                    t += "<td id='es" + (i + 1) + "' class='0'><span class='label label-danger font-sm semi-bold'>Desactivado</span></td>";
                                }

                                t += "<td id='es" + (i + 1) + "'><a class='btn btn-default' data-toggle='modal' data-target='#myModalEdit'><span class='fa fa-search'></span><span>&nbsp;&nbsp;Modificar</span></a></td>";
                                t += "</tr>";
                            }
                            $('.tbodys').append(t);


                            $('.tablaT').DataTable();

                        }
                    });
                }
                $('.modAceptarN').click(function () {

                    var data = "";

                    data += "No_Link=" + $('.txtPrN').val();
                    data += "&Di_url=" + $('.txtUrlN').val();
                    data += "&Es_privilegio=1";
                    data += "&Ic_Link=" + $('.txtIconN').val();
                    var x = document.getElementById("listModuloN");
                    var z = false;
                    for (var i = 0; i < x.options.length; i++) {
                        if ($('.txtModuloN').val() == x.options[i].value) {
                            data += "&modulo=" + x.options[i].id;
                            z = true;
                        }
                    }
                    if (z = true) {
                        $.post("../../../Privilegio?opc=REGISTRAR_PRIVILEGIO", data, function () {
                            listar_tabla();
                            $.smallBox({
                                title: "Crear Privilegio",
                                content: "<i class='fa fa-clock-o'></i> <i>El Privilegio ha sido creado correctamente</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 2000
                            });
                        });
                    } else {
                        $.smallBox({
                            title: "Crear Privilegio",
                            content: "<i class='fa fa-clock-o'></i> <i>Operacion Cancelada</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 2000
                        });
                    }


                    /**/
                });
                function listar_modulo() {
                    $.post("../../../Privilegio?opc=ListModulo", function (objJson) {
                        var lista = objJson.Lista;
                        if (lista.length > 0) {
                            var t = "";
                            $('#listModuloN').empty();
                            $('#listModuloE').empty();
                            for (var i = 0; i < lista.length; i++) {
                                t += "<option id='" + lista[i].id_md + "' value='" + lista[i].no_md + "'>";
                            }
                            $('#listModuloN').append(t);
                            $('#listModuloE').append(t);

                        }
                    });
                }

                function crearTabla() {
                    var t = "";
                    t += '<table class="tablaT table table-responsive table-hover">';
                    t += '<thead>';
                    t += '<th style="width: 5%">Nro</th>';
                    t += '<th>Modulo</th>';
                    t += '<th>Privilegio</th>';
                    t += '<th style="width: 8%">Estado</th>';
                    t += '<th style="width: 8%">Opciones</th>';
                    t += '</thead>';
                    t += '<tbody class="tbodys">';
                    t += '</tbody>';
                    t += '</table>';
                    $('.contTabla').empty();
                    $('.contTabla').append(t);
                }
            });
        </script>


    </body>
</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>