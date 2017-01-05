/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    function reload_table(table) {
            var breakpointDefinition = {
                tablet: 1024,
                phone: 480
            };
            var responsiveHelper_dt_basic = undefined;
            /*  var responsiveHelper_datatable_fixed_column = undefined;
             var responsiveHelper_datatable_col_reorder = undefined;
             var responsiveHelper_datatable_tabletools = undefined;*/

            table.dataTable({
                "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                        "t" +
                        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                "autoWidth": true,
                "preDrawCallback": function () {
                    // Initialize the responsive datatables helper once.
                    if (!responsiveHelper_dt_basic) {
                        responsiveHelper_dt_basic = new ResponsiveDatatablesHelper(table, breakpointDefinition);
                    }
                },
                "rowCallback": function (nRow) {
                    responsiveHelper_dt_basic.createExpandIcon(nRow);
                },
                "drawCallback": function (oSettings) {
                    responsiveHelper_dt_basic.respond();
                }
            });
        }
        function procesar_lista(lista, tipo, tipo_lista) {
            var array_id_dgp = [];
            var pos = 0;
            var estado = true;
            var url = (tipo === 1) ? "../../autorizacion?opc=UpdateStatusDgp_Procesar&estado=" + estado + "&tipo=1" : "../../autorizacion?opc=UpdateStatusDgp_Procesar&estado=" + estado + "&tipo=2";
            if (tipo === 1) {
                for (var i = 0, max = lista; i < max; i++) {
                    if ($(".chkAsigFam" + i).prop('checked')) {
                        array_id_dgp[pos] = $(".chkAsigFam" + i).val();
                        pos++;
                    }
                }
            } else if (tipo === 2) {
                for (var i = 0, max = lista; i < max; i++) {
                    if ($(".chkActSistEs" + i).prop('checked')) {
                        array_id_dgp[pos] = $(".chkActSistEs" + i).val();
                        pos++;
                    }
                }
            }

            if (array_id_dgp.length > 0) {
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {json: array_id_dgp},
                    dataType: 'json',
                    success: function (data) {
                        if (data.rpta == "1") {
                            $.SmartMessageBox({
                                title: "¡Atención!",
                                content: "¿Está seguro de procesar " + array_id_dgp.length + " requerimiento(s)?",
                                buttons: '[No][Si]'
                            }, function (ButtonPressed) {
                                if (ButtonPressed === "Si") {
                                    listar_autorizados(true);
                                    listar_autorizados(false);
                                    $.smallBox({
                                        title: "Se ha procesado correctamente los requerimientos...",
                                        content: "<i class='fa fa-clock-o'></i> <i>2 segundos atras...</i>",
                                        color: "#296191",
                                        iconSmall: "fa fa-thumbs-up bounce animated",
                                        timeout: 4000
                                    });
                                }

                            });
                        } else {
                            $.smallBox({
                                title: "¡Atención!",
                                content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar los requerimientos...</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 4000
                            });
                        }


                    },
                    error: function () {
                        $.smallBox({
                            title: "¡Atención!",
                            content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar los requerimientos...</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 4000
                        });

                    }
                });
            }
        }
        function listar_autorizados(tipo_lista) {

            $.post("../../autorizacion", "opc=ShowListProcesarReq&tipo_lista=" + tipo_lista, function (objJson) {
                var lista = objJson.lista;
                if (objJson.rpta === -1) {
                    alert(objJson.mensaje);
                    return;
                } else {
                    if (tipo_lista) {
                        $('.imprimir_tabla').empty();
                        $('.imprimir_tabla').append(objJson.html_table);
                        $(".tbody_procesar_req").append(objJson.text_html);
                    } else {
                        $('.imprimir_tabla_aut').empty();
                        $('.imprimir_tabla_aut').append(objJson.html_table);
                        $(".tbody_procesar_req_aut").append(objJson.text_html);
                    }


                    $(".btnAsigFam").click(function () {
                        procesar_lista(lista, 1, tipo_lista);
                    });
                    $(".btnActSisEs").click(function () {
                        procesar_lista(lista, 2, tipo_lista);
                    });
                    if (tipo_lista) {
                        reload_table($("#table_procesar"));
                    } else {
                        reload_table($("#table_autorizados"));
                    }

                }
            });
        }
        $(document).ready(function () {
            pageSetUp();
            $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
            });
            listar_autorizados(true);
            listar_autorizados(false);

        });
