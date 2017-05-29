/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(".cod_uni").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode));
});
function cod_uni_unico() {
    var x = false;
    $.ajax({
        async: false,
        url: "../../trabajador",
        type: "POST",
        data: "opc=validar_cod_uni&" + "cod_uni=" + $(".cod_uni").val()
    }).done(function (e) {
        if (e.cod > 0) {
            x = false;
        } else {
            x = true;
        }
    }).fail(function (e) {
        alert("Error: " + e);
    });
    return x;
}
function estado_civil(es_civil) {
    if (es_civil == '1' || es_civil == '3' || es_civil == '4' || es_civil == '5') {
        //REMOVE REQUIRED
        $("#tra_upeu_con").removeAttr('required');
        $("#nom_ape_con").removeAttr('required');
        $("#nac_con").removeAttr('required');
        $("#doc_con").removeAttr('required');
        $("#num_con").removeAttr('required');
        $("#ins_vig_con").removeAttr('required');
        //ADD DISABLED
        document.getElementById("tra_upeu_con").disabled = true;
        document.getElementById("nom_ape_con").disabled = true;
        document.getElementById("nac_con").disabled = true;
        document.getElementById("doc_con").disabled = true;
        document.getElementById("num_con").disabled = true;
        document.getElementById("ins_vig_con").disabled = true;
    }
    if (es_civil == '2' || es_civil == '6') {
        //ADD REQUIRED
        $("#tra_upeu_con").attr("required", "required");
        $("#nom_ape_con").attr("required", "required");
        $("#nac_con").attr("required", "required");
        $("#doc_con").attr("required", "required");
        $("#num_con").attr("required", "required");
        $("#ins_vig_con").removeAttr("required", "required");
        //ADD DISABLED
        document.getElementById("tra_upeu_con").disabled = false;
        document.getElementById("nom_ape_con").disabled = false;
        document.getElementById("nac_con").disabled = false;
        document.getElementById("doc_con").disabled = false;
        document.getElementById("num_con").disabled = false;
        document.getElementById("ins_vig_con").disabled = false;
    }
}
function cuenta_bancaria(banco) {
    if (banco == '') {
        $("#no_cuen").hide(200);
        $("#no_cuen_ban").hide(200);
        $("#generar").hide(200);
        $("#texto").hide(200);
        $("#no_cuen_otros").hide(200);
        $("#banco").val("");
        $("#nu_cuen").val("");
        $("#nu_cuen_ban").val("");
        $("#nu_cuen_ban_otros").val("");
        $("#nu_cuen_otros").val("");
        $("#es_cuenta").val(0);
        $("#subscription").attr('checked', false);
    }
    if (banco == '0') {
        $("#no_cuen").hide(200);
        $("#nu_cuen").val("");
        $("#no_cuen_ban").hide(200);
        $("#nu_cuen_ban").val("");
        $("#no_cuen_otros").show(200);
        $("#nu_cuen_otros").val("BBVA Banco Continental");
        $("#nu_cuen_otros").attr('readonly', 'readonly');
        $("#texto").show(200);
        $("#generar").show(200);
        $("#subscription").attr("required", "required");
        $("#nu_cuen_otros").attr("required", "required");
        $("#nu_cuen_otros").removeAttr('maxlength');
        $("#nu_cuen_otros").removeAttr('minlength');
        $("#es_cuenta").val(1);
    }
    if (banco == '1') {
        $("#generar").hide(200);
        $("#no_cuen").show(200);
        $("#nu_cuen").val("");
        $("#nu_cuen").attr("required", "required");
        $("#no_cuen_ban").hide(200);
        $("#nu_cuen_ban").val("");
        $("#subscription").attr('checked', false);
        $("#nu_cuen").attr("maxlength", "21");
        $("#nu_cuen").attr("minlength", "18");
        //$("#nu_cuen").val("0011-")
        $("#no_cuen_otros").hide(200);
        $("#nu_cuen_otros").val("");
        $("#texto").hide(200);
        $("#es_cuenta").val(1);
    }
    if (banco == '2') {

        $("#generar").hide(200);
        $("#subscription").attr('checked', false);
        $("#no_cuen_ban").hide(200);
        $("#nu_cuen_ban").val("");
        $("#no_cuen").show(200);
        $("#nu_cuen").val("");
        $("#nu_cuen").attr("required", "required");
        $("#nu_cuen_otros").removeAttr('maxlength');
        $("#nu_cuen_otros").removeAttr('minlength');
        $("#nu_cuen").removeAttr('maxlength');
        $("#nu_cuen").removeAttr('minlength');
        $("#nu_cuen").attr("maxlength", "14");
        $("#nu_cuen").attr("minlength", "0");
        //$("#nu_cuen").mask("99999999999999", {placeholder: "X"});
        $("#no_cuen_otros").hide(200);
        $("#nu_cuen_otros").val("");
        $("#texto").hide(200);
        $("#nu_cuen").valid();
        $("#es_cuenta").val(1);
    }
    if (banco == '3') {
        $("#no_cuen").show(200);
        $("#no_cuen").val("");
        $("#nu_cuen").attr("required", "required");
        $("#no_cuen_ban").show(200);
        $("#no_cuen_ban").val("");
        $("#nu_cuen_ban").attr("required", "required");
        $("#no_cuen_otros").show(200);
        $("#nu_cuen_otros").val("");
        $("#nu_cuen_otros").attr("required", "required");
        $("#generar").hide(200);
        $("#subscription").attr('checked', false);
        $("#texto").hide(200);
        $("#nu_cuen_otros").removeAttr('readonly');
        $("#nu_cuen_otros").removeAttr('maxlength');
        $("#nu_cuen_otros").removeAttr('minlength');
        $("#es_cuenta").val(1);
    }
}
function  duplicar() {
    var DAD1 = $("#DOM_A_D1").val();
    var DAD2 = $("#DOM_A_D2").val();
    var DAD3 = $("#DOM_A_D3").val();
    var DAD4 = $("#DOM_A_D4").val();
    var DAD5 = $("#DOM_A_D5").val();
    var DAD6 = $("#DOM_A_D6").val();
    var DEP_A = $("#dep_dir_a").val();
    var DADIS = $("#DOM_A_DISTRITO").val();
    var PRO_ACT = $("#pro_dir_a").val();
    $("#DOM_LEG_D1").val(DAD1);
    $("#DOM_LEG_D2").val(DAD2);
    $("#DOM_LEG_D3").val(DAD3);
    $("#DOM_LEG_D4").val(DAD4);
    $("#DOM_LEG_D5").val(DAD5);
    $("#DOM_LEG_D6").val(DAD6);
    list_prov_id_dep(DEP_A, $("#pro_dir_l"), "1", PRO_ACT)
    list_dist_id_prov(PRO_ACT, $("#DOM_LEG_DISTRITO"), "1", DADIS);
    //  $("#DOM_LEG_DISTRITO").val(DADIS);
    $("#dep_dir_l").val(DEP_A);
    // $("#pro_dir_l").val(PRO_ACT);
}
function nobackbutton() {

    window.location.hash = "no-back-button";
    window.location.hash = "Again-No-back-button" //chrome

    window.onhashchange = function () {
        window.location.hash = "no-back-button";
    };
}
function val_doc(valor) {
    var x = false;
    if (true) {
        $.ajax({
            async: false,
            url: "../../trabajador",
            data: "opc=Val_num_Doc&doc=" + valor,
            type: "post"
        }).done(function (e) {
            if (e.nu_doc) {
                x = false;
            } else {
                x = true;
            }
        });
    }
    return x;
}

