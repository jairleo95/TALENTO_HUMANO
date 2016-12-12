/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function listDepartamento() {
    var s = $(".selec_dep");
    $.post("../../Direccion_Puesto", "opc=Listar&" + "id_dir=" + $(".dir_pu").val(), function (objJson) {
        s.empty();
        var lista = objJson.lista;
        s.append("<option value='' > [Seleccione] </option>");
        for (var j = 0; j < lista.length; j++) {
            if ($(".dep_pu").val() == lista[j].id) {
                s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].nombre + "</option>");

            } else {
                s.append("<option value='" + lista[j].id + "'> " + lista[j].nombre + "</option>");
            }
        }
    });
}
function listArea() {
    var s = $(".Selec_Area");

    $.post("../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + $(".dep_pu").val(), function (objJson) {
        s.empty();
        var lista = objJson.lista;
        s.append("<option value='' > [Seleccione] </option>");
        for (var j = 0; j < lista.length; j++) {

            if ($(".area_pu").val() == lista[j].id) {
                s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].nom + "</option>");
            } else {
                s.append("<option value='" + lista[j].id + "'> " + lista[j].nom + "</option>");
            }
        }

    });
}
function listSeccion() {
    var s = $("#select_sec");

    $.post("../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + $(".area_pu").val(), function (objJson) {
        s.empty();
        var lista = objJson.lista;
        s.append("<option value='' > [Seleccione] </option>");
        for (var j = 0; j < lista.length; j++) {

            if ($(".sec_pu").val() == lista[j].id) {
                s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].nom + "</option>");
            } else {
                s.append("<option value='" + lista[j].id + "'> " + lista[j].nom + "</option>");
            }
        }
    });
}
function listPlantilla() {
    var s = $(".con_pl_pu");
    $.post("../../plantilla_contractual", "opc=List_planti&" + "id_pu=" + $(".id_pu_dgp").val(), function (objJson) {
        s.empty();
        var lista = objJson.lista;
        s.append("<option value='' > [Seleccione] </option>");
        for (var i = 0; i < lista.length; i++) {
            s.append("<option value='" + lista[i].id + "'> " + lista[i].nom_pl + "</option>");
        }
    });
}
function showEsDiezmo() {
    var obj = $(".div_input_diezmo");
    obj.hide(100);
    obj.empty();
    $.ajax({
        url: "../../trabajador", data: "opc=ShowEsDiezmoTrabajador&id=" + $(".idtr").val(), type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.rpta) {
                obj.append(data.html);
                obj.show(100);
                $(".cbkDiezmo").click(function () {
                    $.SmartMessageBox({
                        title: "&iexcl;Alerta!",
                        content: "Esta seguro de modificar la autorizaci&oacute;n de descuento diezmo?",
                        buttons: '[No][Si]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Si") {
                            if ($(".cbkDiezmo").prop("checked")) {
                                $.ajax({
                                    url: "../../trabajador", data: "opc=UpdateEsDiezmo&id=" + $(".idtr").val() + "&estado=0", type: 'POST', success: function (data, textStatus, jqXHR) {
                                        if (data.status) {
                                            $(".cbkDiezmo").prop("checked", false);
                                            $.smallBox({
                                                title: "&iexcl;Atenci&oacute;n!",
                                                content: "<i class='fa fa-clock-o'></i> <i>Se neg&oacute; el descuento de diezmo...</i>",
                                                color: "#C46A69",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 6000
                                            });
                                        }

                                    }
                                });
                            } else {
                                $.ajax({
                                    url: "../../trabajador", data: "opc=UpdateEsDiezmo&id=" + $(".idtr").val() + "&estado=1", type: 'POST', success: function (data, textStatus, jqXHR) {
                                        if (data.status) {
                                            $(".cbkDiezmo").prop("checked", true);
                                            $.smallBox({
                                                title: "&iexcl;Atenci&oacute;n!",
                                                content: "<i class='fa fa-clock-o'></i> <i>Se autoriz&oacute; el descuento de diezmo...</i>",
                                                color: "#659265",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 6000
                                            });
                                        }
                                    }
                                });
                            }
                            showEsDiezmo();


                        }
                    });
                    return false;


                });
            }
        }
    });
}
function c() {
    var max = $("#ifechai").val();
    $("#suscripcion").attr("max", max);
    $("#suscripcion").attr("value", max);
}
$(document).ready(function () {

    pageSetUp();
    $("#ca_bono_pu").numeric();
    $("#remu").numeric();
    $("#rein").numeric();
    $("#bo_a").numeric();
    $("#bev").numeric();
    $("#su_t").numeric();
    $("#asig").numeric();

    $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
        $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>");
    });
    listCentoCostoByDGP($("#id_dgp").val());
    showEsDiezmo();
    list_selectJavaBeans($(".ti_contrato"), "../../contrato", "opc=List_ti_contrato", "id_tipo_contrato", "de_ti_contrato");

    $('#checkout-form').validate();

    listDepartamento();
    listSeccion();
    listArea();
    listPlantilla();
    list_selectJavaBeans($(".situacionEspecial"), "../../situacionEspecial", "opc=list", "idSituacionEspecial", "deSituacionEspecial");

    var a = $("#select-sub-mod");
    var c = $("#Selec_Area");
    var d = $("#select_sec");
    var b = $("#selec_dep");
    var e = $("#pu_id_se");
    var f = $(".select_dir");
    c.attr("disabled", true);
    d.attr("disabled", true);
    b.attr("disabled", true);
    e.attr("disabled", true);
    f.attr("disabled", true);
    $(".date").keyup(function () {
        $(".conteni").val($(".date").val());
    });
    $("#select_mod").change(function () {
        $.post("../../ajax/Ajax_Reg_Contrato/Ajax_Reg_Contrato.jsp?opc=submodalidad&" + "MODALIDAD=" + $("#select_mod").val(), function (objJson) {
            a.empty();
            var list = objJson.lista;
            a.append("<option value='' > [Seleccione] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    a.append('<option value="' + list[i].id_submodalidad + '">' + list[i].de_submod + '</option>');
                }
            }
        });
    });
    $("#selec_dep").change(function () {
        $.post("../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + $("#selec_dep").val(), function (objJson) {
            c.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var list = objJson.lista;
            c.append("<option value='' > [Seleccione] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    c.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                }
            } else {
                c.append("<option value='' > [Sin Datos] </option>");
            }
        });
    });
    $("#select_dir").change(function () {
        $.post("../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + $("#select_dir").val(), function (objJson) {
            b.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var list = objJson.lista;
            b.append("<option value='' > [Seleccione] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    b.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                }
            } else {
                b.append("<option value='' > [Sin Datos] </option>");
            }
        });
    });
    $("#Selec_Area").change(function () {
        $.post("../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + $("#Selec_Area").val(), function (objJson) {
            d.empty();

            var list = objJson.lista;
            d.append("<option value='' > [Seleccione] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    d.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                }
            } else {
                d.append("<option value='' > [Sin Datos] </option>");
            }
        });
    });
    $("#select_sec").change(function () {
        $.post("../../Direccion_Puesto", "opc=Listar_pu_id&" + "id=" + $("#select_sec").val(), function (objJson) {
            e.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var list = objJson.lista;
            e.append("<option value='' > [Seleccione] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    e.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                }
            } else {
                e.empty();
                e.append("<option value='' > [Sin Datos] </option>");
            }
        });
    });
    $("#btn-registrar").click(function () {
        var pr = $("#select-proceso").val();
        $.post("../../paso", $("#form-paso").serialize(), function () {
            Listar_Paso(pr);
        });
        $("#btn-registrar").val("Registrar Paso");
        $(".opc").val("Registrar");
        $("#form-paso")[0].reset();

        return false;
    });

});