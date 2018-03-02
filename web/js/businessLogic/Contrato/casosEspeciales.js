/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




function mostrar() {
    $(".texto-h").mask("99:99", {placeholder: "X"});
    $(".cont_lun").hide();
    $(".cont_mar").hide();
    $(".cont_mie").hide();
    $(".cont_jue").hide();
    $(".cont_vie").hide();
    $(".cont_sab").hide();
    $(".cont_dom").hide();
    $("#select_lun").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_lun").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_lun").hide();
                    $("#show_lun input").val("");
                }
            }
    );
    $("#select_mar").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_mar").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_mar").hide();
                    $("#show_mar input").val("");
                }
            }
    );
    $("#select_mie").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_mie").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_mie").hide();
                    $("#show_mie input").val("00:00");
                }
            }
    );
    $("#select_jue").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_jue").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_jue").hide();
                    $("#show_jue input").val("");
                }
            }
    );
    $("#select_vie").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_vie").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_vie").hide();
                    $("#show_vie input").val("");
                }
            }
    );
    $("#select_sab").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_sab").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_sab").hide();
                    $("#show_sab input").val("");
                }
            }
    );
    $("#select_dom").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_dom").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_dom").hide();
                    $("#show_dom input").val("");
                }
            }
    );
}
//MARTES
$(function () {
    var scntDiv = $('#show_mar');
    var i = $('#show_mar .texto-h').size() + 1;
    var s = $('#show_mar .tr-count_2').size() + 1;
    $('#add_2').click(function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mar' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mar' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mar' + i + '" value="mar" ><input type="hidden" name="USER_CREACION_mar' + i + '"> <a href="#" id="remove_2">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('.remove_2').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
//MIERCOLES
$(function () {
    var scntDiv = $('#show_mie');
    var i = $('#show_mie .texto-h').size() + 1;
    var s = $('#show_mie .tr-count_3').size() + 1;
    $('#add_3').click(function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mie' + i + '" value="mie" ><input type="hidden" name="USER_CREACION_mie' + i + '"> <a href="#" id="remove_3">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('.remove_3').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
//JUEVES
$(function () {
    var scntDiv = $('#show_jue');
    var i = $('#show_jue .texto-h').size() + 1;
    var s = $('#show_jue .tr-count_4').size() + 1;
    $('#add_4').click(function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_jue' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_jue' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_jue' + i + '" value="jue" ><input type="hidden" name="USER_CREACION_jue' + i + '"> <a href="#" id="remove_4">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('.remove_4').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
//VIERNES
$(function () {
    var scntDiv = $('#show_vie');
    var i = $('#show_vie .texto-h').size() + 1;
    var s = $('#show_vie .tr-count_5').size() + 1;
    $('#add_5').click(function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_vie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_vie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_vie' + i + '" value="vie" ><input type="hidden" name="USER_CREACION_vie' + i + '"> <a href="#" id="remove_5">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('.remove_5').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
//DOMINGO
$(function () {
    var scntDiv = $('#show_sab');
    var i = $('#show_sab .texto-h').size() + 1;
    var s = $('#show_sab .tr-count_6').size() + 1;
    $('#add_6').click(function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_dom' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_dom' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_dom' + i + '" value="dom" ><input type="hidden" name="USER_CREACION_dom' + i + '"> <a href="#" id="remove_6">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('.remove_6').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
function mflcheck(cb) {
    if (cb.checked == true) {
        $("#cb").val('1')
        $(".centro-costo_1").hide();
        $(".cc-dir").removeAttr('required');
        $(".cc-dep").removeAttr('required');
        $(".centro_costo").removeAttr('required');
    } else {
        $("#cb").val('0')
        $(".centro-costo_1").show();
        $(".cc-dir").attr("required", "required");
        $(".cc-dep").attr("required", "required");
        $(".centro_costo").attr('required', "required");
    }
}

function Listar_Direccion() {
    var cc_dir = $(".cc-dir");
    $.post("../../centro_costo?opc=Listar_dir", function (objJson) {
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
        }
    });
}
$(".cc-dir").change(function () {
    var id_dir = $(".cc-dir").val();
    //alert(id_dir);
    Listar_Departamento(id_dir);
});
function Listar_Departamento(id_dir) {
    var cc_dep = $(".cc-dep");
    $.post("../../centro_costo?opc=Listar_dep", "&id_dir=" + id_dir, function (objJson) {
        cc_dep.empty();
        cc_dep.append("<option value=''>[DEPARTAMENTO]</option>");
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        // alert(lista.length)
        for (var i = 0; i < lista.length; i++) {
            cc_dep.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
        }
    });
}
$(".cc-dep").change(function () {
    var id_dep = $(".cc-dep").val();
    //alert(id_dir);
    Listar_Centro_Costo(id_dep);
});
function Listar_Centro_Costo(id_dep) {
    var centro_costo = $(".centro_costo");
    $.post("../../centro_costo?opc=Listar_CC", "&id_dep=" + id_dep, function (objJson) {
        centro_costo.empty();
        centro_costo.append("<option value=''>[CENTRO COSTO]</option>");
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
        }
    });
}
// DO NOT REMOVE : GLOBAL FUNCTIONS!
function VAL_COD_APS() {
    if ($("#cod_ap").val() != "") {
        var co_aps = document.getElementById("cod_ap");
        $.ajax({
            url: "../../empleado",
            type: "POST",
            data: "opc=validar_aps&co_aps=" + co_aps.value, success: function (data, textStatus, jqXHR) {

                //alert(e);
                var cant = ($("#cod_ap").val());
                if (cant.length > 5) {
                    if (data.aps === 0) {
                        //window.location.href = "";
                    } else {
                        $.SmartMessageBox({
                            title: "Este Código APS ya fue registrado!",
                            content: "Por favor Ingrese un Código APS distinto",
                        });
                    }
                }
            }
        }).done(function (e) {
        }).fail(function (e) {
            alert("Error: " + e);
        });
    }
}
function VAL_COD_HUELLA() {

    if ($("#cod_hu").val() != "") {
        var co_huel = document.getElementById("cod_hu");
        $.ajax({
            url: "../../empleado",
            type: "POST",
            data: "opc=validar_huella&co_hue=" + co_huel.value, success: function (data, textStatus, jqXHR) {

                // alert(e)
                var cant = $("#cod_hu").val();
                if (cant.length > 5) {
                    if (data.huella === 0) {
                        //window.location.href = "";
                    } else {
                        $.SmartMessageBox({
                            title: "Este Código de Huella ya fue registrado!",
                            content: "Por favor Ingrese un Codigo de Huella distinto",
                        });
                    }
                }
            }
        }).done(function (e) {
        });
    }
}
function Listar_plantilla2() {
    var s = $(".con_pl_pu");

    $.post("../../plantilla_contractual", "opc=List_planti&" + "id_pu=" + $(".id_pu_dgp").val(), function (objJson) {
        s.empty();
        var lista = objJson.lista;
        s.append("<option value='' > [SELECCIONE] </option>");
        for (var i = 0; i < lista.length; i++) {
            s.append("<option value='" + lista[i].id + "'> " + lista[i].nom_pl + "</option>");
        }
    });
}
function Sueldo_Total() {
    var a = parseFloat($("#remu").val());
    var e = parseFloat($("#rein").val());
    var b = parseFloat($("#bono_al").val());
    var c = parseFloat($("#bev").val());
    var d = parseFloat($("#bo_puesto").val());
    var x = a + b + c + d + e;
    $("#sueldo_total").val(x);
}
function calcularHoras() {
    var dias_semana = new Array("lun", "mar", "mie", "jue", "vie", "sab", "dom");
    var acum = 0;
    for (var i = 0; i < dias_semana.length; i++) {

        for (var j = 0, max = 5; j < max; j++) {
            var horaTurno = 0;
            //var str = $("#HORA_DESDE_" + dias_semana[i] + j).val();

            var Desde = $(".HORA_DESDE_" + dias_semana[i] + (j + 1)).val();
            var Hasta = $(".HORA_HASTA_" + dias_semana[i] + (j + 1)).val();
            if ($(".HORA_DESDE_" + dias_semana[i] + (j + 1)).val() == null) {
                Desde = "00:00";
                Hasta = "00:00";
            }
            //  var arrDesde = $(str).val().split(":");
            //if (typeof Desde !== 'undefined' && typeof Hasta !== 'undefined') {
            var arrDesde = Desde.split(":");
            var arrHasta = Hasta.split(":");
            horaTurno = (((parseInt(arrHasta[0]) * 60) + (parseInt(arrHasta[1]))) - ((parseInt(arrDesde[0]) * 60) + (parseInt(arrDesde[1]))));
            // alert(horaTurno + Desde + ".HORA_DESDE_" + dias_semana[i] + (j + 1));

            acum = acum + horaTurno;
            // }
        }
    }
    var minutos_totales = acum;
    acum = acum / 60;
    var min = ((acum - parseInt(acum)) * 60);
    min = parseInt(min.toPrecision(2));
    $(".h_total").text("Hora Semanal Total : " + parseInt(acum) + ":" + min + " Horas.");
    $(".h_total").val(acum);
    if (minutos_totales > 2880) {

    }
}
function listar_dep_cc(x, opc, arr_cc) {

    var cc_dep = $(".cc-dep" + x);
    $.post("../../centro_costo?opc=Listar_dep", "&id_dir=" + $(".cc-dir" + x).val(), function (objJson) {

        cc_dep.empty();
        cc_dep.append("<option value=''>[DEPARTAMENTO]</option>");
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (opc == "1") {
                if (arr_cc[1] == lista[i].id) {
                    cc_dep.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                    (x, opc, arr_cc);
                } else {
                    cc_dep.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                }
            } else {
                cc_dep.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
            }

        }
    });
}
function listar_centro_costo(x, opc, arr_cc) {

    var centro_costo = $(".centro_costo" + x);
    $.post("../../centro_costo?opc=Listar_CC", "&id_dep=" + $(".cc-dep" + x).val(), function (objJson) {
        centro_costo.empty();
        centro_costo.append("<option value=''>[CENTRO COSTO]</option>");
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {


            if (opc == "1") {
                if (arr_cc[4] == lista[i].id) {
                    centro_costo.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                } else {
                    centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                }
            } else {
                centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
            }

        }
    });
}

function listar_cc(num, opc, arr_cc) {
    var select_cc = $(".select-cc");
    $.post("../../centro_costo?opc=Listar_cc", function (objJson) {
        //  select_cc.empty();
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            select_cc.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
        }

    });
    var cc_dir = $(".cc-dir" + num);
    $.post("../../centro_costo?opc=Listar_dir", function (objJson) {
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (opc == "1") {
                if (arr_cc[0] == lista[i].id) {
                    cc_dir.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                    listar_dep_cc(num, opc, arr_cc);
                } else {
                    cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                }
            } else {
                cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
            }
        }
    });
    $(".cc-dir" + num).change(function () {

        listar_dep_cc(num, "0", arr_cc);
    });
    $(".cc-dep" + num).change(function () {

        listar_centro_costo(num, "0", arr_cc);
    });
    $(".remover" + num).click(function () {
        $(".centro-costo_" + num).remove();
        sumn_porcen_total();
    });
}
function sumn_porcen_total() {

    var acum = 0;
    $.each($(".porcentaje_cc"), function () {
        acum = acum + parseFloat($(this).val());
    });
    $(".total_porcentaje").val(acum);
}
function list_horario(valor) {
    if (valor == 0) {
        $(".cont_lun").hide();
        $(".cont_mar").hide();
        $(".cont_mie").hide();
        $(".cont_jue").hide();
        $(".cont_vie").hide();
        $(".cont_sab").hide();
        $(".cont_dom").hide();
        $("#select_lun").val(2);
        $("#select_mar").val(2);
        $("#select_mie").val(2);
        $("#select_jue").val(2);
        $("#select_vie").val(2);
        $("#select_sab").val(2);
        $("#select_dom").val(2);
    } else {
        var dias_semana = new Array("lun", "mar", "mie", "jue", "vie", "sab", "dom");
        $(".tr-dia").remove();
        $.post("../../formato_horario", "opc=Listar_Horario&id=" + valor, function (objJson) {
            var lista = objJson.lista;
            for (var f = 0; f < dias_semana.length; f++) {

                var d = 0;
                for (var i = 0; i < lista.length; i++) {

                    if (dias_semana[f] == lista[i].dia) {
                        var scntDiv = $('#show_' + dias_semana[f]);
                        $(".cont_" + dias_semana[f]).show();
                        $("#select_" + dias_semana[f]).val(1);
                        $('<tr class="tr-dia" ><td>T' + (d + 1) + ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + dias_semana[f] + (d + 1) + '"   name="HORA_DESDE_' + dias_semana[f] + (d + 1)
                                + '" value="' + lista[i].desde + '"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + dias_semana[f] + (d + 1) + '"  value="' + lista[i].hasta + '" name="HORA_HASTA_' + dias_semana[f] + (d + 1)
                                + '" /><input type="hidden" name="DIA_' + dias_semana[f] + (d + 1)
                                + '" value="' + dias_semana[f] + '" ><a href="#" class="remove_' + (d + 1) + '">-</a></td></tr>').appendTo(scntDiv);
                        d++;
                    }
                    // alert(dias_semana[f]);

                }
            }
            calcularHoras();
            $(".texto-h").keyup(
                    function () {
                        calcularHoras();
                    }
            );
        });
    }


}

function cuenta_bancaria(banco) {
    if (banco == '1') {
        $("#generar").hide();
        $("#no_cuen").show();
        $("#nu_cuen").val("");
        $("#nu_cuen").attr("required", "required");
        $("#no_cuen_ban").hide();
        $("#nu_cuen_ban").val("");
        $("#subscription").attr('checked', false);
        $("#nu_cuen").attr("maxlength", "21");
        $("#nu_cuen").attr("minlength", "19")
        // $("#nu_cuen").mask("0011-9999999999999999", {placeholder: "X"});
        $("#no_cuen_otros").hide();
        $("#nu_cuen_otros").val("");
    }
    if (banco == '2') {
        $("#generar").hide();
        $("#subscription").attr('checked', false);
        $("#no_cuen_ban").hide();
        $("#nu_cuen_ban").val("");
        $("#no_cuen").show();
        $("#nu_cuen").val("");
        $("#nu_cuen").attr("required", "required");
        $("#nu_cuen").attr("maxlength", "14");
        $("#nu_cuen").mask("99999999999999", {placeholder: "X"});
        $("#no_cuen_otros").hide();
        $("#nu_cuen_otros").val("");
    }
    if (banco == '3') {
        $("#no_cuen").show();
        $("#no_cuen").val("");
        $("#nu_cuen").attr("required", "required");
        $("#no_cuen_ban").show();
        $("#no_cuen_ban").val("");
        $("#nu_cuen_ban").attr("required", "required");
        $("#no_cuen_otros").show();
        $("#nu_cuen_otros").val("");
        $("#nu_cuen_otros").attr("required", "required");
        $("#generar").hide();
        $("#subscription").attr('checked', false);
    }
    if (banco == '0') {
        $("#no_cuen").hide();
        $("#nu_cuen").val("");
        $("#no_cuen_ban").hide();
        $("#nu_cuen_ban").val("");
        $("#no_cuen_otros").show();
        $("#nu_cuen_otros").val("BBVA");
        $("#generar").show();
        $("#subscription").attr("required", "required");
        $("#nu_cuen_otros").attr("required", "required");
    }

}
var agregar = $('#fila-agregar');
var ag = $('#fila-agregar .porcentaje_cc').size() + 1;
var texto = "";
function agregar_centro_costo(opc, arr_cc) {


    if (opc == "1") {
        texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + ag + ':</label>';
        texto += '<div  class="row centro-costo_' + ag + '" >';
        texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
        texto += '<section class="col col-3"><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
        texto += '<section class="col col-3"><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ag + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
        texto += '<section class="col col-1"><label class="input" id="titu">%<input name="PORCENTAJE_' + ag + '"  min="0"   type="text" required="" value="' + arr_cc[3] + '" class="porcentaje_cc"/><a type="button" style="padding:9%; padding-right:20%; padding-left:20%;"  class=" btn btn-default txt-color-red remover' + ag + '"><i class="fa fa-minus fa-2x"></i></a></label></section>';
        texto += '</div>';
        agregar.append(texto);
        listar_cc(ag, opc, arr_cc);
        sumn_porcen_total();
    } else {
        texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + ag + ':</label>';
        texto += '<div  class="row centro-costo_' + ag + '" >';
        texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
        texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
        texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ag + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
        texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ag + '"  min="0"   type="text" required="" class="porcentaje_cc"/></label></section>';
        texto += '<section class="col col-1" ><br><label class="btn"><a type="button" style="padding:9%; padding-right:20%; padding-left:20%;"  class=" btn btn-default txt-color-red remover' + ag + '"><i class="fa fa-minus fa-2x"></i></a></label></section>';
        texto += '</div>';
        agregar.append(texto);
        listar_cc(ag);
        var c_porcentaje = $(".porcentaje_cc").size();
        $(".porcentaje_cc").val(Math.round((100 / c_porcentaje) * 100) / 100);
        sumn_porcen_total();
    }
    //$(".ver").text(texto); 
    texto = "";
    $(".cant").val(ag);
    ag++;
    $(".porcentaje_cc").keyup(function () {
        sumn_porcen_total();
    });
}

function listar_tipo_horario() {
    $.post("../../formato_horario", "opc=Listar_Tip_Horario", function (objJson) {

        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        var horario = $("#horario");
        horario.empty();
        horario.append('<option value="" >[SELECCIONE]</option>');
        for (var i = 0; i < lista.length; i++) {
            horario.append('<option value="' + lista[i].id + '" >' + lista[i].nombre + '</option>');
        }

    });
}
$(document).ready(function () {

    pageSetUp();
    mostrar();
    list_selectJavaBeans($(".ti_contrato"), "../../contrato", "opc=List_ti_contrato", "id_tipo_contrato", "de_ti_contrato");
    $('#checkout-form').validate({
        // Rules for form validation
        rules: {
            FEC_DESDE: {
                required: true
                        //  ,val_fecha: true
            },
            FEC_HASTA: {
                //val_fecha: true
            },
            /* FECHA_SUSCRIPCION: {
             required: true,
             val_fecha: true
             },*/
            fname: {
                required: true
            },
            horas_totales: {
                required: true
            },
            lname: {
                required: true
            },
            email: {
                required: true,
                email: true
            },
            phone: {
                required: true
            },
            country: {
                required: true
            },
            city: {
                required: true
            },
            code: {
                required: true,
                digits: true
            },
            address: {
                required: true
            },
            name: {
                required: true
            },
            card: {
                required: true,
                creditcard: true
            },
            cvv: {
                required: true,
                digits: true
            },
            month: {
                required: true
            },
            year: {
                required: true,
                digits: true
            }
        },
        // Messages for form validation
        messages: {
            fname: {
                required: 'Please enter your first name'
            },
            horas_totales: {
                max: 'Porfavor digite un horario que se menor a 48 Horas de Trabajo'
            },
            lname: {
                required: 'Please enter your last name'
            },
            email: {
                required: 'Please enter your email address',
                email: 'Please enter a VALID email address'
            },
            phone: {
                required: 'Please enter your phone number'
            },
            country: {
                required: 'Please select your country'
            },
            city: {
                required: 'Please enter your city'
            },
            code: {
                required: 'Please enter code',
                digits: 'Digits only please'
            },
            address: {
                required: 'Please enter your full address'
            },
            name: {
                required: 'Please enter name on your card'
            },
            card: {
                required: 'Please enter your card number'
            },
            cvv: {
                required: 'Enter CVV2',
                digits: 'Digits only'
            },
            month: {
                required: 'Select month'
            },
            year: {
                required: 'Enter year',
                digits: 'Digits only please'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        }
    });
    /* jQuery.validator.addMethod("val_fecha", function (value, element) {
     var d = value.split("-");
     return this.optional(element) || String(parseInt(d[0])).length == 4;
     }, "¡Fecha ingresada invalida!");
     */
    listar_tipo_horario();
    sumn_porcen_total();
    $("#no_cuen").hide();
    $("#no_cuen_ban").hide();
    $("#generar").hide();
    $("#no_cuen_otros").hide();
    //  var r = "";

    $("#submit").click(function () {
        //  $(this).attr("disabled", "disabled");
    });
    $("#remu").keyup(function () {
        Sueldo_Total();
    }
    );
    $("#bono_al").keyup(function () {
        Sueldo_Total();
    }
    );
    $("#bev").keyup(function () {
        Sueldo_Total();
    }
    );
    $("#bo_puesto").keyup(function () {
        Sueldo_Total();
    });
    $("#rein").keyup(function () {
        Sueldo_Total();
    }
    );
    $('#btn-agregar-cc').click(function () {
        agregar_centro_costo();
    });

    document.getElementById("sueldo_total").readOnly = true;
    document.getElementById("asig_fa").readOnly = true;
    $(".contenido").hide();
    /*TEMPORAL*/
    //Planilla
    //if ($("#combito").val()=="REQ-0001" | $("#combito").val() == "REQ-0002" | $("#combito").val() == "REQ-0003" | $(this).val() == "REQ-0004" | $(this).val() == "REQ-0005" | $(this).val() == "REQ-0006") {
    if (true) {
        $(".contenido").hide();
        $("#div_1").show();
    }
    //Fuera PLanilla
    if ($("#combito").val() == 7 | $(this).val() == 8 | $(this).val() == 9) {
        $(".contenido").hide();
        $("#div_2").show();
    }
    //Otros
    if ($("#combito").val() == 10 | $(this).val() == 11 | $(this).val() == 12) {
        $(".contenido").hide();
        $("#div_3").show();
    }
    $("#banco").change(function () {
        cuenta_bancaria($(this).val());
    });
    listar_cc();
    $("#horario").change(
            function () {
                list_horario($(this).val());
            }
    );
    // START AND FINISH DATE
    $('#startdate').datepicker({
        dateFormat: 'dd.mm.yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onSelect: function (selectedDate) {
            $('#finishdate').datepicker('option', 'minDate', selectedDate);
        }
    });
    $('#finishdate').datepicker({
        dateFormat: 'dd.mm.yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onSelect: function (selectedDate) {
            $('#startdate').datepicker('option', 'maxDate', selectedDate);
        }
    });


    Listar_dep();
    Listar_centro_costo();
    Listar_plantilla2();
    Listar_Direccion();
    Listar_Departamento();

    $("#cod_ap").numeric();
    $("#cod_hu").numeric();

    var a = $("#select-sub-mod");
    var c = $("#Selec_Area");
    var d = $("#select_sec");
    var b = $("#selec_dep");
    var e = $("#pu_id_se");
    $(".horasTotales").change(function () {
        var hTotal = $(this).val();
        var hMensual = parseFloat(hTotal) * 4;
        $(".horasSemanales").val(hTotal);
        $(".horasMensuales").val(hMensual);
    });

    $("#select_mod").change(
            function () {
                $.post("../../ajax/Ajax_Reg_Contrato/Ajax_Reg_Contrato.jsp?opc=submodalidad&" + "MODALIDAD=" + $("#select_mod").val(), function (objJson) {
                    a.empty();
                    var list = objJson.lista;
                    a.append("<option value='' > [SELECCIONE] </option>");
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            if ($("#select_mod").val() === 'MOD-0004') {
                                a.append('<option value="' + list[i].id_submodalidad + '" selected="">' + list[i].de_submod + '</option>');
                                // alert();
                            } else {

                                a.append('<option value="' + list[i].id_submodalidad + '">' + list[i].de_submod + '</option>');
                            }

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
            c.append("<option value='' > [SELECCIONE] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    c.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                }
            } else {
                c.append("<option value='' > [no hay] </option>");
            }
        });
        loadPresupuesto($("#selec_dep").val(), 2);
    });

    var idPresupuesto;
    var idDetPres;
    var idPrePuesto;
    function loadPresupuesto(idDestino, destino) {
        if ($('#nom_req').val() != 0) {
            console.log(idDestino, destino);
            var url = "";
            var data = "";
            if (destino === 2) {
                url = "../../pres?opc=comp";
                data = "idDes=" + idDestino;
                data += "&dest=" + destino;
                data += "&idreq=" + $('#nom_req').val();
                $.ajax(url, {
                    data: data,
                    type: 'POST',
                    async: false,
                    success: function (obj) {
                        var ntrad = parseInt(obj.ntrad);
                        if (ntrad > 0) {
                            createAlertExist(destino, obj);
                        } else {
                            createAlertNoExist(destino);
                            //disabledNext();
                        }
                    }
                });
            } else if (destino === 1) {
                url = "../../pres?opc=comp";
                data = "idDes=" + idDestino;
                data += "&dest=" + destino;
                data += "&idreq=" + $('#nom_req').val();
                $.ajax(url, {
                    data: data,
                    type: 'POST',
                    async: false,
                    success: function (obj) {
                        idPresupuesto = obj.idpres;
                        if (obj.iddetpres !== null) {
                            idDetPres = obj.iddetpres;
                        }
                        console.log(idPresupuesto);
                        var ntrad = parseInt(obj.ntrad);
                        if (ntrad > 0) {
                            createAlertExist(destino, obj);
                        } else {
                            createAlertNoExist(destino);
                        }
                    }
                });
            } else if (destino === 3) {
                console.log(idDestino);
                url = "../../pres?opc=comp";
                data = "idpuesto=" + idDestino;
                data += "&dest=" + destino;
                data += "&iddetp=" + idDetPres;
                data += "&idreq=" + $('#nom_req').val();
                $.ajax(url, {
                    data: data,
                    type: 'POST',
                    async: false,
                    success: function (obj) {
                        if (obj.detpuesto['NO_PUESTO'] != null) {
                            idPrePuesto = obj.detpuesto['ID_PRESUPUESTO_PUESTO'];
                            createAlertExist(destino, obj);
                        } else {
                            createAlertNoExist(destino);
                        }
                    }
                });
            }
        } else {
            new PNotify({
                title: 'Por Favor!',
                text: 'Seleccione primero el requerimiento para poder mostrarle el estado del presupuesto.',
                type: 'info'
            });
        }

    }

    function createAlertNoExist(destino) {
        var d;
        var s;
        if (destino === 2) {
            $("#presC").empty();
            d = "este Departamento";
            s = '<div class="alert alert-warning">';
            s += '<strong>Atención!</strong>, no se ha presupuestado aún ' + d + '.';
            s += '</div>';
            $("#presC").append(decodeURIComponent(escape(s)));
        }
        if (destino === 1) {
            d = "este Área";
            console.log(($("#presCA").length == 0));
            if ($("#presCA").length == 0) {
                s = '<div id="presCA" class="alert alert-warning">';
                s += '<strong>Atención!</strong>, no se ha presupuestado aún ' + d + '.';
                s += '</div>';
                $("#presC").append(decodeURIComponent(escape(s)));
            } else {
                $("#presCA").empty();
                $("#presCA").attr("class", "alert alert-warning");
                s = '<strong>Atención!</strong>, no se ha presupuestado aún ' + d + '.';
                $("#presCA").append(decodeURIComponent(escape(s)));
            }
        }
        if (destino === 3) {
            d = "este Puesto";
            console.log(($("#presCP").length == 0));
            if ($("#presCP").length == 0) {
                s = '<div id="presCP" class="alert alert-warning">';
                s += '<strong>Atención!</strong>, no se ha presupuestado aún ' + d + '.';
                s += '</div>';
                $("#presC").append(decodeURIComponent(escape(s)));
            } else {
                $("#presCP").empty();
                $("#presCP").attr("class", "alert alert-warning");
                $("#presDP").empty();
                s = '<strong>Atención!</strong>, no se ha presupuestado aún ' + d + '.';
                $("#presCP").append(decodeURIComponent(escape(s)));
            }
        }
    }

    function createAlertExist(destino, obj) {
        var s = "";
        var info = "";
        console.log(obj);

        var load = calculatePorcent(parseInt(obj.ntrad), parseInt(obj.ntrac));
        var tipo = TipPresupuesto(load);
        if (destino === 1 | destino === 2) {
            var d;
            if (destino === 2) {
                $("#presC").empty();
                d = "Departamento";
                s += '<div class="alert alert-' + tipo + '">';
                s += '<strong>Presupuesto Actual: </strong>' + d + '';
                s += '<br/>';
                s += '<strong>' + obj.ntrac + '</strong> trabajadores contratados de los <strong>' + obj.ntrad + '</strong> trabajadores presupuestados bajo el mismo requerimiento';
                s += '<br/>';
                s += '<div class="progress">';
                s += '<div class="progress-bar progress-bar-striped progress-bar-' + tipo + ' active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
                s += load + '%';
                s += '</div>';
                s += '</div>';
                s += '</div>';
                $("#presC").append(decodeURIComponent(escape(s)));
            }
            if (destino === 1) {
                d = "Área";
                info = '<strong>Presupuesto Actual: </strong>' + d;
                info += '<br/>';
                info += '<strong>' + obj.ntrac + '</strong> trabajadores contratados de los <strong>' + obj.ntrad + '</strong> trabajadores presupuestados bajo el mismo requerimiento';
                info += '<br/>';
                info += '<div class="progress">';
                info += '<div class="progress-bar progress-bar-striped progress-bar-' + tipo + ' active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
                info += load + '%';
                info += '</div>';
                info += '</div>';
                if ($("#presCA").length == 0) {
                    s += '<div id="presCA" class="alert alert-' + tipo + '">';
                    s += info;
                    s += '</div>';
                    $("#presC").append(decodeURIComponent(escape(s)));
                } else {
                    $("#presCA").attr('class', 'alert alert-' + tipo + '');
                    $("#presCA").empty();
                    s = info;
                    $("#presCA").append(decodeURIComponent(escape(s)));
                }
            }
            if (obj.ntrad > obj.ntrac) {
            } else {
                //disabledNext();
            }
        }
        if (destino === 3) {
            d = "Puesto - " + obj.detpuesto.NO_PUESTO;
            load = calculatePorcent(parseInt(obj.detpuesto.N_TRABAJADORES), parseInt(obj.ntrac));
            console.log(load);
            tipo = TipPresupuesto(load);


            if ($("#presCP").length == 0) {
                s = '<div id="presCP" class="alert alert-' + tipo + '">';
                s += '<strong>Presupuesto Actual: </strong>' + d;
                s += '<br/>';
                s += '<strong>' + obj.ntrac + '</strong> trabajadores contratados de los <strong>' + obj.detpuesto.N_TRABAJADORES + '</strong> trabajadores presupuestados bajo el mismo requerimiento.';
                if (obj.detpuesto.N_TRABAJADORES > obj.ntrac) {
                    $('#submit').attr("disabled", false);
                    $(".btnPresModal").hide();
                } else {
                    s += ' Se ha llegado al límite.';
                    disabledNext();
                    $(".btnPresModal").show();
                    loadModalSolPres();
                }
                s += '<br/>';
                s += '<div class="progress">';
                s += '<div class="progress-bar progress-bar-striped progress-bar-' + tipo + ' active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
                s += load + '%';
                s += '</div>';
                s += '</div>';
                s += '</div>';
                s += '<div id="presDP" class="alert alert-info">';
                s += '<strong>Detalles: </strong>';
                s += '<br/>';
                s += '<div class="row"><div class="col-lg-6 col-sm-12">\n\
                    <strong>Sueldo Máx.: </strong><label>' + obj.detpuesto.SUELDO_MAX + '</label><br/>\n\
                    <strong>Sueldo Min.: </strong><label>' + obj.detpuesto.SUELDO_MIN + '</label><br/>\n\</div>';
                s += '<div class="col-lg-6 col-sm-12">\n\
                    <strong>Bonificaciones Máx.: </strong><label>' + obj.detpuesto.BONO_MAX + '</label><br/>\n\
                    <strong>Bonificaciones Min.: </strong><label>' + obj.detpuesto.BONO_MIN + '</label><br/>\n\</div>';
                s += '<div class="col-lg-6 col-sm-12">\n\
                    <strong>Bono Alimenticio Máx.: </strong><label>' + obj.detpuesto.BOAL_MAX + '</label><br/>\n\
                    <strong>Bono Alimenticio Min.: </strong><label>' + obj.detpuesto.BOAL_MIN + '</label><br/>\n\</div><div/>';
                s += '</div>';
                $("#presC").append(decodeURIComponent(escape(s)));
            } else {
                $("#presCP").attr('class', 'alert alert-' + tipo + '');
                s = '<strong>Presupuesto Actual: </strong>' + d;
                s += '<br/>';
                s += '<strong>' + obj.ntrac + '</strong> trabajadores contratados de los <strong>' + obj.detpuesto.N_TRABAJADORES + '</strong> trabajadores presupuestados bajo el mismo requerimiento.';
                if (obj.detpuesto.N_TRABAJADORES > obj.ntrac) {
                    $('#submit').attr("disabled", false);
                    $(".btnPresModal").hide();
                } else {
                    s += ' Se ha llegado al límite.';
                    //disabledNext();
                    loadModalSolPres();
                    $(".btnPresModal").show();
                }
                s += '<br/>';
                s += '<div class="progress">';
                s += '<div class="progress-bar progress-bar-striped progress-bar-' + tipo + ' active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
                s += load + '%';
                s += '</div>';
                s += '</div>';
                $("#presCP").empty();
                $("#presCP").append(decodeURIComponent(escape(s)));
                s = '<strong>Detalles: </strong>';
                s += '<br/>';
                s += '<div class="row"><div class="col-lg-6 col-sm-12">\n\
                    <strong>Sueldo Máx.: </strong><label>' + obj.detpuesto.SUELDO_MAX + '</label><br/>\n\
                    <strong>Sueldo Min.: </strong><label>' + obj.detpuesto.SUELDO_MIN + '</label><br/>\n\</div>';
                s += '<div class="col-lg-6 col-sm-12">\n\
                    <strong>Bonificaciones Máx.: </strong><label>' + obj.detpuesto.BONO_MAX + '</label><br/>\n\
                    <strong>Bonificaciones Min.: </strong><label>' + obj.detpuesto.BONO_MIN + '</label><br/>\n\</div>';
                s += '<div class="col-lg-6 col-sm-12">\n\
                    <strong>Bono Alimenticio Máx.: </strong><label>' + obj.detpuesto.BOAL_MAX + '</label><br/>\n\
                    <strong>Bono Alimenticio Min.: </strong><label>' + obj.detpuesto.BOAL_MIN + '</label><br/>\n\</div><div/>';
                $("#presDP").empty();
                $("#presDP").append(decodeURIComponent(escape(s)));
            }
        }
    }
    $(".btnPresModal").click(function () {
        loadModalSolPres();
    });
    $("#spbtn").click(function () {
        $.ajax("../../pres?opc=regSFP", {
            data: {
                idpp: idPrePuesto,
                ntra: $("#sntra").val(),
                com: $("#scom").val()
            },
            type: 'POST',
            async: false,
            success: function (data) {
                if (data.obj) {
                    new PNotify({
                        title: 'Genial!',
                        text: 'Ya enviamos tu solicitud, puedes verlo en Estado de Solicitudes en la Sección de Presupuesto y asegurarte si lo autorizan para que puedas continuar con la contratación.',
                        type: 'success'
                    });
                    $("#solPresModal").modal('hide');
                    setTimeout(function () {
                        window.location.href = "../../pres?opc=solfpview";
                    }, 3000);

                } else {
                    new PNotify({
                        title: 'Oh no!',
                        text: 'Hubo un problema, nuestros ingenieros están trabajando para solucionarlo. Por favor inténtalo de nuevo.',
                        type: 'warning'
                    });
                    $("#solPresModal").modal('hide');
                }
            }
        });
    });
    //Mostrar el modal para solicitar ampliación del presupuesto
    function loadModalSolPres() {
        $("#spdep").text($(".selectDepartamento option:selected").text());
        $("#spare").text($(".select-area option:selected").text());
        $("#sppto").text($(".select-puesto option:selected").text());
        //alert($(".select_req option:selected").text());
        $("#spreq").text($("#nom_req option:selected").text());
        $.ajax("../../pres?opc=getTempByIdPres", {
            data: {
                idp: idPresupuesto
            },
            type: 'POST',
            async: false,
            success: function (obj) {
                console.log(obj);
                var detT = obj.detTemp;
                $("#sptem").text(detT.NOMBRE_TEMP + " > " + detT.FECHA_INICIO + " - " + detT.FECHA_FIN);
            }
        });
        $("#solPresModal").modal('show');
        //$("#spare").text($(".select-area option:selected").text());
        //$("#spare").text($(".select-area option:selected").text());
    }

    function TipPresupuesto(porcentaje) {
        var percent = parseInt(porcentaje);
        var tipo = "";
        if (percent > 0) {
            if (percent <= 25) {
                tipo = "success";
            } else {
                if (percent <= 50) {
                    tipo = "info";
                } else {
                    if (percent <= 75) {
                        tipo = "warning";
                    } else {
                        tipo = "danger";
                    }
                }
            }
        } else {
            tipo = "success";
        }
        return tipo;
    }

    function calculatePorcent(tpresup, tcon) {
        var por = tcon * 100 / tpresup;
        return por.toFixed(2);
    }

    function disabledNext() {
        $('#submit').attr("disabled", true);
    }

    $(".select_dir").change(function () {
        $.post("../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + $(this).val(), function (objJson) {
            b.empty();

            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var list = objJson.lista;
            b.append("<option value='' > [SELECCIONE] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    b.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                }
            } else {
                b.append("<option value='' > [] </option>");
            }
        });
        new PNotify({
            title: 'Por Favor!',
            text: 'Seleccione primero el requerimiento para poder mostrarle el estado del presupuesto.',
            type: 'info'
        });
        $("#nom_req").focus();
    });


    $("#Selec_Area").change(function () {
        $.post("../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + $("#Selec_Area").val(), function (objJson) {
            d.empty();
            var list = objJson.lista;
            d.append("<option value='' > [SELECCIONE] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    d.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                }
            } else {
                d.append("<option value='' > [no hay] </option>");
            }
        });
        loadPresupuesto($("#Selec_Area").val(), 1);
    });

    $("#select_sec").change(function () {
        $.post("../../Direccion_Puesto", "opc=Listar_pu_id&" + "id=" + $("#select_sec").val(), function (objJson) {
            e.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var list = objJson.lista;
            e.append("<option value='' > [SELECCIONE] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    e.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                }
            } else {
                e.empty();
                e.append("<option value='' > [] </option>");
            }
        });
    });
    $("#pu_id_se").change(function () {
        loadPresupuesto($("#pu_id_se").val(), 3);
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
    function Listar_dep() {
        var s = $("#selec_dep");
        $.post("../../Direccion_Puesto", "opc=Listar", function (objJson) {
            s.empty();
            var lista = objJson.lista;
            s.append("<option value='' > [SELECCIONE] </option>");
            for (var j = 0; j < lista.length; j++) {
                s.append("<option value='" + lista[j].id + "' > " + lista[j].nom + "</option>");
            }
        });
    }
    function Listar_centro_costo() {
        var x = $("#fila-agregar");
        $.post("../../centro_costo", "opc=Listar_centro_id&" + "id_dgp=" + $("#id_dgp").val(), function (objJson) {
            var lista = objJson.lista;
            var numero = 1;
            x.append('<div  class="row centro-costo_' + numero + '" >');
            for (var i = 0; i < lista.length; i++) {
                numero = numero + i;
                if ($("#id_rol_s").val() == 'ROL-0001') {
                    x.append('</label><section class="col col-5"><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></label></section><div class="form-group"><button type="button" class="btn btn-primary" id="Seleccionar_centro" >Buscar</button></div>');
                } else {
                    x.append('</label><section class="col col-5"><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></label></section>');
                }
            }
            x.append('</div><table><tr><td><td><input type="hidden" name="can_centro_cos" value="' + lista.length + '"></td></tr></table>');
        });
    }

});


$("#sueldo").numeric();
$("#bono_al").numeric();
$("#rein").numeric();
$("#bev").numeric();
/* $("#sueldo").mask("99999.99", {placeholder: "0"});
 $("#bono_al").mask("99999.99", {placeholder: "0"});
 $("#bev").mask("99999.99", {placeholder: "0"});*/
var scntDiv = $('#show_lun');
var i = $('#show_lun .texto-h').size() + 1;
var s = $('#show_lun .tr-count').size() + 1;
$('#addScnt').click(function () {
    $('<tr><td>T' + s + ' :</td><td><input type="text"   name="HORA_DESDE_lun' + i
            + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_lun' + i
            + '" value="" placeholder=" " /><input type="hidden" name="DIA_lun' + i
            + '" value="lun" ><input type="hidden" name="USER_CREACION_lun' + i
            + '"> <a href="#" id="remScnt">-</a></td></tr>').appendTo(scntDiv);
    i++;
    s++;
    return false;
});
$('#remScnt').click(function () {
    if (i > 2) {
        $(this).parents('tr').remove();
        //  $("#tr-d").remove();           
        i--;
        s--;
    }
    return false;
});