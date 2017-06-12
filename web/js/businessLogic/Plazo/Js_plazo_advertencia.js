function listar_mensaje_plazo(tipo, warning, info, req) {
    $.post("../../plazo_dgp", "opc=Listar&tipo=" + tipo, function (objJson) {
        warning.empty();
        info.empty();
        var lista = objJson.lista;
        if (objJson.rpta === "-1") {
            alert(objJson.mensaje);
            return;
        } else {
            if (lista.length > 0) {
                for (var i = 0; i < lista.length; i++) {
                    if (tipo === '2') {
                        warning.append("<div class='alert alert-danger alert-block' >" +
                                "<a class='close' data-dismiss='alert' href='#'></a><h4 class='alert-heading'>" + lista[i].nom + "</h4>" +
                                lista[i].det + " , Fecha Plazo " + lista[i].desde + " al " + lista[i].hasta + "</div>");
                        info.append('<div class="alert alert-info fade in" style="font-size:20px"><i class="fa-fw fa fa-info"></i><strong>&iexcl;Importante!</strong> Su requerimiento ser&aacute; procesado en el mes de <strong>' + lista[i].mes + '.</strong></div>');
                    } else if (tipo === '1') {
                        // warning.append("<div class='alert alert-danger alert-block' ><a class='close' data-dismiss='alert' href='#'></a><h4 class='alert-heading'>" + lista[i].nom + "</h4>" + lista[i].det + " , se tiene " + lista[i].dias_tol + " dias de tolerancia para la fecha de inicio.</div>");
                        info.append('<div class="alert alert-warning fade in" ><button class="close" data-dismiss="alert"></button><i class="fa-fw fa fa-warning"></i><strong>&iexcl;Advertencia - Inicio de contrato!</strong> ' + lista[i].dias_tol + ' dias - ' + lista[i].det + '' + '.</div>');
                    }
                }
            }
        }   
    });
}

function AlertCumplimientoPlazo_Fecha(fecha) {
    $.post("../../dgp", "opc=Val_Fe_Inicio&fecha=" + fecha, function (objJson) {
        if (objJson.rpta==="1") {
            if (objJson.estado) {
            $.bigBox({
                title: "&iexcl;Alerta de plazo no cumplido!",
                content: "Si registra con esta fecha de inicio : " + fecha + ",  el requerimiento estara en fuera de plazo. &iexcl;NECESITA HACER SOLICITUD AL TERMINAR REGISTRO!",
                color: "#C79121",
                icon: "fa fa-warning shake animated",
                timeout: 3500
                        // number: "1",
                        //timeout: 15000
            });
        } else {
            $.bigBox({
                title: "&iexcl;Plazo cumplido!",
                content: "Con la fecha de inicio :" + fecha + " el plazo para este requerimiento se cumplir&aacute;.",
                color: "#739E73",
                icon: "fa fa-shield fadeInLeft animated",
                timeout: 3500
                        // ,number: "1",
                        //timeout: 15000
            });
        }
        }else {
           alert(objJson.mensaje);
        }
        
    });
}

