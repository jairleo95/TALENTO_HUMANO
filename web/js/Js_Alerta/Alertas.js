
            function alerta() {
                //un alert
                alertify.alert("<b>Blog Reaccion Estudio</b> probando Alertify", function() {
                    //aqui introducimos lo que haremos tras cerrar la alerta.
                    //por ejemplo -->  location.href = 'http://www.google.es/';  <-- Redireccionamos a GOOGLE.
                });
            }
               function alerta_dt_ingresados() {
                //un alert
                alertify.alert("<b>Datos del Trabajador Ingresados Correctamente...</b> ", function() {
               
                });
            }
               

            function confirmar() {
                //un confirm
                alertify.confirm("<p>Aquí confirmamos algo.<br><br><b>ENTER</b> y <b>ESC</b> corresponden a <b>Aceptar</b> o <b>Cancelar</b></p>", function(e) {
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
                alertify.prompt("Esto es un <b>prompt</b>, introduce un valor:", function(e, str) {
                    if (e) {
                        alertify.success("Has pulsado '" + alertify.labels.ok + "'' e introducido: " + str);
                    } else {
                        alertify.error("Has pulsado '" + alertify.labels.cancel + "'");
                    }
                });
                return false;
            }

            function notificacion() {
                alertify.log("Esto es una notificación cualquiera.");
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
            

            function ok() {
                alertify.success("Visita nuestro <a href=\"http://blog.reaccionestudio.com/\" style=\"color:white;\" target=\"_blank\"><b>BLOG.</b></a>");
                return false;
            }

            function error() {
                alertify.error("Usuario o constraseña incorrecto/a.");
                return false;
            }
