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
function plDiasl(cont,lu,ma,mi,ju,vi,sa,dom) {
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
    if(lu){
        t += '<input type="checkbox" name="checkbox-inline" checked="checked">';
    }else{
        t += '<input type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Lunes</label>';
    t += '<label class="checkbox">';
    if(ma){
        t += '<input type="checkbox" name="checkbox-inline" checked="checked">';
    }else{
        t += '<input type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Martes</label>';
    t += '<label class="checkbox">';
    if(mi){
        t += '<input type="checkbox" name="checkbox-inline" checked="checked">';
    }else{
        t += '<input type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Miercoles</label>';
    t += '<label class="checkbox">';
    if(ju){
        t += '<input type="checkbox" name="checkbox-inline" checked="checked">';
    }else{
        t += '<input type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Jueves</label>';
    t += '<label class="checkbox">';
    if(vi){
        t += '<input type="checkbox" name="checkbox-inline" checked="checked">';
    }else{
        t += '<input type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Viernes</label>';
    t += '<label class="checkbox">';
    if(sa){
        t += '<input type="checkbox" name="checkbox-inline" checked="checked">';
    }else{
        t += '<input type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Sabado</label>';
    t += '<label class="checkbox">';
    if(dom){
        t += '<input type="checkbox" name="checkbox-inline" checked="checked">';
    }else{
        t += '<input type="checkbox" name="checkbox-inline">';
    }
    t += '<i></i>Domingo</label>';
    t += '</div>';
    t += '</div>';
    t += '</div>';
    t += '</fieldset>';
    cont.empty();
    cont.append(t);
    cont.show(200);
}
