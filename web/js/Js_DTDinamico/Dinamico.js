/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function crear_tabla(cont, col) {
    cont.empty();
    var tabb = "";
    tabb += '<table class="table table-striped table-bordered table-hover tabla_t" width="100%"><thead><tr>';
    for (var i = 0; i < col.length; i++) {
        tabb += "<td>" + col[i] + "</td>";
    }
    tabb += '</tr></thead><tbody class="tbodys"></tbody></table>';
    cont.append(tabb);
    $('.tabla_t').DataTable();
}
function cargar_tabla(url, data,tbody) {
    $.post(url, data, function (objJson) {
        var list = objJson.lista;
        tbody.empty();
        var tex = "";
        for (var i = 0; i < list.length; i++) {
            tex += "<tr>";
            tex += "<td class='valId" + (i + 1) + "' value='" + list[i].id + "'>" + (i + 1) + "</td>";
            tex += "<td class='valNombre" + (i + 1) + "'>" + list[i].nombre + "</td>";
            if (list[i].nom_corto == undefined) {
                tex += "<td class='valNCorto" + (i + 1) + "'>No asignado</td>";
            } else {
                tex += "<td class='valNCorto" + (i + 1) + "'>" + list[i].nom_corto + "</td>";
            }
            if (list[i].estado == 1) {
                tex += "<td class='valEstado" + (i + 1) + "' value='1' style='background-color: #f0fff0;'>Habilitado</td>";
            } else if (list[i].estado == 2) {
                tex += "<td class='valEstado" + (i + 1) + "' value='2' style='background-color: #fff0f0;'>Deshabilitado</td>";
            }
            if (list[i].filial == 1) {
                tex += "<td class='valFilial" + (i + 1) + "' value='1'>Lima</td>";
            } else if (list[i].filial == 2) {
                tex += "<td class='valFilial" + (i + 1) + " ' value='2'>Juliaca</td>";
            } else if (list[i].filial == 5) {
                tex += "<td class='valFilial" + (i + 1) + "' value='5'>Tarapoto</td>";
            }
            tex += '<td><center><div class="btn-group"><button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">';
            tex += 'Accion <span class="caret"></span></button><ul class="dropdown-menu" role="menu">';
            tex += '<li><a class="btnEditar" value=' + (i + 1) + '>Editar</a></li>';
            if (list[i].estado == 1) {
                tex += '<li><a class="btnDes" value=' + (i + 1) + '>Deshabilitar</a></li>';
            } else if (list[i].estado == 2) {
                tex += '<li><a class="btnHab" value=' + (i + 1) + '>Habilitar</a></li>';
            }
            tex += '<li><a class="btnEliminar" value=' + (i + 1) + '>Eliminar</a></li></ul></div></center></td>';
            tex += "</tr>";
        }
        tbody.append(tex);
        tex = "";
    });
}