function val_diezmo() {
    var x = false;
    if ($('.cbkDiezmo').is(':visible')) {
        if ($(".cbkDiezmo").prop('checked')) {
            $(".cbkDiezmo").parent().removeClass("state-error");
            $(".cbkDiezmo").parent().addClass("state-success");
            x = true;
        } else {
            $(".cbkDiezmo").parent().removeClass("state-success");
            $(".cbkDiezmo").parent().addClass("state-error");
        }
    }
    return x;
}

function list_prov_id_dep(rg, ti, selected, id_select) {
    var data = "id_dep=" + rg + "&opc=dep_nac";
    ti.append('<option value="">Cargando...</option>').val('');
    $.post("../../ubigeo", data, function (objJson) {
        ti.empty();
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length > 0) {
            if (selected == "0") {
                ti.append("<option value=''>[Seleccione]</option>");
                for (var i = 0; i < lista.length; i++) {
                    var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                    ti.append(item);
                }
            } else if (selected == "1") {

                ti.append("<option value=''>[Seleccione]</option>");
                for (var i = 0; i < lista.length; i++) {
                    if (id_select === lista[i].id) {
                        var item = "<option value='" + lista[i].id + "' selected>" + lista[i].descripcion + "</option>";
                        ti.append(item);
                    } else {
                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                        ti.append(item);
                    }
                }
            }
        } else {
            ti.append("<option value=''>[Provincia]</option>");
        }
    });
}
//DISTRITO
function list_dist_id_prov(rg, ti, selected, id_select) {
    var data = "id_dist=" + rg + "&opc=pro_nac";
    ti.append('<option value="">Cargando...</option>').val('');
    ti.empty();
    $.post("../../ubigeo", data, function (objJson) {

        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length > 0) {
            if (selected == "0") {
                ti.append("<option value=''>[Seleccione]</option>");
                for (var i = 0; i < lista.length; i++) {
                    var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                    ti.append(item);
                }
            } else if (selected == "1") {
                ti.append("<option value=''>[Seleccione]</option>");
                for (var i = 0; i < lista.length; i++) {
                    if (id_select === lista[i].id) {
                        var item = "<option value='" + lista[i].id + "' selected>" + lista[i].descripcion + "</option>";
                        ti.append(item);
                    } else {
                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                        ti.append(item);
                    }
                }
            }
        } else {
            ti.append("<option value=''>[Distrito]</option>");
        }
    });
}

