/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var guardar = false;
var nInputs = 0;
$(document).ready(function () {



    plHeader($('.contheader'));
    $('.btnSig').hide();
    $('.btnSig').click(function () {
        guardar = false;
        if (guardar) {
            $('#myModalEdit').modal();
        } else {
            enableElements($('.cDia'));
            $('.cDia').hide(500);
            if ($(".select-puesto").val() !== "") {
                $('.formDGP').submit();
            }else{
                new PNotify({
                    title: 'Hey!',
                    text: 'Necesitamos que asignes un puesto a este trabajador.',
                    type: 'warning'
                });
            }
        }

    });
    $('.modAceptar').click(function () {
        var data = "opc=GuardarFH";
        data += "&NO_HORARIO=" + $('.modNombre').val();
        data += "&CA_HORAS=" + $('.h_totales').val();
        data += "&id_ar=" + $('.select-area').val();
        data += "&id_sec=" + $('.select-seccion').val();
        $.post("../../formato_horario", data, function () {
            cargar_horarios($('.t_horario'), true, $('.modNombre').val());
        });

    });

});
function cargar_horarios(sel, dep, nombre) {

    var x = '0';
    $.post("../../formato_horario", "opc=Listar_Tip_Horario&sec=" + $('.select-seccion').val(), function (objJson) {
        var lista = objJson.lista;
        sel.empty();
        sel.append('<option value="0" >[SELECCIONE]</option>');
        for (var i = 0; i < lista.length; i++) {
            if (lista[i].nombre === nombre) {
                x = lista[i].id;
            }
            sel.append('<option value="' + lista[i].id + '" >' + lista[i].nombre + '</option>');
        }
        sel.append('<option value="CUSTOMIZE" disabled>Personalizado</option>');
        sel.val(x);
        if (dep === true) {
            $('.formDGP').submit();
        }
    });
}
function llenar_horario(valor) {
    $('.cDia').empty();
//    $('.btnGuardarH').hide();
    guardar = false;
    var dias_semana = new Array("lun", "mar", "mie", "jue", "vie", "sab", "dom");
    plDiasl($('.contDias'), false, false, false, false, false, false, false);
    $.post("../../formato_horario", "opc=Listar_Horario&id=" + valor, function (objJson) {
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (lista[i].estado !== '2') {
                for (var j = 0; j < dias_semana.length; j++) {
                    if (lista[i].dia === dias_semana[j]) {
                        llenar_dia(dias_semana[j], lista[i].desde, lista[i].hasta, lista[i].turno, lista[i].estado);
                    }
                }
            }

        }
    });
    nInputs = $('.cDia input').size();

}
function llenar_dia(dia, desde, hasta, turno, estado) {

    switch (dia) {
        case "lun":
            dia = "Lunes";
            break;
        case "mar":
            dia = "Martes";
            break;
        case "mie":
            dia = "Miercoles";
            break;
        case "jue":
            dia = "Jueves";
            break;
        case "vie":
            dia = "Viernes";
            break;
        case "sab":
            dia = "Sabado";
            break;
        case "dom":
            dia = "Domingo";
            break;
    }
    desde = parseMeridian(desde);
    hasta = parseMeridian(hasta);
    if ($('.i' + dia).is(':checked')) {
        timePick($('.cTim' + dia), dia, desde, hasta);
    } else {
        $('.i' + dia).attr("checked", true);
        diaL($('.cDia'), dia, 0);
        timePick($('.cTim' + dia), dia, desde, hasta);
    }
    disableElements($('.cDia'));
    calc_Horas();
}
function parseMeridian(valor) {
    var va = valor.split(":");
    var x = parseInt(va[0]);
    var y = va[1];

    if (x < 12) {
        return x + ":" + y + " AM";
    } else {
        if (x === 12) {
            return 12 + ":" + y + " PM";
        } else {
            return (x - 12) + ":" + y + " PM";
        }

    }
}

function modalGuardar() {
    var cont = $('.iModal');
    cont.empty();
}

