/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
                    t += "<input type='hidden' class='iddcc" + i + "' value='" + lista[i].id_det_cc + "' />";
                    //console.log("id depar cc :" + lista[i].id_det_cc)
                    t += "<td id=" + i + " ><a class='txt-color-blue btnEditar btn btn-default' id=" + lista[i].ID_CENTRO_COSTO + " value=" + lista[i].ID_DIRECCION + " ><i class='glyphicon glyphicon-pencil'></i> Editar</a>";
                    t += "<button type='button' class='txt-color-blue btn btn-default btn_asignar' value='" + i + "'  ><i class='glyphicon glyphicon-pencil'></i> Asginar</button>";
                    t += "<a class='txt-color-redLight btnDel btn btn-default' id=" + lista[i].id_det_cc + " ><i class='glyphicon glyphicon-remove'></i> Eliminar</a></td>";
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
                    $('#icono').addClass('fa fa-check');
                    //  alert($(".form_cc").serialize())
                    $(".btnCancel").show();
                    $('.btnSave').val('3');
                    $(".inccc").val($(".lb_co_cc" + v).text());
                    $(".indcc").val($(".lb_de_cc" + v).text());
                    $(".id_cc").val($(".id_cc" + v).val());
                    $(".iddcc").val($(".iddcc" + v).val());
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
                    $(".id_cc").val($(".id_cc" + valnum).val());
                    $(".iddcc").val($(".iddcc" + valnum).val());
                    $('.inccc').val($('.ccc' + valnum).text());
                    $('.indcc').val($('.dcc' + valnum).text());
                    $('.indir > option[value="' + valdir + '"]').attr("selected", "selected");
                    cargar_dep(valdir, $('.ndep' + valnum).attr('id'));
                    cargar_ar($('.ndep' + valnum).attr('id'), $('.narea' + valnum).attr('id'));
                    cargar_sec($('.narea' + valnum).attr('id'), $('.nseccion' + valnum).attr('id'));
                    $('#icono').removeClass('fa-plus');
                    $('#icono').addClass('fa-check');
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
                            var id_det_cc = $('.iddcc' + valnum).val();
                            $.post("../../MCCosto?opc=del_cc&id_det_cc=" + id_det_cc, function () {
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
                                content: "<i class='fa fa-clock-o'></i> <i>La operación ha sido cancelada</i>",
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
                    var data = "";
                    var ID_CENTRO_COSTO, CO_CENTRO_COSTO, DE_CENTRO_COSTO, ID_DEPARTAMENTO, ID_AREA, ID_SECCION, id_det_cc;
                    ID_CENTRO_COSTO = $('.id_cc').val();
                    id_det_cc = $('.iddcc').val();
                    CO_CENTRO_COSTO = $('.inccc').val();
                    DE_CENTRO_COSTO = $('.indcc').val();
                    ID_DEPARTAMENTO = $('.indep').val();
                    ID_AREA = $('.inarea').val();
                    ID_SECCION = $('.inseccion').val();
                    data += "&ID_CENTRO_COSTO=" + ID_CENTRO_COSTO;
                    data += "&id_det_cc=" + id_det_cc;
                    data += "&CO_CENTRO_COSTO=" + CO_CENTRO_COSTO;
                    data += "&DE_CENTRO_COSTO=" + DE_CENTRO_COSTO;
                    data += "&ID_DEPARTAMENTO=" + ID_DEPARTAMENTO;
                    data += "&ID_AREA=" + ID_AREA;
                    data += "&ID_SECCION=" + ID_SECCION;
                    console.log(ID_CENTRO_COSTO);
                    console.log(id_det_cc);
                    $.post("../../MCCosto?opc=edit_cc", data, function () {
                        cargar_T();
                        $('.inccc').val("");
                        $('.indcc').val("");
                        $('.id_cc').val("");
                        $('.iddcc').val("");
                        cargar_Dir();
                        $('#icono').removeClass('fa-plus');
                        $('#icono').addClass('fa-check');
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
                        content: "<i class='fa fa-clock-o'></i> <i>La operaciÃ³n ha sido Cancelada</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                }

            });
        } else if ($('.btnSave').val() == 3) {
            $.post("../../MCCosto?opc=Asignar_cc", $(".form_cc").serialize() , function () {
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
