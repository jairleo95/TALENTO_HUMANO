<%-- 
    Document   : MantCCosto
    Created on : 19/05/2015, 09:55:03 AM
    Author     : Andres
--%>


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
                <form class="smart-form form_cc">
                    <section class="col-xs-10">
                        <div class="row">
                            <section class="col col-sm-6" >
                                <label class="label">Codigo</label>
                                <label class="input">
                                    <input class="inccc" type="text" name="codigo" placeholder="Ingesar Codigo" maxlength="8">
                                </label>
                            </section>
                            <section class="col col-sm-6">
                                <label class="label">Detalle</label>
                                <label class="input">
                                    <input class="indcc" type="text" name="detalle" placeholder="Detalle Centro Costo" maxlength="200">
                                </label>
                            </section>
                        </div>
                        <div class="row">
                            <section class="col col-sm-3">
                                <label class="label">Direccion</label>
                                <label class="select">
                                    <select class="indir" name=dir"">
                                        <option value="">[Seleccione]</option>
                                    </select>
                                </label>
                            </section>
                            <section class="col col-sm-3">
                                <label class="label">Departmento</label>
                                <label class="select">
                                    <select class="indep" name="dep">
                                        <option value="">[Seleccione]</option>
                                    </select>
                                </label>
                            </section>
                            <section class="col col-sm-3">
                                <label class="label">Area</label>
                                <label class="select">
                                    <select class="inarea" name="area">
                                        <option value="">[Seleccione]</option>
                                    </select>
                                </label>
                            </section>
                            <section class="col col-sm-3">
                                <label class="label">Seccion</label>
                                <label class="select">
                                    <select class="inseccion" name="seccion">
                                        <option value="">[Seleccione]</option>
                                    </select>
                                    <input type="hidden" name="id_cc" class="id_cc" />
                                </label>
                            </section>
                        </div>
                    </section>
                    <section class="col-md-2">
                        <section class="col col-xs-12">
                            <center>
                                <button class="btn btn-primary btn-xl btn-circle btnSave" type="button" style="margin-top: 13%" value="1"><i id="icono" class="glyphicon glyphicon-ok"></i></button> 
                                <button class="btn btn-danger btn-xl btn-circle btnCancel" type="button" style="margin-top: 13%; display:none" value="1"><i id="icono" class="glyphicon glyphicon-remove"></i></button> 
                            </center>
                        </section>

                    </section>


                </form>
            </div>
        </div>
        <div class="well">
            <div class="row">
                <div class="table-responsive cont_t">
                    <table class="table table-bordered table-striped table-responsive tabla_t">
                        <thead>
                            <tr>
                                <td class="text-center semi-bold" width="4%">Nro</td>
                                <td class="text-center semi-bold">Codigo</td>
                                <td class="text-center semi-bold">Detalle</td>
                                <td class="text-center semi-bold">Departamento</td>
                                <td class="text-center semi-bold">Area</td>
                                <td class="text-center semi-bold" width="12%">Acciones</td>
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
                var valnum, valdir;
                $('.tabla_t').DataTable();
                cargar_Dir();
                cargar_T();
                function cargar_Dir() {
                    $('.indir').empty();
                    $('.indir').append("<option>[Espere..]</option>");
                    $.post("../../MCCosto?opc=list_dir", function (objJson) {
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            $('.indir').empty();
                            $('.indir').append("<option value=''>[Seleccione]</option>");
                            for (var i = 0; i < lista.length; i++) {
                                $('.indir').append("<option value=" + lista[i].id + ">" + lista[i].nombre + "</option>");
                            }
                        }
                        $('.indep').empty();
                        $('.indep').append("<option value=''>[Seleccionar Direccion]</option>");
                        $('.inarea').empty();
                        $('.inarea').append("<option value=''>[Seleccionar Departamento]</option>");
                        $('.inseccion').empty();
                        $('.inseccion').append("<option value=''>[Seleccionar Area]</option>");
                        $('.indir').change(function () {
                            var id = $(this).val();
                            $('.indep').empty();
                            $('.indep').append("<option value=''>[Espere..]</option>");
                            $('.inarea').empty();
                            $('.inarea').append("<option value=''>[Seleccionar Departamento]</option>");
                            cargar_dep(id);
                        });

                    });
                }
                function cargar_dep(id, selec) {
                    var sel = "";
                    if (selec != undefined) {
                        sel = selec;
                    }
                    $.post("../../MCCosto?opc=list_dep&id=" + id, function (objJson) {
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            $('.indep').empty();
                            $('.indep').append("<option value=''>[Seleccione]</option>");
                            for (var i = 0; i < lista.length; i++) {
                                $('.indep').append("<option value=" + lista[i].id + ">" + lista[i].nombre + "</option>");
                            }
                        }
                        $('.indep').change(function () {
                            var idep = $(this).val();
                            $('.inarea').empty();
                            $('.inarea').append("<option value=''>[Espere..]</option>");
                            cargar_ar(idep);
                        });
                        $('.indep > option[value="' + sel + '"]').attr("selected", "selected");
                    });
                }
                function cargar_ar(id, selec) {
                    var sel = "";
                    if (selec != undefined) {
                        sel = selec;
                    }
                    $.post("../../MCCosto?opc=list_ar&id=" + id, function (objJson) {
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            $('.inarea').empty();
                            $('.inarea').append("<option value=''>[Seleccione]</option>");
                            for (var i = 0; i < lista.length; i++) {
                                $('.inarea').append("<option value=" + lista[i].id + ">" + lista[i].nombre + "</option>");
                            }
                        }
                        $('.inarea').change(function () {
                            var iar = $(this).val();
                            $('.inseccion').empty();
                            $('.inseccion').append("<option value=''>[Espere..]</option>");
                            cargar_sec(iar);
                        });
                        $('.inarea > option[value="' + sel + '"]').attr("selected", "selected");
                    });

                }
                function cargar_sec(id, selec) {
                    var sel = "";
                    if (selec != undefined) {
                        sel = selec;
                    }
                    if (id !== undefined) {
                        $.post("../../MCCosto?opc=list_se&id=" + id, function (objJson) {
                            var lista = objJson.lista;
                            if (lista.length > 0) {
                                $('.inseccion').empty();
                                $('.inseccion').append("<option value=''>[Seleccione]</option>");
                                for (var i = 0; i < lista.length; i++) {
                                    $('.inseccion').append("<option value=" + lista[i].id + ">" + lista[i].nombre + "</option>");
                                }
                            }
                            $('.inseccion > option[value="' + sel + '"]').attr("selected", "selected");
                        });
                    } else {
                        $('.inseccion').empty();
                        $('.inseccion').append("<option value=''>[Seleccione]</option>");
                    }

                }

                function cargar_T(id) {
                    var url = "";
                    if (id != null) {
                        url = "../../MCCosto?opc=list_ccosto&id=" + id;
                    } else {
                        url = "../../MCCosto?opc=list_ccosto";
                    }
                    $.post(url, function (objJson) {
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            var t = "";
                            for (var i = 0; i < lista.length; i++) {
                                t += "<tr>";
                                t += "<td>" + (i + 1) + "</td>";
                                t += "<td class='ccc" + i + "' id=" + lista[i].ID_CENTRO_COSTO + "><label class='lb_co_cc" + i + "'>" + lista[i].CO_CENTRO_COSTO + "</label></td>";
                                t += "<td class='dcc" + i + "'><label class='lb_de_cc" + i + "'>" + lista[i].DE_CENTRO_COSTO + "</label></td>";
                                if (lista[i].NO_DEP != undefined) {
                                    t += "<td class='ndep" + i + "' id=" + lista[i].ID_DEPARTAMENTO + ">" + lista[i].NO_DEP + "</td>";
                                } else {
                                    t += "<td class='ndep" + i + "' style='background-color : #d6dde7'>Sin Asignar</td>";
                                }
                                if (lista[i].NO_AREA != undefined) {
                                    t += "<td class='narea" + i + "' id=" + lista[i].ID_AREA + ">" + lista[i].NO_AREA + "</td>";
                                } else {
                                    t += "<td class='narea" + i + "' style='background-color : #d6dde7'>Sin Asignar</td>";
                                }
                                if (lista[i].NO_SECCION != undefined) {
                                    t += "<td class='nseccion" + i + "' id=" + lista[i].ID_SECCION + ">" + lista[i].NO_SECCION + "</td>";
                                } else {
                                    t += "<td class='nseccion" + i + "' style='background-color : #d6dde7'>Sin Asignar</td>";
                                }
                                t += "<input type='hidden' class='id_cc" + i + "' value='" + lista[i].ID_CENTRO_COSTO + "' />";
                                t += "<td id=" + i + " ><a class='txt-color-blue btnEditar btn btn-default' id=" + lista[i].ID_CENTRO_COSTO + " value=" + lista[i].ID_DIRECCION + " ><i class='glyphicon glyphicon-pencil'></i> Editar</a>";
                                t += "<button type='button' class='txt-color-blue btn btn-default btn_asignar' value='" + i + "'  ><i class='glyphicon glyphicon-pencil'></i> Asginar</button>";
                                t += "<a class='txt-color-redLight btnDel btn btn-default' id=" + lista[i].ID_CENTRO_COSTO + " ><i class='glyphicon glyphicon-remove'></i> Eliminar</a></td>";
                                t += "</tr>";
                            }
                            crear_T();
                            $('.tbodys').append(t);

                            $(".btn_asignar").click(function () {
                                var v = $(this).val();
                                $(".form_cc").hide();
                                $(".form_cc").show('slow');
                                $(".inccc").attr("readonly", "readonly");
                                $(".indcc").attr("readonly", "readonly");
                                $('#icono').removeClass('glyphicon-ok');
                                $('#icono').addClass('fa fa-plus');
                                //  alert($(".form_cc").serialize())
                                $(".btnCancel").show();
                                $('.btnSave').val('3');
                                $(".inccc").val($(".lb_co_cc" + v).text());
                                $(".indcc").val($(".lb_de_cc" + v).text());
                                $(".id_cc").val($(".id_cc" + v).val());
                                cargar_T($(".id_cc" + v).val());
                            });

                            $(".btnCancel").click(function () {
                                $(".form_cc").hide();
                                $(".form_cc")[0].reset();
                                $(".form_cc").show('slow');
                                $(".btnCancel").hide();
                                $(".inccc").removeAttr("readonly");
                                $(".indcc").removeAttr("readonly");
                                $('#icono').removeClass('glyphicon-pencil');
                                $('#icono').addClass('glyphicon-ok');
                                cargar_T();
                                $('.btnSave').val('1');
                            });
                            $('.btnEditar').click(function () {

                                $(".inccc").removeAttr("readonly");
                                $(".indcc").removeAttr("readonly");
                                valdir = $(this).attr('value');
                                valnum = $(this).parent().attr('id');
                                $('.inccc').val($('.ccc' + valnum).text());
                                $('.indcc').val($('.dcc' + valnum).text());
                                $('.indir > option[value="' + valdir + '"]').attr("selected", "selected");
                                cargar_dep(valdir, $('.ndep' + valnum).attr('id'));
                                cargar_ar($('.ndep' + valnum).attr('id'), $('.narea' + valnum).attr('id'));
                                cargar_sec($('.narea' + valnum).attr('id'), $('.nseccion' + valnum).attr('id'));
                                $('#icono').removeClass('glyphicon-ok');
                                $('#icono').addClass('glyphicon-pencil');
                                $('.btnSave').val('2');
                            });
                            $('.btnDel').click(function () {
                                valnum = $(this).parent().attr('id');
                                $.SmartMessageBox({
                                    title: "Eliminar Centro de Costo",
                                    content: "¿Esta seguro de Eliminar este Centro de Costo?",
                                    buttons: '[No][Si]'
                                }, function (ButtonPressed) {
                                    if (ButtonPressed === "Si") {
                                        var ID_CENTRO_COSTO = $('.ccc' + valnum).attr('id');
                                        $.post("../../MCCosto?opc=del_cc&ID_CENTRO_COSTO=" + ID_CENTRO_COSTO, function () {
                                            cargar_T();
                                            $.smallBox({
                                                title: "Eliminar Centro de Costo",
                                                content: "<i class='fa fa-clock-o'></i> <i>Eliminado correctamente</i>",
                                                color: "#659265",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 4000
                                            });
                                        });
                                    }
                                    if (ButtonPressed === "No") {
                                        $.smallBox({
                                            title: "Eliminar Centro de Costo",
                                            content: "<i class='fa fa-clock-o'></i> <i>La operación ha sido Cancelada</i>",
                                            color: "#C46A69",
                                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                            timeout: 4000
                                        });
                                    }

                                });
                            });
                            $('.tabla_t').DataTable();
                        }

                    });
                }
                $('.btnSave').click(function () {
                    if ($('.btnSave').val() == 1) {
                        $.SmartMessageBox({
                            title: "Crear Centro de Costo",
                            content: "¿Esta seguro de crear un nuevo Centro de Costo?",
                            buttons: '[No][Si]'
                        }, function (ButtonPressed) {
                            if (ButtonPressed === "Si") {

                                var CO_CENTRO_COSTO, DE_CENTRO_COSTO, ID_DEPARTAMENTO, ID_AREA, ID_SECCION, data;
                                CO_CENTRO_COSTO = $('.inccc').val();
                                DE_CENTRO_COSTO = $('.indcc').val();
                                ID_DEPARTAMENTO = $('.indep').val();
                                ID_AREA = $('.inarea').val();
                                ID_SECCION = $('.inseccion').val();
                                data = "&CO_CENTRO_COSTO=" + CO_CENTRO_COSTO;
                                data += "&DE_CENTRO_COSTO=" + DE_CENTRO_COSTO;
                                data += "&ID_DEPARTAMENTO=" + ID_DEPARTAMENTO;
                                data += "&ID_AREA=" + ID_AREA;
                                data += "&ID_SECCION=" + ID_SECCION;
                                $.post("../../MCCosto?opc=add_cc", data, function () {
                                    cargar_T();
                                    $('.inccc').val("");
                                    $('.indcc').val("");

                                    $.smallBox({
                                        title: "Crear Centro de Costo",
                                        content: "<i class='fa fa-clock-o'></i> <i>Guardado correctamente</i>",
                                        color: "#659265",
                                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                        timeout: 4000
                                    });
                                });
                            }
                            if (ButtonPressed === "No") {
                                $.smallBox({
                                    title: "Crear Centro de Costo",
                                    content: "<i class='fa fa-clock-o'></i> <i>La operación ha sido Cancelada</i>",
                                    color: "#C46A69",
                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                    timeout: 4000
                                });
                            }

                        });
                    } else if ($('.btnSave').val() == 2) {
                        $.SmartMessageBox({
                            title: "Editar Centro de Costo",
                            content: "¿Esta seguro de guardar los cambios?",
                            buttons: '[No][Si]'
                        }, function (ButtonPressed) {
                            if (ButtonPressed === "Si") {
                                var ID_CENTRO_COSTO, CO_CENTRO_COSTO, DE_CENTRO_COSTO, ID_DEPARTAMENTO, ID_AREA, ID_SECCION, data;
                                ID_CENTRO_COSTO = $('.ccc' + valnum).attr('id');
                                CO_CENTRO_COSTO = $('.inccc').val();
                                DE_CENTRO_COSTO = $('.indcc').val();
                                ID_DEPARTAMENTO = $('.indep').val();
                                ID_AREA = $('.inarea').val();
                                ID_SECCION = $('.inseccion').val();
                                data = "ID_CENTRO_COSTO=" + ID_CENTRO_COSTO;
                                data += "&CO_CENTRO_COSTO=" + CO_CENTRO_COSTO;
                                data += "&DE_CENTRO_COSTO=" + DE_CENTRO_COSTO;
                                data += "&ID_DEPARTAMENTO=" + ID_DEPARTAMENTO;
                                data += "&ID_AREA=" + ID_AREA;
                                data += "&ID_SECCION=" + ID_SECCION;
                                alert(ID_CENTRO_COSTO);
                                $.post("../../MCCosto?opc=edit_cc", data, function () {
                                    cargar_T();
                                    $('.inccc').val("");
                                    $('.indcc').val("");
                                    cargar_Dir();
                                    $('#icono').removeClass('glyphicon-pencil');
                                    $('#icono').addClass('glyphicon-ok');
                                    $('.btnSave').val('1');
                                    $.smallBox({
                                        title: "Editar Centro de Costo",
                                        content: "<i class='fa fa-clock-o'></i> <i>Guardado correctamente</i>",
                                        color: "#659265",
                                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                        timeout: 4000
                                    });
                                });

                            }
                            if (ButtonPressed === "No") {
                                $.smallBox({
                                    title: "Editar Centro de Costo",
                                    content: "<i class='fa fa-clock-o'></i> <i>La operación ha sido Cancelada</i>",
                                    color: "#C46A69",
                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                    timeout: 4000
                                });
                            }

                        });
                    } else if ($('.btnSave').val() == 3) {
                        $.post("../../MCCosto?opc=Asignar_cc", $(".form_cc").serialize() + "&id_cc=" + $(this).val(), function () {
                            cargar_T($(".id_cc").val());
                        });

                    }
                });
                function crear_T() {
                    var t = '<table class="table table-bordered table-striped table-responsive tabla_t">';
                    t += ' <thead>';
                    t += '   <tr>';
                    t += '         <td class="text-center semi-bold" width="4%">Nro</td>';
                    t += '         <td class="text-center semi-bold">Codigo</td>';
                    t += '         <td class="text-center semi-bold">Detalle</td>';
                    t += '         <td class="text-center semi-bold">Departamento</td>';
                    t += '         <td class="text-center semi-bold">Area</td>';
                    t += '         <td class="text-center semi-bold">Seccion</td>';
                    t += '         <td class="text-center semi-bold" width="12%">Acciones</td>';
                    t += '     </tr>';
                    t += ' </thead>';
                    t += ' <tbody class="tbodys"></tbody>';
                    t += '</table>';
                    $('.cont_t').empty();
                    $('.cont_t').append(t);
                }
                function barra_acciones() {
                    var t = '';
                }
            });
        </script>
    </body>
</html>
