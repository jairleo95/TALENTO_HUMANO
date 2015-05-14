/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function crear_tabla(cont, col) {
    cont.empty();
    var tabb = "";
    alert(col[i]);
    tabb += '<table class="table table-striped table-bordered table-hover tabla_t" width="100%"><thead><tr>';
    for (var i = 0; i < col.length; i++) {
        alert(col[i]);
        tabb += "<td>" + col[i] + "</td>";
    }
    tabb += '</tr></thead><tbody class="tbodys"></tbody></table>';
    cont.append(tabb);
}
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