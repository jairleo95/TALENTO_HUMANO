<%-- 
    Document   : Mant_Area
    Created on : 16/03/2015, 08:32:20 AM
    Author     : Andres
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

            <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">
        <style>
            .caja{
                background:transparent url(../../img/Gifloader.GIF) center no-repeat;
            }
        </style>
    </head>
    <body>
        <div id="main" role="main" style="margin: 0px;">
            <div id="content" >
                <section id="widget-grid" class="">
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3" data-widget-editbutton="false">

                                <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body no-padding">
                                        <form class="smart-form form_f">
                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-12">
                                                        <h2 class="titulo_t" value="1">Agregar Area</h2>
                                                    </section>                                              
                                                </div>                                               
                                                <div class="row">
                                                    <section class="col col-2">
                                                        <label class="label">Nombre</label>
                                                        <label class="input">
                                                            <input class="inpNombre"type="text" placeholder="Escribir nombre de Area" required="" maxlength="100" name="name">
                                                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="label">Nombre Corto</label>
                                                        <label class="input">
                                                            <input class="inpNCorto"type="text" placeholder="Escribir nombre Corto" required="" maxlength="20" name="name2">
                                                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="label">Estado</label>
                                                        <label class="select">
                                                            <select class="inpEstado" required="0" name="est">
                                                                <option value="">[Seleccione]</option>
                                                                <option value="1">Hablilitado</option>
                                                                <option value="2">Deshabilitado</option>
                                                            </select>
                                                            <i></i></label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="label">Direccion</label>
                                                        <label class="select">
                                                            <select class="inpDireccion" required="0" name="dir">
                                                                <option value="">[Seleccione]</option>
                                                            </select>
                                                            <i></i></label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="label">Departamento</label>
                                                        <label class="select">
                                                            <select class="inpDep" required="0" name="dep">
                                                                <option value="">[Seleccione]</option>
                                                            </select>
                                                            <i></i></label>
                                                    </section>
                                                </div>
                                            </fieldset>
                                            <footer>
                                                <input class="inpId" type="hidden" value="">
                                                <input type="submit" class="btn btn-primary btnAceptar" value="Aceptar">
                                                <input type="reset" class="btn btn-default" value="Cancelar">
                                            </footer>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-1" data-widget-editbutton="false">
                                <header class="headerr">
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Lista de Areas</h2>
                                </header>
                                <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body no-padding">
                                        <div class="table-responsive div_t">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </section>
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
        <script src="../../js/speech/voicecommand.min.js"></script>
        <script src="../../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script src="../../js/Js_Mant_Puesto/Datatable_puesto.js"></script>

        <script>
            $(document).ready(function () {
                $('.inpEstado > option[value=1]').attr('selected', 'selected');
                GifLoader($('.div_t'), "Espere..", 1);
                var idDep = "", idDir = "", valNum;
                cargar_direccion();

                $('.inpDireccion').change(function () {
                    if ($(this).val() == "" && idDir == "") {
                        GifLoader($('.div_t'), "Seleccione un Departamento", 2);
                    } else {
                        idDir = $(this).val();
                        cargar_dep(idDir);
                    }

                });
                $('.inpDep').change(function () {
                    if ($(this).val() == "" && idDep == "") {
                        GifLoader($('.div_t'), "Seleccione un Departamento", 2);
                    } else {
                        idDep = $(this).val();
                        cargar_t(idDep);
                    }

                });
                function cargar_t(id) {
                    GifLoader($('.div_t'), "Espere..", 1);
                    $.post("../../Puesto", "opc=list_area_dep&id=" + id, function (objJson) {
                        $('.headerr').show();
                        var tabb = "";
                        tabb += '<table class="table table-striped table-bordered table-hover tabla_t" width="100%"><thead><tr>';
                        tabb += '<td>Nro</td><td>Nombre Area</td><td>Nombre Corto</td><td>Estado</td>';
                        tabb += '<td>Acciones</td></tr></thead><tbody class="tbodys"></tbody></table>';
                        $('.div_t').empty();
                        $('.div_t').append(tabb);
                        var t = $('.tbodys');
                        var list = objJson.lista;
                        var text = "";
                        for (var i = 0; i < list.length; i++) {
                            text += "<tr>";
                            text += "<td class='valId" + (i + 1) + "' value='" + list[i].id + "'>" + (i + 1) + "</td>";
                            text += "<td class='valNombre" + (i + 1) + "'>" + list[i].nombre + "</td>";
                            if (list[i].ncorto != undefined) {
                                text += "<td class='valNCorto" + (i + 1) + "'>" + list[i].ncorto + "</td>";
                            } else {
                                text += "<td class='valNCorto" + (i + 1) + "'>No asignado</td>";
                            }
                            if (list[i].estado == 1) {
                                text += "<td class='valEstado" + (i + 1) + "' value='1' style='background-color: #f0fff0;'>Habilitado</td>";
                            } else if (list[i].estado == 2) {
                                text += "<td class='valEstado" + (i + 1) + "' value='2' style='background-color: #fff0f0;'>Deshabilitado</td>";
                            } else {
                                text += "<td class='valEstado" + (i + 1) + "' value='3'>No Asignado</td>";
                            }
                            text += '<td><center><div class="btn-group"><button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">';
                            text += 'Accion <span class="caret"></span></button><ul class="dropdown-menu" role="menu">';
                            text += '<li><a class="btnEditar" value=' + (i + 1) + '>Editar</a></li>';
                            if (list[i].estado == 1) {
                                text += '<li><a class="btnDes" value=' + (i + 1) + '>Deshabilitar</a></li>';
                            } else if (list[i].estado == 2) {
                                text += '<li><a class="btnHab" value=' + (i + 1) + '>Habilitar</a></li>';
                            }
                            text += '</ul></div></center></td>';
                            text += "</tr>";
                        }
                        t.append(text);
                        text = "";



                        //----Acciones
                        var id, nombre, ncorto, estado;
                        idDep = $('.inpDep').val();
                        $('.btnEditar').click(function () {
                            valNum = $(this).attr('value');
                            id = $('.valId' + valNum).attr('value');
                            nombre = $('.valNombre' + valNum).text();
                            ncorto = $('.valNCorto' + valNum).text();
                            estado = $('.valEstado' + valNum).attr('value');
                            $('.inpId').val(id);
                            $('.inpNombre').val(nombre);
                            $('.inpNombre').focus();
                            $('.inpNCorto').val(ncorto);
                            $('.inpEstado > option[value=' + estado + ']').attr('selected', 'selected');
                            $('.titulo_t').text('Editar Area');
                            $('.titulo_t').attr('value', '2');
                        });
                        $('.btnDes').click(function () {
                            valNum = $(this).attr('value');
                            id = $('.valId' + valNum).attr('value');
                            desactivar(id, idDep);
                        });
                        $('.btnHab').click(function () {
                            valNum = $(this).attr('value');
                            id = $('.valId' + valNum).attr('value');
                            activar(id, idDep);
                        });
                        $('.btnEliminar').click(function () {
                            valNum = $(this).attr('value');
                            id = $('.valId' + valNum).attr('value');
                            eliminar(id, idDep);
                        });
                        $('.tabla_t').DataTable();
                    });
                }
                $('.btnAceptar').click(function () {
                    $('.form_f').validate({
                        rules: {
                            name: {required: true},
                            name2: {required: true},
                            est:{required: 0},
                            dir: {required: 0},
                            dep: {required: 0}
                        },
                        messages: {
                            name: "Escribir nombre de Area",
                            name2: "Escribir nombre Corto",
                            est: "Seleccione Estado",
                            dir: "Seleccione Direccion",
                            dep: "Seleccione Departamento"
                        },
                        submitHandler: function (form) {
                            var id, nombre, ncorto, estado;
                            id = $('.inpId').val();
                            nombre = $('.inpNombre').val();
                            ncorto = $('.inpNCorto').val();
                            estado = $('.inpEstado').val();
                            if ($('.titulo_t').attr('value') == 1) {
                                crear(nombre, ncorto, estado, idDep);
                            } else if ($('.titulo_t').attr('value') == 2) {
                                editar(id, nombre, ncorto, estado, idDep);
                                $('.titulo_t').text('Agregar Area');
                                $('.titulo_t').attr('value', '1');
                            }
                            $('.inpNombre').val("");
                            $('.inpNCorto').val("");
                        }
                    });

                });
                function desactivar(id, idD) {
                    $.post("../../Puesto", "opc=desactivar_area&id=" + id, function () {
                        cargar_t(idD);
                    });
                }
                function activar(id, idD) {
                    $.post("../../Puesto", "opc=activar_area&id=" + id, function () {
                        cargar_t(idD);
                    });
                }
                function eliminar(id, idD) {
                    $.post("../../Puesto", "opc=eliminar_area&id=" + id, function () {
                        cargar_t(idD);
                    });
                }
                function editar(id, nombre, ncorto, estado, idD) {
                    var data = "opc=editar_area&id=" + id + "&nombre=" + nombre + "&ncorto=" + ncorto + "&estado=" + estado + "&idDep=" + idD;
                    $.post("../../Puesto", data, function () {
                        cargar_t(idD);
                    });
                }
                function crear(nombre, ncorto, estado, idD) {
                    var data = "opc=crear_area&&nombre=" + nombre + "&ncorto=" + ncorto + "&estado=" + estado + "&idDep=" + idD;
                    $.post("../../Puesto", data, function () {
                        cargar_t(idD);
                    });
                }
                function GifLoader(contenedor, msg, action) {
                    $('.headerr').hide();
                    var text = "";
                    contenedor.empty();
                    if (action == 1) {
                        text += "<div class='caja' style='height:250px; width:150px; margin:auto;'><center><h3>" + msg + "</h3></center></div>";
                    } else if (action == 2) {
                        text += "<div style='height:150px; width:150px; margin:auto; padding-top:30px;'><center><h3>" + msg + "</h3></center></div>";
                    }
                    contenedor.append(text);
                }
                function cargar_direccion() {
                    var x = $('.inpDireccion');
                    x.empty();
                    x.append("<option value=''>Cargando..</option>");
                    $.post("../../Puesto", "opc=listar_dir_es", function (objJson) {
                        x.empty();
                        x.append("<option value=''>[Seleccione]</option>");
                        var list = objJson.lista;
                        for (var i = 0; i < list.length; i++) {
                            x.append("<option class='dir" + (i + 1) + "' value=" + list[i].id + ">" + list[i].nombre + "</option>");
                        }
                        GifLoader($('.div_t'), "Seleccione una Direccion", 2);
                    });
                }
                function cargar_dep(idDir) {
                    var x = $('.inpDep');
                    x.empty();
                    x.append("<option value=''>Cargando..</option>");
                    $.post("../../Puesto", "opc=list_dep_es&id=" + idDir, function (objJson) {
                        x.empty();
                        x.append("<option value=''>[Seleccione]</option>");
                        var list = objJson.lista;
                        for (var i = 0; i < list.length; i++) {
                            x.append("<option class='dep" + (i + 1) + "' value=" + list[i].id + ">" + list[i].nombre + "</option>");
                        }
                        GifLoader($('.div_t'), "Seleccione un Departamento", 2);
                    });
                }

            });
        </script>
        
    </body>
</html>