//PROVINCIA
$("#dep_dir_l").change(function () {
    var ti = $("#pro_dir_l");
    var rg = $("#dep_dir_l").val();
    list_prov_id_dep(rg, ti, "0", "");
});

$(document).ready(function () {
    $("#wizard-1")[0].reset();
    pageSetUp();
    $("#sit_edu").change(function () {
        if ($("#sit_edu").val() === 'SED-0011' | $("#sit_edu").val() === 'SED-0013' | $("#sit_edu").val() === 'SED-0014'
                | $("#sit_edu").val() === 'SED-0015'
                | $("#sit_edu").val() === 'SED-0016' | $("#sit_edu").val() == 'SED-0017'
                | $("#sit_edu").val() === 'SED-0017' | $("#sit_edu").val() == 'SED-0018'
                | $("#sit_edu").val() === 'SED-0019' | $("#sit_edu").val() == 'SED-0020'
                | $("#sit_edu").val() === 'SED-0021') {

            $("#es_inst_p").show(200);
        } else {
            $("#es_inst_p").hide(200);
            $("#es_inst_p").find('select option:eq(0)').prop('selected', true);
            $("#regimen").hide(200);
            $("#regimen").find('select option:eq(0)').prop('selected', true);
            $("#egreso").hide(200);
            $("#egreso").find('select option:eq(0)').prop('selected', true);
            $("#ti").hide(200);
            $("#ti").find('select option:eq(0)').prop('selected', true);
            $("#institucion").hide(200);
            $("#institucion").find('select option:eq(0)').prop('selected', true);
            $("#carr").hide(200);
            $("#carr").find('select option:eq(0)').prop('selected', true);
        }
    });
    $("#es_inst_p").change(function () {
        if ($("#inst_peru").val() === "1") {
            $("#regimen").show(200);
            $("#egreso").show(200);
            $("#ti").show(200);
            $("#institucion").show(200);
            $("#carr").show(200);
        } else {
            $("#regimen").hide(200);
            $("#egreso").hide(200);
            $("#ti").hide(200);
            $("#institucion").hide(200);
            $("#carr").hide(200);
        }
    });

    var $validator = $("#wizard-1").validate({
        rules: {
            email: {
                required: true,
                email: "Your email address must be in the format of name@domain.com"
            },
            FECHA_NAC: {
                required: true,
                val_edad: true
            }
            ,
            FECHA_NAC_H: {
                val_fecha: true
            }
            ,
            FECHA_NAC_CONYUGUE: {
                val_edad: true
            },
            wphone: {
                required: true,
                minlength: 10
            },
            hphone: {
                required: true,
                minlength: 10
            }, NRO_DOC: {
                val_doc: true
            }, COD_UNI: {
                val_cod_uni: true

            }
        },
        messages: {
            fname: "Please specify your First name",
            lname: "Please specify your Last name",
            email: {
                required: "We need your email address to contact you",
                email: "Your email address must be in the format of name@domain.com"
            }
        },
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');

        },
        unhighlight: function (element) {
            $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
        },
        errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function (error, element) {
            if (element.parent('.input-group').length) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
        }
    });
    jQuery.validator.addMethod("val_edad", function (value, element) {
        return this.optional(element) || calcular_edad(value) > 0;
    }, "¡La edad debe ser mayor a cero!");

    jQuery.validator.addMethod("val_doc", function (value, element) {
        return this.optional(element) || val_doc(value);
    }, "¡Numero de documento ya existe!");
    jQuery.validator.addMethod("val_cod_uni", function (value, element) {
        return this.optional(element) || cod_uni_unico();
    }, "¡Código universitario ya existe!");


    $('.step').click(function () {
        var index = $('#bootstrap-wizard-1').bootstrapWizard('currentIndex');
        if ($(this).find('i').hasClass("fa-check")) {
            if (!$("#wizard-1").valid() & $('.step').eq(index).find('i').hasClass("fa-check")) {
                $validator.focusInvalid();
            } else {
                $('#bootstrap-wizard-1').bootstrapWizard('show', $('.step').index(this));
            }
        } else {
            if (!$("#wizard-1").valid()) {
                $validator.focusInvalid();
            } else {
                $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index).addClass(
                        'complete');
                $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index).find('.step')
                        .html('<i class="fa fa-check"></i>');

                if ($('.step').eq($('.step').index(this) - 1).find('i').hasClass("fa-check")) {
                    $('#bootstrap-wizard-1').bootstrapWizard('show', $('.step').index(this));
                }
            }
        }
    });
    function validateTab(index) {
        var $valid = $("#wizard-1").valid();
        if (!$valid) {
            $validator.focusInvalid();
            return false;
        } else {
            $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).addClass(
                    'complete');
            $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).find('.step')
                    .html('<i class="fa fa-check"></i>');
        }
        return true;
    }

    $('#bootstrap-wizard-1').bootstrapWizard({
        'tabClass': 'form-wizard',
        onTabClick: function (tab, navigation, index) {
            return validateTab(index, tab);
            //return true;
        },
        'onNext': function (tab, navigation, index) {
            return validateTab(index);
        }
    });
    $("#inst").change(function () {
        var carr = $("#carrera");
        carr.empty();
        var insti = $("#inst").val();
        var data = "inst=" + insti + "&opc=carrera";
        carr.append('<option value="">Cargando...</option>').val('');
        $.post("../../detalle_carrera", data, function (objJson) {
            carr.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                carr.append("<option value='0'>[Seleccione]</option>");
            } else {
                carr.append("<option value='0'>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                carr.append(item);
            }
        });
    });
    var tip = $("#pro_dir_l");
    tip.empty();
    var rg = $("#dep_dir_l").val();
    var data = "id_dep=" + rg + "&opc=dep_nac";
    tip.append('<option value="">Cargando...</option>').val('');
    $.post("../../ubigeo", data, function (objJson) {
        tip.empty();
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length > 0) {
            tip.append("<option value=''>[Seleccione]</option>");
        } else {
            tip.append("<option value=''>[]</option>");
        }
        for (var i = 0; i < lista.length; i++) {
            var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
            tip.append(item);
        }
    });
    var ti = $("#DOM_LEG_DISTRITO");
    ti.empty();
    var rg = $("#pro_dir_l").val();
    var data = "id_dist=" + rg + "&opc=pro_nac";
    ti.append('<option value="">Cargando...</option>').val('');
    $.post("../../ubigeo", data, function (objJson) {
        ti.empty();
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length > 0) {
            ti.append("<option value=''>[Seleccione]</option>");
        } else {
            ti.append("<option value=''>[]</option>");
        }
        for (var i = 0; i < lista.length; i++) {
            var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
            ti.append(item);
        }
    });
    $(".doc, .doc_c").attr("maxlength", "8");
    $(".doc, .doc_c").attr("minlength", "8");
    $("#docs, .doc_c, #nu_cuen, #nu_cuen_ban").numeric();
    $("#doc, .doc_c").numeric(false, function () {
        alert("Solo Numeros Enteros");
        this.value = "";
        this.focus();
    });
    $(".positive").numeric({negative: false}, function () {
        alert("No negative values");
        this.value = "";
        this.focus();
    });
    $(".positive-integer").numeric({decimal: false, negative: false}, function () {
        alert("Positive integers only");
        this.value = "";
        this.focus();
    });
    $("#remove").click(function (e) {
        e.preventDefault();
        $(".numeric,.integer,.positive").removeNumeric();
    }
    );

    $("#reli").change(function () {
        if ($(this).val() === "1") {
            $(".div_diezmo").show(200);

        } else {
            $(".div_diezmo").hide(200);

        }
    });//
    $('.cbkDiezmo').click(function () {
        val_diezmo();
    });
    //  }

    /*Ubigeo*/
    $("#dep_nac").change(function () {
        var ti = $("#pro_nac");
        ti.empty();
        var rg = $("#dep_nac").val();
        var data = "id_dep=" + rg + "&opc=dep_nac";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../ubigeo", data, function (objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });
    $("#pro_nac").change(function () {
        var ti = $("#dist_nac");
        ti.empty();
        var rg = $("#pro_nac").val();
        var data = "id_dist=" + rg + "&opc=pro_nac";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../ubigeo", data, function (objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });
    // ============ DIRECCION ===========
    $("#dep_dir_a").change(function () {
        var ti = $("#pro_dir_a");
        ti.empty();
        var rg = $("#dep_dir_a").val();
        var data = "id_dep=" + rg + "&opc=dep_nac";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../ubigeo", data, function (objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });
    $("#pro_dir_a").change(function () {
        var ti = $("#DOM_A_DISTRITO");
        ti.empty();
        var rg = $("#pro_dir_a").val();
        var data = "id_dist=" + rg + "&opc=pro_nac";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../ubigeo", data, function (objJson) {
            ti.empty();
            if (objJson.rpta === -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });

    $("#nac").change(
            function () {
                if ($("#nac").val() !== "NAC-0193") {
                    $("#dist").hide(200);
                    $("#dist_nac").val("DST-001832");
                }
                if ($("#nac").val() === "NAC-0193") {
                    $("#dist").show(200);
                }
            }
    );
    /*Datos Academicos*/
    $("#rg").change(function () {
        var ti = $("#ti_inst");
        ti.empty();
        var rg = $("#rg").val();
        var data = "regimen=" + rg + "&opc=ti_inst";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../detalle_carrera", data, function (objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });
    $("#ti_inst").change(function () {
        var inst = $("#inst");
        inst.empty();
        var ti = $("#ti_inst").val();
        var data = "ti=" + ti + "&opc=institucion";
        inst.append('<option value="">Cargando...</option>').val('');
        $.post("../../detalle_carrera", data, function (objJson) {
            inst.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                inst.append("<option value='0'>[Seleccione]</option>");
            } else {
                inst.append("<option value='0'>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                inst.append(item);
            }
        });
    });
    $("#pro_dir_l").change(function () {
        var ti = $("#DOM_LEG_DISTRITO");
        var rg = $("#pro_dir_l").val();
        list_dist_id_prov(rg, ti, "0", "");
    });


    $(".select-doc").change(
            function () {
                $(".doc").val("");
                if ($(".select-doc").val() === 1) {
                    $("#doc").numeric(false, function () {
                    });
                    $(".doc").attr("maxlength", "8");
                    $(".doc").attr("minlength", "8");
                } else {
                    $("#doc").removeNumeric();
                    $(".doc").attr("maxlength", "10");
                    $(".doc").removeAttr("minlength");
                    //    $(".doc").val("");
                }
                $(".doc").focus();
            }
    );
    $(".select-doc_c").change(function () {
        $(".doc_c").val("");
        if ($(".select-doc_c").val() === 1) {
            $(".doc_c").numeric(false, function () {
            });
            $(".doc_c").attr("maxlength", "8");
            $(".doc_c").attr("minlength", "8");
        } else {

            $(".doc_c").removeNumeric();
            $(".doc_c").attr("maxlength", "10");
            $(".doc_c").removeAttr("minlength");
        }

    });


    $(".alerta-req").hide(200);
    $("#edad").change(function () {
        $(".alerta-req").hide(200);
        var edad = calcular_edad($("#edad").val());
        $(".edad").text(edad + " años");
    });
    $(".fe_nac_c").change(function () {
        $(".alerta-req").hide(200);
        var edad = calcular_edad($(this).val());
        $(".text_edad").text(edad + " años");
    });
    $("#sis_pens").change(function () {
        if ($("#sis_pens").val() !== "1") {
            $(".n_afp").remove();
            $("#nom_afp").attr("disabled", true);
            $(".afp").append('<input name="NOMBRE_AFP_ID" type="hidden" class="n_afp" value="6"/>');
            $("#nom_afp").val("6");
        }
        if ($("#sis_pens").val() === "1") {

            $("#nom_afp").val("");
            $("#nom_afp").removeAttr("disabled");
            $(".n_afp").remove();
        }
    });

    $("#no_cuen").hide(200);
    $("#no_cuen_ban").hide(200);
    $("#generar").hide(200);
    $("#texto").hide(200);
    $("#no_cuen_otros").hide(200);
    $("#banco").change(function () {
        cuenta_bancaria($(this).val());
        $("#nu_cuen").focus();
    });
    $("#es_civil").change(function () {
        estado_civil($(this).val());
    });
    $("#DOM_A_D3").change(
            function () {
                if ($("#DOM_A_D3").val() === "3") {
                    $("#DOM_A_D4").val("Sin Numero");
                } else {
                    $("#DOM_A_D4").val("");
                }
            }
    );
    $("#DOM_LEG_D3").change(
            function () {
                if ($("#DOM_LEG_D3").val() === "3") {
                    $("#DOM_LEG_D4").val("Sin Numero");
                } else {
                    $("#DOM_LEG_D4").val("");
                }
            }
    );
    $("#reli").change(function () {
        if ($("#reli").val() === "1") {
            $("#igle").attr("required", "required");
        } else {
            $("#igle").removeAttr("required");
        }
    });

    $(".i_ndoc_h").numeric(false);
    var p = 1;
    var texto_h = "";
    $(".i_tdoc_h").change(function () {
        $(".i_ndoc_h").val("");
        if ($(this).val() === 1) {
            $(".i_ndoc_h").numeric(false);
            $(".i_ndoc_h").attr("maxlength", "8");
            $(".i_ndoc_h").attr("minlength", "8");
        } else {
            $(".i_ndoc_h").removeNumeric();
            $(".i_ndoc_h").attr("maxlength", "10");
            $(".i_ndoc_h").removeAttr("minlength");
        }
        $(".i_ndoc_h").focus();
    });
    function validarFormHijo() {
        var ap_pat = $(".i_app_h");
        var ap_mat = $(".i_apm_h");
        var nombre = $(".i_no_h");
        var fe_nac = $(".i_fnac_h");
        var sexo = $(".i_sexo_h");
        var t_doc = $(".i_tdoc_h");
        var ndoc = $(".i_ndoc_h");
        var essalud = $(".i_essalud_h");
        var es_sup = $(".i_es_sup_h");
        var x, a, b, c, d, e, f, g, h, i = false;
        if (ap_pat.val() === "") {
            var $p = ap_pat.parent().parent();
            $p.removeClass('has-success');
            $p.addClass('has-error');
            if (ap_pat.parents(".form-group").find(".help-block").length === 0) {
                ap_pat.parents(".form-group").append("<span  class='help-block'>Ingrese un apellido paterno</span>");
            }
            a = false;
        } else {
            ap_pat.parents(".form-group").find(".help-block").remove();
            a = true;
        }
        if (ap_mat.val() === "") {
            var $p = ap_mat.parent().parent();
            $p.removeClass('has-success');
            $p.addClass('has-error');
            if (ap_mat.parents(".form-group").find(".help-block").length === 0) {
                ap_mat.parents(".form-group").append("<span  class='help-block'>Ingrese un apellido materno</span>");
            }

            b = false;
        } else {
            ap_mat.parents(".form-group").find(".help-block").remove();
            b = true;
        }
        if (nombre.val() === "") {
            var $p = nombre.parent().parent();
            $p.removeClass('has-success');
            $p.addClass('has-error');
            if (nombre.parents(".form-group").find(".help-block").length === 0) {
                nombre.parents(".form-group").append("<span  class='help-block'>Ingrese un nombre</span>");
            }

            c = false;
        } else {
            nombre.parents(".form-group").find(".help-block").remove();
            c = true;
        }
        if (fe_nac.val() === "") {
            var $p = fe_nac.parent().parent();
            $p.removeClass('has-success');
            $p.addClass('has-error');
            if (fe_nac.parents(".form-group").find(".help-block").length === 0) {
                fe_nac.parents(".form-group").append("<span  class='help-block'>Ingrese fecha de nacimiento</span>");
            }

            d = false;
        } else {
            fe_nac.parents(".form-group").find(".help-block").remove();
            d = true;
        }
        if (sexo.val() === "") {
            var $p = sexo.parent().parent();
            $p.removeClass('has-success');
            $p.addClass('has-error');
            if (sexo.parents(".form-group").find(".help-block").length === 0) {
                sexo.parents(".form-group").append("<span  class='help-block'>Seleccione un género</span>");
            }

            e = false;
        } else {
            sexo.parents(".form-group").find(".help-block").remove();
            e = true;
        }
        if (t_doc.val() === "") {
            var $p = t_doc.parent().parent();
            $p.removeClass('has-success');
            $p.addClass('has-error');
            if (t_doc.parents(".form-group").find(".help-block").length === 0) {
                t_doc.parents(".form-group").append("<span  class='help-block'>Seleccione un tipo de documento</span>");

            }
            f = false;
        } else {
            t_doc.parents(".form-group").find(".help-block").remove();
            f = true;
        }
        if (ndoc.val() === "") {
            var $p = ndoc.parent().parent();
            $p.removeClass('has-success');
            $p.addClass('has-error');
            if (ndoc.parents(".form-group").find(".help-block").length === 0) {
                ndoc.parents(".form-group").append("<span  class='help-block'>Ingrese numero de documento</span>");
            }
            g = false;
        } else {
            ndoc.parents(".form-group").find(".help-block").remove();
            g = true;
        }
        if (essalud.val() === null) {
            var $p = essalud.parent().parent();
            $p.removeClass('has-success');
            $p.addClass('has-error');
            if (essalud.parents(".form-group").find(".help-block").length === 0) {
                essalud.parents(".form-group").append("<span  class='help-block'>Seleccione un item</span>");

            }
            h = essalud;
        } else {
            essalud.parents(".form-group").find(".help-block").remove();
            h = true;
        }
        if (es_sup.val() === null) {
            var $p = es_sup.parent().parent();
            $p.removeClass('has-success');
            $p.addClass('has-error');
            if (es_sup.parents(".form-group").find(".help-block").length === 0) {
                es_sup.parents(".form-group").append("<span  class='help-block'>Seleccione un item</span>");
            }

            i = false;
        } else {
            es_sup.parents(".form-group").find(".help-block").remove();
            i = true;
        }
        if (a && b && c && d && e && f && g && h && i) {
            x = true;
        } else {
            x = false;
        }
        return x;
    }
    $(".formHijo").change(function () {
        validarFormHijo();
    });
    $(".btn-reg-hijo").click(function () {
        var tabla_hijo = $(".tabla-hijo");
        var ap_pat = $(".i_app_h");
        var ap_mat = $(".i_apm_h");
        var nombre = $(".i_no_h");
        var fe_nac = $(".i_fnac_h");
        var sexo = $(".i_sexo_h");
        var t_doc = $(".i_tdoc_h");
        var ndoc = $(".i_ndoc_h");
        var essalud = $(".i_essalud_h");
        var es_sup = $(".i_es_sup_h");
        var f = fe_nac.val();
        var a = f.split("");
        var fecha_naci = a[8] + a[9] + "/" + a[5] + a[6] + "/" + a[2] + a[3];
        if (validarFormHijo()) {
            texto_h += ("<tr class='tr_item_hijo tr-hijo_" + p + "'>");
            texto_h += ('<td ><label class="td-ap_pat' + p + '">' + ap_pat.val() + '</label><input type="hidden" value="' + ap_pat.val() + '" name="APELLIDO_P_H' + p + '" class="ap_p_h_' + p + '"/></td>');
            texto_h += ('<td ><label class="td-ap_mat' + p + '">' + ap_mat.val() + '</label><input type="hidden" value="' + ap_mat.val() + '" name="APELLIDO_M_H' + p + '" class="ap_m_h_' + p + '"/></td>');
            texto_h += ('<td ><label class="td-nom' + p + '">' + nombre.val() + '</label><input type="hidden" value="' + nombre.val() + '" name="NOMBRE_H' + p + '" class="no_h_' + p + '"/></td>');
            texto_h += ('<td ><label class="td-fe_nac' + p + '">' + fecha_naci + '</label><input type="hidden" value="' + fe_nac.val() + '" name="FECHA_NAC_H' + p + '" class="fe_n_h_' + p + '"/></td>');
            texto_h += (' <td ><label class="td-sex' + p + '">' + $(".i_sexo_h option:selected").html() + '</label><input type="hidden" value="' + sexo.val() + '" name="SEXO_H' + p + '" class="sex_h_' + p + '"/></td>');
            texto_h += ('<td ><label class="td-tdoc' + p + '">' + $(".i_tdoc_h option:selected").html() + '</label><input type="hidden" value="' + t_doc.val() + '" name="TIPO_DOC_ID_H' + p + '" class="ti_doc_h_' + p + '"/></td>');
            texto_h += ('<td ><label class="td-ndoc' + p + '">' + ndoc.val() + '</label><input type="hidden" value="' + ndoc.val() + '" name="NRO_DOC_H' + p + '" class="nu_doc_h_' + p + '"/></td>');
            texto_h += ('<td ><label class="td-essalud' + p + '">' + $(".i_essalud_h option:selected").html() + '</label><input type="hidden" value="' + essalud.val() + '" name="ESSALUD_H' + p + '" class="essalud_h_' + p + '"/></td>');
            texto_h += ('<td ><label class="td-es_sup' + p + '">' + $(".i_es_sup_h option:selected").html() + '</label><input type="hidden" value="' + es_sup.val() + '" name="EST_SUP_H' + p + '" class="es_sup_h_' + p + '"/></td>');
            texto_h += ('<td><button href="javascript:void(0);" type="button" value="' + p + '" class="btn btn-danger btn-labeled btn_remover" ><span class="btn-label"><i class="glyphicon glyphicon-remove"></i></span>Quitar</button> </td>');
            texto_h += ('<td><button class="btn btn-success btn-labeled btn-modificar_' + p + '" href="javascript:void(0);" type="button" value="' + p + '"><span class="btn-label"><i class="glyphicon glyphicon-edit"></i></span>Modificar</button></td>');
            texto_h += ("</tr>");
            tabla_hijo.append(texto_h);
            // $(".codigo").text(texto_h);
            ap_pat.val("");
            ap_mat.val("");
            nombre.val("");
            fe_nac.val("");
            sexo.val("");
            t_doc.val("");
            ndoc.val("");
            essalud.val("");
            es_sup.val("");
            $(".num_hijo").val(p);

            texto_h = "";
            //  $(".num_hijo").val($(".tr_item_hijo").length);
            console.log("p:" + p)
            $(".btn-modificar_" + p).click(function () {
                console.log("click to button modificar")
                ap_pat.val($(".ap_p_h_" + $(this).val()).val());
                ap_mat.val($(".ap_m_h_" + $(this).val()).val());
                nombre.val($(".no_h_" + $(this).val()).val());
                fe_nac.val($(".fe_n_h_" + $(this).val()).val());
                sexo.val($(".sex_h_" + $(this).val()).val());
                t_doc.val($(".ti_doc_h_" + $(this).val()).val());
                ndoc.val($(".nu_doc_h_" + $(this).val()).val());
                essalud.val($(".essalud_h_" + $(this).val()).val());
                es_sup.val($(".es_sup_h_" + $(this).val()).val());
                $(".btn-reg-hijo").hide(200);
                $(".btn-mant").append('<button type="button" value="' + $(this).val() + '" class="btn-mod-hijo btn btn-info">Modificar Hijo</button>');
                $(".btn-mod-hijo").click(function () {
                    if (validarFormHijo()) {
                        $(".ap_p_h_" + $(this).val()).val(ap_pat.val());
                        $(".ap_m_h_" + $(this).val()).val(ap_mat.val());
                        $(".no_h_" + $(this).val()).val(nombre.val());
                        $(".fe_n_h_" + $(this).val()).val(fe_nac.val());
                        $(".sex_h_" + $(this).val()).val(sexo.val());
                        $(".ti_doc_h_" + $(this).val()).val(t_doc.val());
                        $(".nu_doc_h_" + $(this).val()).val(ndoc.val());
                        $(".essalud_h_" + $(this).val()).val(essalud.val());
                        $(".es_sup_h_" + $(this).val()).val(es_sup.val());
                        $(".td-ap_pat" + $(this).val()).text(ap_pat.val());
                        $(".td-ap_mat" + $(this).val()).text(ap_mat.val());
                        $(".td-nom" + $(this).val()).text(nombre.val());
                        $(".td-fe_nac" + $(this).val()).text(fe_nac.val());
                        $(".td-sex" + $(this).val()).text($(".i_sexo_h option:selected").html());
                        $(".td-tdoc" + $(this).val()).text($(".i_tdoc_h option:selected").html());
                        $(".td-ndoc" + $(this).val()).text(ndoc.val());
                        $(".td-essalud" + $(this).val()).text($(".i_essalud_h option:selected").html());
                        $(".td-es_sup" + $(this).val()).text($(".i_es_sup_h option:selected").html());
                        ap_pat.val("");
                        ap_mat.val("");
                        nombre.val("");
                        fe_nac.val("");
                        sexo.val("");
                        t_doc.val("");
                        ndoc.val("");
                        essalud.val("");
                        es_sup.val("");
                        $(".btn-reg-hijo").show(200);
                        $(".btn-mod-hijo").remove();
                    }

                });
            });
            p++;
        }
        $(".btn_remover").click(function () {
            $('.tr-hijo_' + $(this).val()).remove();
        });
    });

    var b = $(".tbodys");
    $("#btnfiltrar").click(
            function () {
                $.post("../../ajax/Ajax_Conyugue/Ajax_Busc_Conyug.jsp", $("#frm_filtro").serialize(), function (objJson) {
                    b.empty();
                    var list = objJson.lista;
                    for (var i = 0; i < list.length; i++) {
                        b.append("<tr>");
                        b.append("<td>" + list[i].NOM + " " + list[i].AP_PA + " " + list[i].AP_MA + "</td>");
                        b.append("<td>" + list[i].NU_DOC + "</td>");
                        b.append("<input type ='hidden' class='trab_" + i + "' value='" + list[i].ID_TRAB + "' />");
                        b.append("<input type ='hidden' class='nac_" + i + "' value='" + list[i].NAC + "' />");
                        b.append("<input type ='hidden' class='dni_" + i + "' value='" + list[i].NU_DOC + "' />");
                        b.append("<input type ='hidden' class='tipo_" + i + "' value='" + list[i].TIPO + "' />");
                        b.append("<input type ='hidden' class='nom_ape_" + i + "' value='" + list[i].NOM + " " + list[i].AP_PA + " " + list[i].AP_MA + "' />");
                        if (typeof (list[i].ID_C) === "undefined") {
                            b.append('<td><button type="button" class="btn btn-primary btn-add-conyugue" value="' + i + '" data-dismiss="modal">Agregar</button></td>');
                        } else {
                            b.append('<td>Tiene conyugue</td>');
                        }
                        b.append("</tr>");
                    }
                    $(".btn-add-conyugue").click(function () {
                        var v = $(this).val();
                        $(".nom_c").val($(".nom_ape_" + v).val());
                        $(".f_nac").val($(".nac_" + v).val());
                        $(".ti_documento").val($(".tipo_" + v).val());
                        $(".num_doc").val($(".dni_" + v).val());
                        $(".cony").val($(".trab_" + v).val());
                    });
                }
                );
            });
    $(".btn-salir-busc, .close").click(function () {
        $(".select-conyugue").val("0");
    });
    $(".select-conyugue").change(function () {
        if ($(this).val() === "1") {
            $("#btn-mostrar").click();
        }
        if ($(this).val() === "0") {
            $(".nom_c").val("");
            $(".f_nac").val("");
            $(".ti_documento").val("");
            $(".num_doc").val("");
            $(".cony").val("");
        }
    });
    $("#btncancel").click(function () {
                document.formulario.reset();
                b.empty();
                html = '<tr><td colspan="8" align="center">Haga la busqueda por algunos de los filtros...</td></tr>';
                $(".tbodys").html(html);
            }
    );
});
