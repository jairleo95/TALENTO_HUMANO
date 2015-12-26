/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 function listar_plazo_tipo(tipo) {
                if (tipo.val() == '2') {
                    $(".fe_inicio").val("");
                    $(".fe_inicio").attr("type", "month");
                    $(".lb_fecha_solicitud").text("Mes :");
                    $(".tipo_fecha").val("month");
                }
                if (tipo.val() == '1') {
                    $(".fe_inicio").attr("type", "date");
                    $(".fe_inicio").val($(".fe_desde_dgp").val());
                    $(".lb_fecha_solicitud").text("Fecha de Inicio :");
                    $(".tipo_fecha").val("date");
                }
                list_select($(".plazo"), "../../plazo_dgp?opc=List_id_plazo", $(".solicitud_plazo").serialize() + "&id=" + $(".dgp").val(), "1", $(".tipo").val());

            }
            $(document).ready(function () {
                pageSetUp();
                $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                    $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                });
                $(".btn_terminar").click(function () {
                    $.SmartMessageBox({
                        title: "¡Advertencia!",
                        content: "¿Esta seguro(a) de enviar el Requerimiento?",
                        buttons: '[No][Si]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Si") {
                            $(".form_terminar_req").submit();
                        }
                        if (ButtonPressed === "No") {
                        }
                    });
                });
                $(".btn_solicitud").click(function () {
                    var body_modal = $(".body_mdal_sol");
                    body_modal.empty();
                    $.post("../../solicitud_requerimiento", "opc=Val_Envio_Solicitud&iddgp=" + $(".dgp").val(), function (objJson) {
                        var html = objJson.html;
                        body_modal.append(html);
                        if (objJson.estado) {
                            listar_plazo_tipo($(".tipo"));
                        }
                        $(".tipo").change(function () {
                            listar_plazo_tipo($(this));
                        });

                        $(".sbm_solicitud").click(function (e) {
                            if ($(".solicitud_plazo").valid() == true) {
                                $.SmartMessageBox({
                                    title: "¡Advertencia!",
                                    content: "¿Esta seguro de enviar la solicitud?",
                                    buttons: '[No][Si]'
                                }, function (ButtonPressed) {
                                    if (ButtonPressed === "Si") {
                                        $.ajax({
                                            url: "../../solicitud_requerimiento",
                                            type: "post",
                                            data: $(".solicitud_plazo").serialize() + "&opc=Registrar_solicitud" + "&iddgp=" + $(".dgp").val()
                                        }).done(function () {
                                            $('.solicitud_plazo')[0].reset();
                                            var $p = $(this).parent().parent();
                                            $p.removeClass('has-success');
                                            $('.btn_terminar').prop('disabled', true);
                                            // $('.btn_solicitud').prop('disabled', true);
                                            $('.btn_solicitud').hide(200);
                                            $('.btn_solicitud').remove();
                                            $("section > label").removeClass('state-success');
                                            $(".aviso_cumplimiento").hide(200);
                                            $(".aviso_cumplimiento").empty();
                                            $(".aviso_cumplimiento").append('<div class="alert alert-success fade in div_dgp"><i class="fa-fw fa fa-check"></i>Usted tiene una solicitud en proceso, una vez que se haya autorizado se podrá procesar el <strong>requerimiento</strong>.</div>');
                                            $(".aviso_cumplimiento").show(200);
                                            /*vuelve a cargar el selector para evitar enviar solicitudes del mismo plazo*/
                                            //list_select($(".plazo"), "../../plazo_dgp?opc=List_id_plazo", $(".solicitud_plazo").serialize(), "1", $(".tipo").val());
                                            $.smallBox({
                                                title: "Exito!",
                                                content: "<i class='fa fa-clock-o'></i> <i>La solicitud ha sido enviada exitosamente...</i>",
                                                color: "#659265",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 4000
                                            });

                                        }).error(function () {
                                            $.smallBox({
                                                title: "Error!",
                                                content: "<i class='fa fa-clock-o'></i> <i>La solicitud no ha podido ser enviada...</i>",
                                                color: "#C46A69",
                                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                                timeout: 4000
                                            });
                                        });
                                    }
                                    if (ButtonPressed === "No") {
                                    }
                                });
                            } else {
                                $.smallBox({
                                    title: "¡Error!",
                                    content: "<i class='fa fa-clock-o'></i> <i>Ingrese Datos correctos</i>",
                                    color: "#C46A69",
                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                    timeout: 4000
                                });
                            }
                        });
                    });
                });
            })