/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function cargar_horarios(sel, dep) {

    $.post("../../formato_horario", "opc=Listar_Tip_Horario&dep=" + dep, function (objJson) {
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        var horario = sel;
        horario.empty();
        horario.append('<option value="" >[SELECCIONE]</option>');
        for (var i = 0; i < lista.length; i++) {
            horario.append('<option value="' + lista[i].id + '" >' + lista[i].nombre + '</option>');
        }
    });
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
    t += '<div class="col col-sm-10">';
    t += '<div class="smart-form">';
    t += '<label>Tipo de Horario</label>';
    t += '<label class="select">';
    t += '<select class="t_horario">';
    t += '<option>Seleccione</option>';
    t += '<option>Opcion1</option>';
    t += '</select>';
    t += '<i></i></label>';
    t += '</div>';
    t += '</div>';
    t += '<div class="col col-sm-2">';
    t += '<a class="btn btn-primary" style="margin-top : 18px">Crear Horario</a>';
    t += '</div>';
    t += '</div>';
    t += '</fieldset>';
    t += '<hr>';
    cont.empty();
    cont.append(t);
    cont.show(500);
    $(".t_horario").change(function () {
        plDiasl($('.contDias'));
    });
}
function plDiasl(cont, lu, ma, mi, ju, vi, sa, dom) {
    cont.hide(200);
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
        t += '<input class="iDom" type="checkbox" name="checkbox-inline" checked="checked">';
        diaL($('.cDia'), 'Domingo');
    } else {
        t += '<input class="iDom" type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Domingo</label>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '</fieldset>';
    cont.empty();
    cont.append(t);
    cont.show(200);
    $('.iLunes').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Lunes');
        } else {
            $('.dia_Lunes').remove();
        }
    });
    $('.iMartes').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Martes');
        } else {
            $('.dia_Martes').remove();
        }
    });
    $('.iMiercoles').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Miercoles');
        } else {
            $('.dia_Miercoles').remove();
        }
    });
    $('.iJueves').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Jueves');
        } else {
            $('.dia_Jueves').remove();
        }
    });
    $('.iViernes').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Viernes');
        } else {
            $('.dia_Viernes').remove();
        }
    });
    $('.iSabado').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Sabado');
        } else {
            $('.dia_Sabado').remove();
        }
    });
    $('.iDom').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Domingo');
        } else {
            $('.dia_Domingo').remove();
        }
    });
}
function diaL(cont, nombre) {
    var t = "";
    t += '<div class="col col-sm-6 dia_' + nombre + '">';
    t += '<div class="well" style="margin-bottom: 20px;">';
    t += '<div class="row">';
    t += '<div class="col col-sm-12">';
    t += '<center><label class="font-md text-primary">' + nombre + '</label></center>';
    t += '</div>';
    t += '<div class="col col-xs-12">';
    t += '<div class="col col-xs-2">T1</div>';
    t += '<div class="col col-xs-5">';
    t += '<div class="form-group">';
    t += '<div class="input-group">';
    t += '<input class="form-control tim1' + nombre + '" type="text" placeholder="Ingreso">';
    t += '<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '<div class="col col-xs-5">';
    t += '<div class="form-group">';
    t += '<div class="input-group">';
    t += '<input class="form-control tim2' + nombre + '" type="text" placeholder="Salida">';
    t += '<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '<div class="col col-xs-12">';
    t += '<div class="col col-xs-2">T2</div>';
    t += '<div class="col col-xs-5">';
    t += '<div class="form-group">';
    t += '<div class="input-group">';
    t += '<input class="form-control tim3' + nombre + '" type="text" placeholder="Ingreso">';
    t += '<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '<div class="col col-xs-5">';
    t += '<div class="form-group">';
    t += '<div class="input-group">';
    t += '<input class="form-control tim4' + nombre + '" type="text" placeholder="Salida">';
    t += '<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    cont.append(t);
    $('.tim1' + nombre).val("00:00");
    $('.tim2' + nombre).val("00:00");
    $('.tim3' + nombre).val("00:00");
    $('.tim4' + nombre).val("00:00");
    $('.tim1' + nombre).timepicker({
        showMeridian: false
    });
    $('.tim2' + nombre).timepicker({
        showMeridian: false
    });
    $('.tim3' + nombre).timepicker({
        showMeridian: false
    });
    $('.tim4' + nombre).timepicker({
        showMeridian: false
    });
    $('.tim1' + nombre).timepicker().on('changeTime.timepicker', function (e) {
//    alert('The time is ' + e.time.value);
//    alert('The hour is ' + e.time.hours);
//    alert('The minute is ' + e.time.minutes);
//    alert('The meridian is ' + e.time.meridian);
        calc_Horas();
    });

}
function calc_Horas() {
    var lista = new Array('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo');
    var htotal = 0;
    var mintotal = 0;
    for (var i = 0; i < lista.length; i++) {
        var a = $('.tim1' + lista[i]).val();
        var b = $('.tim2' + lista[i]).val();
        var c = $('.tim3' + lista[i]).val();
        var d = $('.tim4' + lista[i]).val();
        if (a !== undefined && b !== undefined && c !== undefined && d !== undefined) {
            var ha = a.split(":");
            var hb = b.split(":");
            var hc = c.split(":");
            var hd = d.split(":");
            htotal =htotal+ (parseInt(hb[0]) - parseInt(ha[0])) + (parseInt(hd[0]) - parseInt(hc[0]));
            mintotal = mintotal+ (parseInt(hb[1]) - parseInt(ha[1])) + (parseInt(hd[1]) - parseInt(hc[1]));
            if(mintotal>60){
                alert(mintotal%60);
            }
        }

    }
    var msg=htotal + " " + mintotal;
    horasT($('.hTotal'),msg);

}
function horasT(cont, hora) {
    if (hora == undefined) {
        hora = '00';
    }
    var t = "";
    t += '<hr>';
    t += '<fieldset>';
    t += '<div class="col col-12">';
    t += '<div class="col col-sm-12">';
    t += '<h4>Horas Totales : <span class="text-primary">' + hora + '</span></h4>';
    t += '</div>';
    t += '</div>';
    t += '</fieldset>';
    cont.empty();
    cont.append(t);
}