function plHeader(cont) {
    cont.hide();
    var t = "";
    t += '<div class="row">';
    t += '<div class="col col-12">';
    t += '<center><h2>Horario</h2></center>';
    t += '</div>';
    t += '</div>';
    t += '<fieldset>';
    t += '<div class="col col-12">';
    t += '<div class="col col-sm-12">';
    t += '<div class="smart-form">';
    t += '<label>Tipo de Horario</label>';
    t += '<label class="select">';
    t += '<select class="t_horario" name="HORARIO">';
    t += '<option>Seleccione</option>';
    t += '</select>';
    t += '<i></i></label>';
    t += '</div>';
    t += '</div>';
//    t += '<div class="col col-sm-2">';
//    t += '<a class="btn btn-primary btnGuardarH" style="margin-top : 18px" data-toggle="modal" data-target="#myModalEdit" >Guardar Horario</a>';
//    t += '</div>';
    t += '</div>';
    t += '</fieldset>';
    t += '<hr>';
    cont.empty();
    cont.append(t);
    cont.show(500);
    cargar_horarios($('.t_horario'));
//    $('.btnGuardarH').hide();
    guardar = false;
    $(".t_horario").change(function () {

        if ($(this).val() == '0') {
            $('.hTotal').hide();
            $('.btnSig').hide();
        } else {
            $('.hTotal').show();
            $('.btnSig').show();
        }
        if ($(this).val() === 'CUSTOMIZE') {
            plDiasl($('.contDias'));
            $('.cDia').empty();
        } else {
            if ($(this).val() !== 0) {
                llenar_horario($(this).val());
            }
        }
        disableElements($('.contDias'));
        calc_Horas();
    });
}
function disableElements(el) {
    for (var i = 0; i < el.length; i++) {
        if (el[i].value !== undefined) {
            el[i].readOnly = true;
        } else {
            el[i].disabled = true;
        }
        disableElements(el[i].children);
    }
}
function enableElements(el) {
    for (var i = 0; i < el.length; i++) {
        if (el[i].value !== undefined) {
            el[i].removeAttribute("readOnly");
        } else {
            el[i].removeAttribute("disabled");
        }
        enableElements(el[i].children);
    }
}
function plDiasl(cont, lu, ma, mi, ju, vi, sa, dom) {
    var t = "";
    t += '<fieldset>';
    t += '<div class="col col-12">';
    t += '<div class="col col-sm-12">';
    t += '<h5>D&iacute;as Laborables</h5>';
    t += '</div>';
    t += '</div>';
    t += '<div class="col col-12">';
    t += '<div class="smart-form">';
    t += '<div class="col col-sm-12 inline-group">';
    t += '<label class="checkbox">';
    if (lu) {
        t += '<input class="iLunes" type="checkbox" name="checkbox-inline" checked="checked">';
        diaL($('.cDia'), 'Lunes');
    } else {
        t += '<input class="iLunes" type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Lunes</label>';
    t += '<label class="checkbox">';
    if (ma) {
        t += '<input class="iMartes" type="checkbox" name="checkbox-inline" checked="checked">';
        diaL($('.cDia'), 'Martes');
    } else {
        t += '<input class="iMartes" type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Martes</label>';
    t += '<label class="checkbox">';
    if (mi) {
        t += '<input class="iMiercoles" type="checkbox" name="checkbox-inline" checked="checked">';
        diaL($('.cDia'), 'Miercoles');
    } else {
        t += '<input class="iMiercoles" type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Miercoles</label>';
    t += '<label class="checkbox">';
    if (ju) {
        t += '<input class="iJueves" type="checkbox" name="checkbox-inline" checked="checked">';
        diaL($('.cDia'), 'Jueves');
    } else {
        t += '<input class="iJueves" type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Jueves</label>';
    t += '<label class="checkbox">';
    if (vi) {
        t += '<input class="iViernes" type="checkbox" name="checkbox-inline" checked="checked">';
        diaL($('.cDia'), 'Viernes');
    } else {
        t += '<input class="iViernes" type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Viernes</label>';
    t += '<label class="checkbox">';
    if (sa) {
        t += '<input class="iSabado" type="checkbox" name="checkbox-inline" checked="checked">';
        diaL($('.cDia'), 'Sabado');
    } else {
        t += '<input class="iSabado" type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Sabado</label>';
    t += '<label class="checkbox">';
    if (dom) {
        t += '<input class="iDomingo" type="checkbox" name="checkbox-inline" checked="checked">';
        diaL($('.cDia'), 'Domingo');
    } else {
        t += '<input class="iDomingo" type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Domingo</label>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '</fieldset>';
    t += '<hr>';
    cont.empty();
    cont.append(t);
    $('.iLunes').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Lunes');
        } else {
            $('.dia_Lunes').remove();
        }
        siGuardar();
        calc_Horas();
    });
    $('.iMartes').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Martes');
        } else {
            $('.dia_Martes').remove();
        }
        siGuardar();
        calc_Horas();
    });
    $('.iMiercoles').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Miercoles');
        } else {
            $('.dia_Miercoles').remove();
        }
        siGuardar();
        calc_Horas();
    });
    $('.iJueves').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Jueves');
        } else {
            $('.dia_Jueves').remove();
        }
        siGuardar();
        calc_Horas();
    });
    $('.iViernes').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Viernes');
        } else {
            $('.dia_Viernes').remove();
        }
        siGuardar();
        calc_Horas();
    });
    $('.iSabado').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Sabado');
        } else {
            $('.dia_Sabado').remove();
        }
        siGuardar();
        calc_Horas();
    });
    $('.iDomingo').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Domingo');
        } else {
            $('.dia_Domingo').remove();
        }
        siGuardar();
        calc_Horas();
    });

}
function siGuardar() {
    if (nInputs !== $('.cDia input').size()) {
        if ($('.cDia input').size() < 0) {
            guardar = false;
//            $('.btnGuardarH').hide();

        } else {
            guardar = true;
//            $('.btnGuardarH').show();
        }
        //$('.hTotal').show();
    } else {
        guardar = false;
//        $('.btnGuardarH').hide();
        //$('.hTotal').hide();
    }


}
function diaL(cont, nombre, turnos) {

    if (turnos === undefined) {
        turnos = 2;
    }
    var t = "";
    t += '<div class="col col-sm-6 dia_' + nombre + '">';
    t += '<div class="well" style="margin-bottom: 20px;">';
    t += '<div class="row cTim' + nombre + '">';
    t += '<div class="col col-sm-12">';
    t += '<a class="pull-right dupli' + nombre + '" href="#htotal"><i class="fa fa-copy"></i></a><center><label class="font-md text-primary">' + nombre + '</label></center>';
    t += '</div>';
    t += '</div>';
    t += '<div class="row">';
    t += '<div class="col col-xs-12">';
    t += '<a class="btn text-primary pull-right addTim' + nombre + '"><i class="fa fa-plus"></i></a>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    cont.append(t);
    for (var i = 0; i < turnos; i++) {
        timePick($('.cTim' + nombre), nombre);
    }

    $('.dupli' + nombre).click(function () {
        var lista = new Array('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo');
        for (var i = 0; i < lista.length; i++) {
            var x = $('.cTim' + lista[i] + ' input').size();
            for (var j = 0; j < x; j++) {
                $('.tim' + (j + 1) + lista[i]).val($('.tim' + (j + 1) + nombre).val());
            }
        }
        calc_Horas();
    });
    $('.addTim' + nombre).click(function () {
        timePick($('.cTim' + nombre), nombre);
        siGuardar();
    });

}
function timePick(cont, nombre, desde, hasta) {
    var t = "";
    var c = $('.cTim' + nombre + ' span').size();
    var te = (c / 2) + 1;
    t += '<div class="col col-xs-12 tmpk' + te + nombre + '">';
    t += '<div class="col col-xs-2">T' + te + '</div>';
    t += '<div class="col col-xs-4">';
    t += '<div class="form-group">';
    t += '<div class="input-group">';
    t += '<input class="form-control tim' + (c + 1) + nombre + '" type="text" placeholder="Ingreso" name="HORA_DESDE_' + nombre.substring(0, 3).toLowerCase() + te + '">';
    t += '<input type="hidden" name="DIA_' + nombre.substring(0, 3).toLowerCase() + te + '" value="' + nombre.substring(0, 3).toLowerCase() + '">';
    t += '<span></span>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '<div class="col col-xs-4">';
    t += '<div class="form-group">';
    t += '<div class="input-group">';
    t += '<input class="form-control tim' + (c + 2) + nombre + '" type="text" placeholder="Salida" name="HORA_HASTA_' + nombre.substring(0, 3).toLowerCase() + te + '">';
    t += '<span></span>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '<div class="col col-xs-2">';
    t += '<a class="btn text-danger delTim' + te + nombre + '"><i class="fa fa-times"></i></a>';
    t += '</div>';
    t += '</div>';
    cont.append(t);
    $('.delTim' + te + nombre).click(function () {
        $('.tmpk' + te + nombre).remove();
        $('.t_horario').val("CUSTOMIZE");
        siGuardar();
        calc_Horas();
    });

    $('.tim' + (c + 1) + nombre).timepicker({
        showMeridian: true
    });
    $('.tim' + (c + 2) + nombre).timepicker({
        showMeridian: true
    });
    $('.tim' + (c + 1) + nombre).timepicker().on('changeTime.timepicker', function (e) {
        $('.t_horario').val("CUSTOMIZE");
        calc_Horas();
//        $('.btnGuardarH').show();
        guardar = true;
    });
    $('.tim' + (c + 2) + nombre).timepicker().on('changeTime.timepicker', function (e) {
        $('.t_horario').val("CUSTOMIZE");
        calc_Horas();
//        $('.btnGuardarH').show();
        guardar = true;
    });
    if (desde !== undefined) {
        $('.tim' + (c + 1) + nombre).val(desde);
    }
    if (hasta !== undefined) {
        $('.tim' + (c + 2) + nombre).val(hasta);
    }


}
function logs(msg) {
    //$('.logs').empty();
    $('.logs').append(msg + "<br>");
}
function calc_Horas() {
    var lista = new Array('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo');
    var htotal = 0;
    var mintotal = 0;
    for (var i = 0; i < lista.length; i++) {
        var x = $('.cTim' + lista[i] + ' input').size();
        var y = (x / 2);
        var z = 1;
        for (var j = 0; j < y; j++) {
            var a = $('.tim' + z + lista[i]).val();
            z = z + 1;
            var b = $('.tim' + z + lista[i]).val();
            if (a !== undefined && b !== undefined && a !== b) {
                var ha = a.split(":");
                var hb = b.split(":");
//                if ((parseInt(hb[0]) - parseInt(ha[0])) <= 0) {

                if (ha[1].indexOf("AM") !== -1 && hb[1].indexOf("PM") !== -1) {
                    if (hb[0].indexOf("12") !== -1) {
                        htotal = htotal + (parseInt(hb[0]) - parseInt(ha[0]));
                    } else {
                        htotal = htotal + ((parseInt(hb[0]) + 12) - parseInt(ha[0]));
                    }
                }
                if (ha[1].indexOf("PM") !== -1 && hb[1].indexOf("AM") !== -1) {
                    if (hb[0].indexOf("12") !== -1) {
                        htotal = htotal + (parseInt(hb[0]) - parseInt(ha[0]));
                    } else {
                        htotal = htotal + ((parseInt(hb[0]) + 12) - parseInt(ha[0]));
                    }
                    //htotal = htotal + ((parseInt(hb[0]) + 12) - parseInt(ha[0]));
                }
                if (ha[1].indexOf("AM") !== -1 && hb[1].indexOf("AM") !== -1) {
                    if (ha[0].indexOf("12") !== -1) {
                        if (hb[0].indexOf("12") !== -1) {
                            htotal = htotal + ((parseInt(hb[0])) - parseInt(ha[0]));
                        } else {
                            htotal = htotal + ((parseInt(hb[0]) + 12) - parseInt(ha[0]));
                        }
                    } else {
                        htotal = htotal + (parseInt(hb[0]) - parseInt(ha[0]));
                    }
                    //htotal = htotal + (parseInt(hb[0]) - parseInt(ha[0]));
                }
                if (ha[1].indexOf("PM") !== -1 && hb[1].indexOf("PM") !== -1) {

                    if (ha[0].indexOf("12") !== -1) {
                        if (hb[0].indexOf("12") !== -1) {
                            htotal = htotal + ((parseInt(hb[0])) - parseInt(ha[0]));
                        } else {
                            htotal = htotal + ((parseInt(hb[0]) + 12) - parseInt(ha[0]));
                        }
                    } else {
                        htotal = htotal + (parseInt(hb[0]) - parseInt(ha[0]));
                    }

                }
//
//                } else {
//                    htotal = htotal + (parseInt(hb[0]) - parseInt(ha[0]));
//                }

                mintotal = mintotal + (parseInt(hb[1]) - parseInt(ha[1]));
            }
            z = z + 1;
        }

    }
    if (htotal < 0) {
        htotal = 0;
    }
    var r = (htotal * 60) + mintotal;
    htotal = Math.floor((r / 60));
    mintotal = (r % 60);
    var msg = htotal + " Horas " + mintotal + " Minutos";
    horasT($('.hTotal'), msg, htotal, mintotal);

}
function horasT(cont, msg, htotal, mintotal) {
    if (msg == undefined) {
        msg = '00';
    }
    var t = "";
    t += '<hr>';
    t += '<fieldset>';
    t += '<div class="col col-12">';
    t += '<div class="col col-sm-12">';
    t += '<input class="h_totales" name="h_total" type="hidden" value=' + toDecimal(htotal, mintotal) + ' />';
    t += '<h4>Horas Totales : <span class="text-primary"><strong>' + msg + '</strong></span></h4>';
    t += '</div>';
    t += '</div>';
    t += '</fieldset>';
    cont.empty();
    cont.append(t);
}
function toDecimal(hora, min) {
    var m = parseFloat(min) / 60;
    var h = parseFloat(hora);
    var r = h + m;
    r = r.toFixed(2);
    return r;
}


