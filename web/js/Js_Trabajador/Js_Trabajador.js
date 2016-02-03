/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function showEsDiezmo() {
    var obj = $(".div_input_diezmo");
    obj.hide(100);
    obj.empty();
    $.ajax({
        url: "../../trabajador", data: "opc=ModDiezmoDetalleTrabajador&id=" + $(".idtr").val(), type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.rpta) {
                obj.append(data.html);
                obj.show(100);
                $(".cbkDiezmo").click(function () {
                    $.SmartMessageBox({
                        title: "&iexcl;Alerta!",
                        content: "Esta seguro de modificar la autorizaci&oacute;n de descuento diezmo?",
                        buttons: '[No][Si]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Si") {
                            if ($(".cbkDiezmo").prop("checked")) {
                                $.ajax({
                                    url: "../../trabajador", data: "opc=UpdateEsDiezmo&id=" + $(".idtr").val() + "&estado=0", type: 'POST', success: function (data, textStatus, jqXHR) {
                                        if (data.status) {
                                            $(".cbkDiezmo").prop("checked", false);
                                            $.smallBox({
                                                title: "&iexcl;Atenci&oacute;n!",
                                                content: "<i class='fa fa-clock-o'></i> <i>Se neg&oacute; el descuento de diezmo...</i>",
                                                color: "#C46A69",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 6000
                                            });
                                        }

                                    }
                                });
                            } else {
                                $.ajax({
                                    url: "../../trabajador", data: "opc=UpdateEsDiezmo&id=" + $(".idtr").val() + "&estado=1", type: 'POST', success: function (data, textStatus, jqXHR) {
                                        if (data.status) {
                                            $(".cbkDiezmo").prop("checked", true);
                                            $.smallBox({
                                                title: "&iexcl;Atenci&oacute;n!",
                                                content: "<i class='fa fa-clock-o'></i> <i>Se autoriz&oacute; el descuento de diezmo...</i>",
                                                color: "#659265",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 6000
                                            });
                                        }
                                    }
                                });
                            }
                            showEsDiezmo();


                        }
                    });
                    return false;


                });
            }
        }
    });
}
function porcentaje_datos(trabajador) {
    $.ajax({
        url: "../../trabajador", data: "opc=ShowPorcentageTrabajador&id=" + trabajador, type: 'POST', success: function (data, textStatus, jqXHR) {
            $('.pcDatosCompTrabajador').data('easyPieChart').update(data.porcentaje);
        }});
}
function Listar_Cod_Huella() {
    var row_cod_huella = $(".row_cod_huella");
    row_cod_huella.empty();
    $.ajax({
        url: "../../empleado", data: "opc=ShowHuella&idtr=" + $(".idtr").val(), type: 'POST', success: function (data, textStatus, jqXHR) {
            row_cod_huella.append(data.value);
            $(".textCodHuella").keypress(function (event) {
                return /\d/.test(String.fromCharCode(event.keyCode));
            });
            $(".btnHuellaDigital").click(function () {
                Actualizar_Cod_Huella();
            });
            $(".btnHuellaDigital").attr("rel", "tooltip");
            $(".btnHuellaDigital").attr("title", "Actualizar");
            $(".btnHuellaDigital").tooltip();
            $(".btnHuellaDigital").tooltip();
        }
    });
}
function Listar_Cod_APS() {
    var row_cod_aps = $(".row_cod_aps");
    row_cod_aps.empty();
    $.ajax({
        url: "../../empleado", data: "opc=ShowAPS&idtr=" + $(".idtr").val(), type: 'POST', success: function (data, textStatus, jqXHR) {
            row_cod_aps.append(data.value);
            $(".txtCodigoAPS").keypress(function (event) {
                return /\d/.test(String.fromCharCode(event.keyCode));
            });
            $(".btnCodigoAPS").tooltip();
            $(".btnCodigoAPS").click(function () {
                Actualizar_Cod_APS();
                ValBtnAutorizarDgp($(".idtr").val(), $(".validacionBtnAutorizar"));
            });
        }
    });
}
 function Actualizar_Cod_Huella() {
            var co_huella = $(".textCodHuella").val();
            if (co_huella !== "") {
                $.ajax({
                    url: "../../empleado",
                    type: "POST",
                    data: "opc=validar_huella&co_hue=" + co_huella
                }).done(function (e) {
                    if (e.huella == 0) {
                        $.ajax({
                            url: "../../empleado", data: "opc=reg_huella&idtr=" + $(".idtr").val() + "&cod=" + co_huella, type: 'POST', success: function (data, textStatus, jqXHR) {
                                if (data.rpta === "1") {
                                    // Listar_Cod_Huella();
                                    /*validar los botones de autorizar req*/                                     ValBtnAutorizarDgp($(".idtr").val(), $(".validacionBtnAutorizar"));
                                    $.smallBox({
                                        title: "Se ha actualizado exitosamente el codigo de huella...",
                                        content: "<i class='fa fa-clock-o'></i> <i>2 seconds ago...</i>",
                                        color: "#296191", iconSmall: "fa fa-thumbs-up bounce animated", timeout: 4000
                                    });

                                } else {
                                    $.smallBox({
                                        title: "¡Alerta!",
                                        content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar los datos...</i>",
                                        color: "#C46A69",
                                        iconSmall: "fa fa-cloud bounce animated",
                                        timeout: 7000
                                    });
                                }
                            }
                        });
                    }
                    else {
                        $.SmartMessageBox({
                            title: "¡Este Código de Huella ya fue registrado!",
                            content: "Por favor Ingrese un Código de Huella distinto"
                        });
                    }

                });
            }
        }
        function Actualizar_Cod_APS() {
            var co_aps = $(".txtCodigoAPS").val();
            if (co_aps !== "") {
                $.ajax({
                    url: "../../empleado",
                    type: "POST",
                    data: "opc=validar_aps&co_aps=" + co_aps
                }).done(function (e) {
                    if (e.aps === 0) {
                        $.ajax({
                            url: "../../empleado", data: "opc=reg_aps&idtr=" + $(".idtr").val() + "&cod=" + co_aps, type: 'POST', success: function (data, textStatus, jqXHR) {
                                if (data.rpta === "1") {
                                    // Listar_Cod_Huella();
                                    /*validar los botones de autorizar req*/
                                    ValBtnAutorizarDgp($(".idtr").val(), $(".validacionBtnAutorizar"));
                                    $.smallBox({
                                        title: "Se ha actualizado exitosamente el codigo APS...",
                                        content: "<i class='fa fa-clock-o'></i> <i>2 seconds ago...</i>",
                                        color: "#296191",
                                        iconSmall: "fa fa-thumbs-up bounce animated",
                                        timeout: 4000
                                    });

                                } else {
                                    $.smallBox({
                                        title: "¡Alerta!",
                                        content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar los datos...</i>",
                                        color: "#C46A69",
                                        iconSmall: "fa fa-cloud bounce animated",
                                        timeout: 7000
                                    });
                                }
                            }
                        });
                    }
                    else {
                        $.SmartMessageBox({
                            title: "¡Este Código APS ya fue registrado!",
                            content: "Por favor Ingrese un Código APS distinto"});
                    }

                });
            }
        }
        function  ShowAFP_SP() {
            /*show  afp y sp*/
            $(".row_afp_sp").empty();
            $.ajax({url: "../../trabajador", data: "opc=ShowAFP_SP&id=" + $(".idtr").val(), type: 'POST', success: function (data, textStatus, jqXHR) {
                    if (data.rpta === "1") {
                        $(".row_afp_sp").append(data.html);
                    }
                }});

            /*end show afp y sp*/
        }