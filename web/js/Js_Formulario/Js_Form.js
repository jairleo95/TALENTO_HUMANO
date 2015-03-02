/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function list_select(objSelect, url, datos, opc, id) {
    var text_html = "";
    objSelect.empty();
    objSelect.append("<option  value='' >Cargando...</option>");
    $.post(url, datos, function (objJson) {
        objSelect.empty();
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length > 0) {
            objSelect.append("<option value=''>[SELECCIONE]</option>");
            if (opc == "1") {
                for (var i = 0; i < lista.length; i++) {
                    if (id == lista[i].id) {
                        text_html += "<option selected value='" + lista[i].id + "'>" + lista[i].nombre + "</option>";
                    } else {
                        text_html += "<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>";
                    }
                }
            } else {
                for (var i = 0; i < lista.length; i++) {
                    text_html += "<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>";
                }
            }
        } else {
            objSelect.append("<option value=''>[]</option>");
        }
        objSelect.append(text_html);
        text_html = "";

    });
}