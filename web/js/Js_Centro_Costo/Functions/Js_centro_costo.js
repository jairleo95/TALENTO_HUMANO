function listar_centro_costo(x, opc, arr_cc) {
    var centro_costo = $(".centro_costo" + x);
    $.post("../../centro_costo?opc=Listar_CC", "&id_dep=" + $(".cc-dep" + x).val(), function (objJson) {
        centro_costo.empty();
        centro_costo.append("<option value=''>[CENTRO COSTO]</option>");
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (opc == "1") {
                if (arr_cc[4] == lista[i].id) {
                    centro_costo.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                } else {
                    centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                }
            } else {
                centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
            }
        }
    });
}