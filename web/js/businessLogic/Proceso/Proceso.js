/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function initFormProcess() {
    listar_Proceso();
    $("#select-proceso").change(function () {
        $(".lb-list_pasos").text($(this).find(":selected").text());
        Listar_Paso($(this).val());
        $(".form_puesto").hide();
        $(".tbody-puesto").empty();
        // alert($(this).val());
    });
}
function listar_Proceso() {
    var s = $("#select-proceso");
    s.append("<option >Cargando...</option>");
    $.post("../../Proceso", "opc=Listar", function (objJson) {
        s.empty();
        var lista = objJson.lista;
        s.append("<option value='' selected >[Proceso]</option>");
        for (var j = 0; j < lista.length; j++) {
            s.append("<option value='" + lista[j].id + "' > " + lista[j].nombre + "</option>");
        }
    });
}