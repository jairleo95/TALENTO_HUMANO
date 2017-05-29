/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Listar_dep() {
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
function Listar_area() {
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
function Listar_sec() {
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
function Listar_pue() {
    var s = $("#pu_id_se");
    $.post("../../Direccion_Puesto", "opc=Listar_pu_id&" + "id=" + $(".sec_pu").val(), function (objJson) {
        s.empty();
        var lista = objJson.lista;
        s.append("<option value='' > [Seleccione] </option>");
        for (var j = 0; j < lista.length; j++) {

            if ($(".id_pu_dgp").val() == lista[j].id) {
                s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].nombre + "</option>");
            } else {
                s.append("<option value='" + lista[j].id + "'> " + lista[j].nombre + "</option>");
            }
        }
    });
}

function Listar_plantilla() {
    var s = $(".con_pl_pu");

    $.post("../../plantilla_contractual", "opc=List_planti&" + "id_pu=" + $(".id_pu_dgp").val(), function (objJson) {
        s.empty();
        var lista = objJson.lista;
        s.append("<option value='' > [Seleccione] </option>");
        for (var i = 0; i < lista.length; i++) {
            if ($(".id_pl_con").val() == lista[i].id) {
                s.append("<option value='" + lista[i].id + "' selected=''> " + lista[i].nom_pl + "</option>");
            } else {
                s.append("<option value='" + lista[i].id + "'> " + lista[i].nom_pl + "</option>");
            }
        }
    });
}
function listar_sub_mod() {
    var s = $("#select-sub-mod");
    $.post("../../Direccion_Puesto", "opc=Listar_SUB_MO&" + "id=" + $(".id_mod_con").val(), function (objJson) {
        s.empty();
        var lista = objJson.lista;
        s.append("<option value='' > [Seleccione] </option>");
        for (var i = 0; i < lista.length; i++) {
            if ($(".id_sub_mod").val() != null) {
                if ($(".id_sub_mod").val() == lista[i].id) {
                    s.append("<option value='" + lista[i].id + "' selected=''> " + lista[i].nombre + "</option>");
                } else {
                    s.append("<option value='" + lista[i].id + "'> " + lista[i].nombre + "</option>");
                }
            } else {
                s.append("<option value='" + lista[i].id + "'> " + lista[i].nombre + "</option>");
            }
        }
    });
}
function listSelectDirCentroCosto() {
    var cc_dir = $(".cc-dir");
    $.post("../../centro_costo?opc=Listar_dir", function (objJson) {
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (lista[i].id == $(".id_dire").val()) {
                cc_dir.append("<option value='" + lista[i].id + "' selected=''>" + lista[i].nombre + "</option>");
            } else {
                cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
            }
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

$(document).ready(function () {
    $("#ca_bono_pu").numeric();
    $("#remu").numeric();
    $("#rein").numeric();
    $("#bo_a").numeric();
    $("#bev").numeric();
    $("#su_t").numeric();
    $("#asig").numeric();
    pageSetUp();
    $(".btnModificarContrato").click(function () {
        if ($(".formEditawrContrato").valid()) {

            $(".formEditawrContrato").submit();
            $(".btnModificarContrato").attr("disabled", "disabled");
        }

    });
    Listar_pue();
    Listar_dep();
    Listar_sec();
    Listar_area();
    Listar_plantilla();
    listar_sub_mod();
    listSelectDirCentroCosto();
    listCentoCostoByDGP($("#id_dgp").val(),$(".id_contrato").val());
    list_selectJavaBeans($(".ti_contrato"), "../../contrato", "opc=List_ti_contrato", "id_tipo_contrato", "de_ti_contrato", "1", $(".id_ti_contrato").val());
    list_selectJavaBeans($(".situacionEspecial"), "../../situacionEspecial", "opc=list", "idSituacionEspecial", "deSituacionEspecial", "1", $(".situacionEspecial").data("valor"));
    var a = $("#select-sub-mod");
    var c = $("#Selec_Area");
    var d = $("#select_sec");
    var b = $("#selec_dep");
    var e = $("#pu_id_se");
    $(".date").keyup(function () {
        $(".conteni").val($(".date").val());
    });
    // $.post("../../  ")
    $(".select_mod").change(function () {
        // alert("?MODALIDAD="+$("#select_mod").val());
        $.post("../../Direccion_Puesto", "opc=Listar_SUB_MO&id=" + $(".select_mod").val(), function (objJson) {
            a.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var list = objJson.lista;
            a.append("<option value='' > [Seleccione] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    a.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                }
            } else {
                a.append("<option value='' > [no hay] </option>");
            }
        });
    });
    $("#selec_dep").change(function () {
      //  $("#select_dir").val("");
        $("#Selec_Area").val("");
        $("#select_sec").val("");
        $("#pu_id_se").val("");
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
                    c.append("<option value='' > [no hay] </option>");
                }
        });
    });
    $("#select_dir").change(function () {
        $("#Selec_Area").val("");
        $("#select_sec").val("");
        $("#pu_id_se").val("");
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
                b.append("<option value='' > [Sin datos] </option>");
            }
        });
    });
    $("#Selec_Area").change(function () {
        $("#select_sec").val("");
        $("#pu_id_se").val("");
        $.post("../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + $("#Selec_Area").val(), function (objJson) {
            d.empty();
            var list = objJson.lista;
            d.append("<option value='' > [Seleccione] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    d.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                }
            } else {
                d.append("<option value='' > [Sin datos] </option>");
            }
        });

    });
    $("#select_sec").change(function () {
        $("#pu_id_se").val("");
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
                e.append("<option value='' > [Sin datos] </option>");
            }
        });
    });

    $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
        $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
    });
    showEsDiezmo();
    $('.formEditawrContrato').validate({
        // Rules for form validation
        rules: {
            FEC_DESDE: {
                //  val_fecha: true
            },
            FEC_HASTA: {
                // val_fecha: true
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        }
    });



});
