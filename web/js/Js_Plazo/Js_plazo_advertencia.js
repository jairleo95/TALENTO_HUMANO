function listar_mensaje_plazo(tipo, warning, info, req) {
    $.post("../../plazo_dgp", "opc=Listar&tipo=" + tipo, function (objJson) {
        warning.empty();
        info.empty();
        var lista = objJson.lista;
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        for (var i = 0; i < lista.length; i++) {
            if (tipo == '2') {
                warning.append("<div class='alert alert-danger alert-block' >" +
                        "<a class='close' data-dismiss='alert' href='#'></a><h4 class='alert-heading'>" + lista[i].nom + "</h4>" + 
                        lista[i].det + " , Fecha Plazo " + lista[i].desde + " al " + lista[i].hasta + "</div>");
                info.append('<div class="alert alert-info fade in" style="font-size:20px"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-info"></i><strong>¡Importante!</strong> Su requerimiento será procesado en el mes de <strong>' + lista[i].mes + '.</strong></div>');
            } else if (tipo == '1') {
                // warning.append("<div class='alert alert-danger alert-block' ><a class='close' data-dismiss='alert' href='#'></a><h4 class='alert-heading'>" + lista[i].nom + "</h4>" + lista[i].det + " , se tiene " + lista[i].dias_tol + " dias de tolerancia para la fecha de inicio.</div>");
                info.append('<div class="alert alert-warning fade in" ><button class="close" data-dismiss="alert"></button><i class="fa-fw fa fa-warning"></i><strong>¡Advertencia - Inicio de contrato!</strong> ' + lista[i].dias_tol + ' dias - ' + lista[i].det + '' + '.</div>');
            }
        }
    });
}