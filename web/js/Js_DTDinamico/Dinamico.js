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
    for(var i=0;i<col.length;i++){
        alert(col[i]);
        tabb+="<td>"+col[i]+"</td>";
    }
    tabb += '</tr></thead><tbody class="tbodys"></tbody></table>';
    cont.append(tabb);
}
