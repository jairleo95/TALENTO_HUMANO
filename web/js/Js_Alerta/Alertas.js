
/*nction alerta() {
 //un alert
 alertify.alert("<b>Blog Reaccion Estudio</b> probando Alertify", function () {
 //aqui introducimos lo que haremos tras cerrar la alerta.
 //por ejemplo -->  location.href = 'http://www.google.es/';  <-- Redireccionamos a GOOGLE.
 });
 }
 function alerta_dt_ingresados() {
 //un alert
 alertify.alert("<b>Datos del Trabajador Ingresados Correctamente...</b> ", function () {
 
 });
 }*/

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
                warning.append("<div class='alert alert-danger alert-block' ><a class='close' data-dismiss='alert' href='#'></a><h4 class='alert-heading'>" + lista[i].nom + "</h4>" + lista[i].det + " , Fecha Plazo " + lista[i].desde + " al " + lista[i].hasta + "</div>");
                info.append('<div class="alert alert-info fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-info"></i><strong>¡Importante!</strong> Su requerimiento será procesado en el mes de <strong>' + lista[i].mes + '.</strong></div>');
            } else if (tipo == '1') {
                warning.append("<div class='alert alert-danger alert-block' ><a class='close' data-dismiss='alert' href='#'></a><h4 class='alert-heading'>" + lista[i].nom + "</h4>" + lista[i].det + " , se tiene " + lista[i].dias_tol + " dias de tolerancia para la fecha de inicio.</div>");
                info.append('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert"></button><i class="fa-fw fa fa-warning"></i><strong>¡Advertencia - Inicio de contrato!</strong> el plazo establece que se debe registrar a partir de esta fecha de inicio  ' + lista[i].fe_tol + '.</div>');
            }
        }
    });
}

/*
 function confirmar() {
 //un confirm
 alertify.confirm("<p>Aqu� confirmamos algo.<br><br><b>ENTER</b> y <b>ESC</b> corresponden a <b>Aceptar</b> o <b>Cancelar</b></p>", function (e) {
 if (e) {
 alertify.success("Has pulsado '" + alertify.labels.ok + "'");
 } else {
 alertify.error("Has pulsado '" + alertify.labels.cancel + "'");
 }
 });
 return false
 }
 
 function datos() {
 //un prompt
 alertify.prompt("Esto es un <b>prompt</b>, introduce un valor:", function (e, str) {
 if (e) {
 alertify.success("Has pulsado '" + alertify.labels.ok + "'' e introducido: " + str);
 } else {
 alertify.error("Has pulsado '" + alertify.labels.cancel + "'");
 }
 });
 return false;
 }
 
 function notificacion() {
 alertify.log("Esto es una notificaci�n cualquiera.");
 return false;
 }
 function Hola() {
 alertify.log("Hola.");
 return false;
 }
 function Esperar() {
 alertify.success("Porfavor espere... el formulario esta cargando.");
 return false;
 }
 function Autorizado() {
 alertify.success("El Requerimiento ha sido procesado con exito...!!!");
 return false;
 }
 
 
 function ok() {
 alertify.success("El Requerimiento ha sido procesado con exito...!!! ");
 return false;
 }
 
 function error() {
 alertify.error("Usuario o constrase�a incorrecto/a.");
 return false;
 }*/
