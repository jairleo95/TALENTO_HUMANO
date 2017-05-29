/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var l = [];
l[0] = "lun";
l[1] = "mar";
l[2] = "mie";
l[3] = "jue";
l[4] = "vie";
l[5] = "sab";
l[6] = "dom";
var lb = [];
lb[0] = "Lunes";
lb[1] = "Martes";
lb[2] = "Miércoles";
lb[3] = "Jueves";
lb[4] = "Viernes";
lb[5] = "Sabado";
lb[6] = "Domingo";
function listHorario(id_dgp) {
    var url = '../../horario?iddgp=' + id_dgp;
    var data = 'opc=Listar2';
    $.post(url, data, function (objJson) {
        var listas = objJson.listar;
        if (listas.length > 0) {
            $(".tipoh").empty();
            $(".tipoh").append("Oficina");
            $(".conTablas").empty();
            for (var j = 0; j < l.length; j++) {
                var f = 0;
                var t = '';
                var d = 0;
                for (var i = 0; i < listas.length; i++) {
                    if (listas[i].dia_horario.toString() === l[j].toString()) {
                        d = d + 1;
                        t += '<tr>';
                        t += '<td>Turno ' + d + '</td>';
                        t += '<td>' + listas[i].ho_desde + '</td>';
                        t += '<td>' + listas[i].ho_hasta + '</td>';
                        t += '</tr>';
                        f = 1;
                    }
                }
                if (f > 0) {
                    var g = createTableHorario(j);
                    $(".conTablas").append(g);
                    $(".data" + l[j] + "").empty();
                    $(".data" + l[j] + "").append(t);
                }
            }
          //  $(".dataHor").dataTable();
        } else {
            $(".conTablas").empty();
            $(".conTablas").append('<div class="alert alert-danger">No sujeto a fiscalización</div>');
        }
    });
}
function createTableHorario(a) {
    var t = '<div class="col-md-12">';
    t += '<table class="table table-condensed table-bordered dataHor">';
    t += '<thead>';
    t += '<tr>';
    t += '<th colspan="3" style="background:#01579b ;color:white;"><center>' + lb[a] + '</center></th>';
    t += '</tr>';
    t += '</thead>';
    t += '<tbody class="data' + l[a] + '">';
    t += '</tbody>';
    t += '</table>';
    t += '</div>';
    return t;
}
