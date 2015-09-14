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
        calc_Horas();
    });
    $('.iMartes').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Martes');
        } else {
            $('.dia_Martes').remove();
        }
        calc_Horas();
    });
    $('.iMiercoles').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Miercoles');
        } else {
            $('.dia_Miercoles').remove();
        }
        calc_Horas();
    });
    $('.iJueves').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Jueves');
        } else {
            $('.dia_Jueves').remove();
        }
        calc_Horas();
    });
    $('.iViernes').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Viernes');
        } else {
            $('.dia_Viernes').remove();
        }
        calc_Horas();
    });
    $('.iSabado').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Sabado');
        } else {
            $('.dia_Sabado').remove();
        }
        calc_Horas();
    });
    $('.iDom').click(function () {
        if ($(this).is(':checked')) {
            diaL($('.cDia'), 'Domingo');
        } else {
            $('.dia_Domingo').remove();
        }
        calc_Horas();
    });
}
function diaL(cont, nombre) {
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
    t += '<a href="#" class="btn text-primary pull-right addTim' + nombre + '"><i class="fa fa-plus"></i></a>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    cont.append(t);
    timePick($('.cTim' + nombre), nombre);
    timePick($('.cTim' + nombre), nombre);
    $('.tim1' + nombre).val("00:00");
    $('.tim2' + nombre).val("00:00");
    $('.tim3' + nombre).val("00:00");
    $('.tim4' + nombre).val("00:00");
    $('.tim1' + nombre).timepicker({
        showMeridian: true
    });
    $('.tim2' + nombre).timepicker({
        showMeridian: true
    });
    $('.tim3' + nombre).timepicker({
        showMeridian: true
    });
    $('.tim4' + nombre).timepicker({
        showMeridian: true
    });
    $('.tim1' + nombre).timepicker().on('changeTime.timepicker', function (e) {
        calc_Horas();
    });
    $('.tim2' + nombre).timepicker().on('changeTime.timepicker', function (e) {
        calc_Horas();
    });
    $('.tim3' + nombre).timepicker().on('changeTime.timepicker', function (e) {
        calc_Horas();
    });
    $('.tim4' + nombre).timepicker().on('changeTime.timepicker', function (e) {
        calc_Horas();
    });
    $('.dupli' + nombre).click(function () {
        var lista = new Array('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo');
        for (var i = 0; i < lista.length; i++) {
            $('.tim1' + lista[i]).val($('.tim1' + nombre).val());
            $('.tim2' + lista[i]).val($('.tim2' + nombre).val());
            $('.tim3' + lista[i]).val($('.tim3' + nombre).val());
            $('.tim4' + lista[i]).val($('.tim4' + nombre).val());
        }
        calc_Horas();
    });
    $('.addTim' + nombre).click(function () {
        timePick($('.cTim' + nombre), nombre);
    });

}
function timePick(cont, nombre) {
    var t = "";
    var c = $('.cTim' + nombre + ' input').size();
    var te = (c / 2) + 1;
    t += '<div class="col col-xs-12 tmpk' + te + nombre + '">';
    t += '<div class="col col-xs-1">T' + te + '</div>';
    t += '<div class="col col-xs-5">';
    t += '<div class="form-group">';
    t += '<div class="input-group">';
    t += '<input class="form-control tim' + (c + 1) + nombre + '" type="text" placeholder="Ingreso">';
    t += '<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '<div class="col col-xs-5">';
    t += '<div class="form-group">';
    t += '<div class="input-group">';
    t += '<input class="form-control tim' + (c + 1) + nombre + '" type="text" placeholder="Salida">';
    t += '<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '<div class="col col-xs-1">';
    t += '<a class="btn text-danger delTim' + (c + 1) + nombre + '"><i class="fa fa-times"></i></a>';
    t += '</div>';
    t += '</div>';
    cont.append(t);
    $('.delTim' + (c + 1) + nombre).click(function () {
        $('.tmpk' + te + nombre).remove();
    });

    $('.tim' + (c + 1) + nombre).timepicker({
        showMeridian: true
    });
    $('.tim' + (c + 1) + nombre).timepicker().on('changeTime.timepicker', function (e) {
        calc_Horas();
    });


}
function calc_Horas() {
    var lista = new Array('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo');
    var htotal = 0;
    var mintotal = 0;
    for (var i = 0; i < lista.length; i++) {
        var x = $('.cTim' + lista[i] + ' input').size();
        x = (x / 2) + 1;
        var y = 1;
        for (var j = 0; j < x; j++) {
            var a = $('.tim' + y + lista[i]).val();
            var b = $('.tim' + (y + 1) + lista[i]).val();
            y = y + 2;
            if (a !== undefined && b !== undefined) {
                var ha = a.split(":");
                var hb = b.split(":");
                htotal = htotal + (parseInt(hb[0]) - parseInt(ha[0])) ;
                mintotal = mintotal + (parseInt(hb[1]) - parseInt(ha[1])) + (parseInt(hd[1]) - parseInt(hc[1]));
            }
        }

        var c = $('.tim3' + lista[i]).val();
        var d = $('.tim4' + lista[i]).val();

    }
    if (htotal < 0) {
        htotal = 0;
    }
    var r = (htotal * 60) + mintotal;
    htotal = Math.floor((r / 60));
    mintotal = (r % 60);
    var msg = htotal + " horas " + mintotal + " minutos";
    horasT($('.hTotal'), msg);

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
    t += '<h4>Horas Totales : <span class="text-primary"><strong>' + hora + '</strong></span></h4>';
    t += '</div>';
    t += '</div>';
    t += '</fieldset>';
    cont.empty();
    cont.append(t);
}
