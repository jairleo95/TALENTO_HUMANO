/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $('.inpEstado > option[value=1]').attr('selected', 'selected');
    GifLoader($('.div_t'), "Espere..", 1);
    
});
function GifLoader(contenedor, msg, action) {
    $('.headerr').hide();
    var text = "";
    contenedor.empty();
    if (action == 1) {
        text += "<div class='caja' style='height:250px; width:150px; margin:auto;'><center><h3>" + msg + "</h3></center></div>";
    } else if (action == 2) {
        text += "<div style='height:150px; width:150px; margin:auto; padding-top:30px;'><center><h3>" + msg + "</h3></center></div>";
    }
    contenedor.append(text);
}
function crear_t(contenedor, columnas) {
    var tabb = "";
    tabb += '<table class="table table-striped table-bordered table-hover tabla_t" width="100%"><thead><tr>';
    for (var i = 0; i < columnas.length; i++) {
        tabb += '<td>' + columnas[i] + '</td>';
    }
    tabb += '</tr></thead><tbody class="tbodys"></tbody></table>';
    contenedor.empty();
    contenedor.append(tabb);
}
