/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function initAutorizacion() {
    /*AUTORIZACIONES*/
    ValBtnAutorizarDgp($(".idtr").val(), $(".validacionBtnAutorizar"));
    $(".btn-conti").click(function (e) {
        $.SmartMessageBox({
            title: "Alerta de Confirmación",
            content: "¿Está totalmente seguro de rechazar este requerimiento999?",
            buttons: '[No][Si]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Si") {
                $(".form-rech").submit();
            }
            if (ButtonPressed === "No") {
                return false;
            }
        });
        e.preventDefault();

    });
    $(".btn-autor1").click(function (e) {
        $.SmartMessageBox({
            title: "¡Alerta de Confirmación!",
            content: "¿Está totalmente seguro de autorizar este requerimientoklñklñ?",
            buttons: '[No][Si]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Si") {
                //   window.parent.sendOk();
                // parent.sendOk();
                $(".btn-autor1").attr("disabled", "disabled");
                $(".form-aut").submit();
                //window.sendMessage();
                //window.parent.websocket.send("texto");
            }
            if (ButtonPressed === "No") {
                return false;
            }
        });
        e.preventDefault();
    });
    $(".btn-rech").click(function (e) {
        $.SmartMessageBox({
            title: "Alerta de Confirmación!",
            content: "¿Está totalmente seguro de rechazar este requerimiento?",
            buttons: '[No][Si]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Si") {
                $(".btn-rech").attr("disabled", "disabled")
                $(".btn-mos").click();
                $(".form-rech").submit();
            }
            if (ButtonPressed === "No") {
                return false;
            }
        });
        e.preventDefault();
    });
}
function ValBtnAutorizarDgp(trabajador, divBotones) {
    divBotones.empty();
    $.ajax({
        url: "../../autorizacion", data: "opc=ValBtnAutorizacion&trabajador=" + trabajador, type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.rpta === "1") {
                divBotones.append(data.data);
                $(".btn-autor").click(function (e) {
                    $.SmartMessageBox({
                        title: "¡Alerta de Confirmación!",
                        content: "¿Está totalmente seguro de autorizar este requerimiento?",
                        buttons: '[No][Si]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Si") {
                            //$(".form-aut").submit();
                            $(".btn-autor").attr("disabled", "disabled");
                            $.ajax({url: "../../autorizacion",
                                data: $(".form-aut").serialize(),
                                type: 'POST',
                                success: function (data, textStatus, jqXHR) {
                                    if (data.rpta) {
                                        window.parent.UpdateNotifications();
                                        window.parent.sendMessage();
                                        window.location.href = "../Dgp/Autorizar_Requerimiento.jsp?r=ok";
                                    } else {
                                        alert('ocurrio un error al autorizar el requerimiento.')
                                    }
                                }});
                        }
                        if (ButtonPressed === "No") {
                            return false;
                        }
                    });
                    e.preventDefault();
                });
            } else {
                /*error*/
            }
        }
    });
}

function ShowCbk_Procesar_Ind(iddgp) {
    var div = $(".col_procesar_asigFam");
    var div2 = $(".col_procesar_sis");
    div.empty();
    div2.empty();
    $.ajax({
        url: "../../autorizacion", data: "opc=ShowCkbEstado_procesarIndiviual&iddgp=" + iddgp, type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.rpta === "1") {
                div.append(data.ckbAsigFam);
                div2.append(data.ckbEs_Sis);
                $(".ckbAsigFam").click(function () {
                    var tipo = 1;
                    var ckbAsigFam = $(".ckbAsigFam");
                    procesar_req_individual(ckbAsigFam, tipo, iddgp);
                });
                $(".ckbEstSistema").click(function () {
                    var tipo = 2;
                    var ckb = $(".ckbEstSistema");
                    procesar_req_individual(ckb, tipo, iddgp);
                });
            }
        }
    });

}

function procesar_req_individual(ckb, tipo, iddgp) {
    var array_id_dgp = [];
    var estado = false;
    array_id_dgp[0] = ckb.val();
    if (ckb.prop('checked')) {
        estado = true;
    } else {
        estado = false;
    }
    var url = (tipo === 1) ? "../../autorizacion?opc=UpdateStatusDgp_Procesar&tipo=1&estado=" + estado : "../../autorizacion?opc=UpdateStatusDgp_Procesar&tipo=2&estado=" + estado;
    $.ajax({
        url: url, data: {json: array_id_dgp}, type: 'POST', dataType: 'json', success: function (data, textStatus, jqXHR) {
            if (data.rpta === "1") {
                //  ShowCbk_Procesar_Ind(iddgp);
                $.smallBox({
                    title: "Se ha procesado correctamente el requerimiento...",
                    content: "<i class='fa fa-clock-o'></i> <i>2 segundos atras...</i>",
                    color: "#296191",
                    iconSmall: "fa fa-thumbs-up bounce animated",
                    timeout: 4000
                });
            } else if (data.rpta === "-1") {
                $.smallBox({
                    title: "¡Atención!",
                    content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar el requerimiento...</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 4000
                });
            }

        }
    });
}
 
