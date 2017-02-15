var idpcaItem = "";
var iddgpItem = "";
var urlCrudForm = "carga_academica";
var dataAditional = "";
var idRow = "";
var idtrItem = "";
function initCAGlobalEvents() {
    $(".btnInitUpdateCAData").tooltip();
    $(".btnInitUpdateCAData").click(function () {
        var data = {
            "opc": "initUpdateCAData"
        };
        console.log("init Update carga Acedmica")
        $(".btnInitUpdateCAData").attr("disabled", true);
        $.ajax({
            url: urlCrudForm, type: 'POST', data: data, success: function (data, textStatus, jqXHR) {
                if (data.status) {
                    console.log(data);

                } else {
                    console.log("disabled btn")
                    $(".btnInitUpdateCAData").removeAttr("disabled");
                }
            }
        });
    });

    $(".btnStopSyncUpAcargaAcademica").click(function () {
        console.log("init event onclick in btnStopSyncUpAcargaAcademica")
        var data = {
            "opc": "stopSyncUpCargaAcademica"
        };
        console.log("init Update carga Acedmica")
        8//  $(".btnInitUpdateCAData").attr("disabled",true);
        $.ajax({
            url: urlCrudForm, type: 'POST', data: data, success: function (data, textStatus, jqXHR) {
                if (data.status) {
                    console.log(data);

                } else {
                    console.log("disabled btn")
                    //$(".btnInitUpdateCAData").removeAttr("disabled");
                }
            }
        });
    });

    $(".btnUpdateCAData").click(function () {
        console.log("update...");
        var data = {
            "opc": "updateCAData",
            "semestre": "2017-1"
        };
        $.ajax({
            url: urlCrudForm,
            data: data, type: 'POST', success: function (data, textStatus, jqXHR) {
                if (data.status) {
                    console.log("data updated...");
                } else {
                    console.log("ocurrio uhn error al actualizar");
                }
            }
        });
    });
}
function initDatatableCargaAcademica() {
    var responsiveHelper1 = undefined;
    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };
    var objDatatableCagaAcad = $('.datatableCargaAcademica');
    console.log("responsiveHelper1:" + (typeof responsiveHelper1 === "function"));

    objDatatableCagaAcad.DataTable({
        "ajax": {
            "url": urlCrudForm,
            "type": "POST",
            "dataSrc": "data",
            "data": {
                "opc": "listCargaAcademica"
            }
        },
        "columns": [
            {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            }, {
                "data": "es_tipo_doc"
            }, {
                "data": function (data) {
                    return data.nu_doc.trim();
                }
            }, {
                "data": function (data) {
                    return data.ap_paterno + " " + data.ap_materno + " " + data.no_trabajador;
                }
            }, {
                "data": "no_facultad"
            }, {
                "data": "no_eap"
            }, {
                "data": "no_s_educativa",
                "defaultContent": ""
            }, {
                "data": "profesion_docente",
                "defaultContent": ""
            }, {
                "data": function (data) {
                    return data.de_condicion.trim();
                }
            }, {
                "data": "de_carga"
            }
            , {
                "data": function (data) {
                    var x = "";
                    if (typeof data.fe_desde !== "undefined") {
                        x = data.fe_desde;
                    } else {
                        x = "<input type='text' class='dateDesdeItem form-control input-sm' style='width:100px'/>";
                    }
                    return x;
                }
            }
            , {
                "data": function (data) {
                    var x = "";
                    if (typeof data.fe_hasta !== "undefined") {
                        x = data.fe_hasta;
                    } else {
                        x = "<input type='text' class='dateHastaItem form-control input-sm' style='width:100px'/>";
                    }
                    return x;
                }
            }

        ],
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>"
                + "t"
                + "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "oLanguage": {
            "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
        }, "autoWidth": true,
        "preDrawCallback": function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper1) {
                console.log(":enter to preDrawCallback true condition");
                responsiveHelper1 = new ResponsiveDatatablesHelper(objDatatableCagaAcad, breakpointDefinition);
            }
        }, "rowCallback": function (row, data, index) {
            responsiveHelper1.createExpandIcon(row);
            console.log(":enter to rowCallback");

            var dataToSent = '';
            dataToSent = 'nro_doc=' + data.nu_doc + '&ap_p=' + data.ap_paterno + '&ap_m=' + data.ap_materno + '&no_tr=' + data.no_trabajador + '&ti_doc=' +
                    data.es_tipo_doc + '&eap=' + data.no_eap + '&facultad=' + data.no_facultad + '&ciclo=' + data.de_carga + '&idtr=' + data.id_trabajador;
            //console.log(dataToSent);
            var htmlTD = '';
            htmlTD += '<div class="btn-group">'
                    + '<button class="btn btn-primary dropdown-toggle bounceIn animated" data-toggle="dropdown">'
                    + '<i class="fa fa-gear fa-lg"></i>'
                    + '</button>'
                    + ' <ul class="dropdown-menu">';
            if (data.validateExistTrabajador !== "") {
                htmlTD += ' <li>'
                        + '<a href="carga_academica?opc=Completar_Datos&' + dataToSent + '">Completar Datos</a>'
                        + ' </li>'
                        + ' <li class="divider"></li>'
                        + '<li>'
                        + '<li>'
                        + ' <a  data-toggle="modal" data-target="#myModal" data-backdrop="static" '
                        + '  data-keyboard="false" class="btnCargaAcademica"'
                        + ' data-valor="' + dataToSent + '" data-idtr="' + data.id_trabajador + '" '
                        + ' data-item="' + (index + 1) + '" '
                        + ' data-idpca="' + data.id_proceso_carga_ac + '"'
                        + '   >Carga Academica</a>'
                        + ' </li>';
            } else {
                htmlTD += '   <li>'
                        + '  <a href="carga_academica?opc=Completar_Datos&' + dataToSent + '" >Completar Datos</a>'
                        + '</li>';
            }
            htmlTD += ' </ul>'
                    + '    </div>';

            $('td:eq(0)', row).html(htmlTD);
        }, "drawCallback": function (oSettings) {
            responsiveHelper1.respond();
            // var api = this.api();
            console.log(":Enter to drawCallBack");
            initDatatableEvents(objDatatableCagaAcad);
        }
    });
}
function initDatatableEvents(objDatatableCagaAcad) {
    /*carga academica*/
    $(".dateDesdeM").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        dateFormat: 'dd/mm/yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onClose: function (selectedDate) {
            $(this).parents("tr").find($(".dateHastaM")).datepicker("option", "minDate", selectedDate);
        }
    });
    $(".dateHastaM").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        dateFormat: 'dd/mm/yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onClose: function (selectedDate) {
            $(this).parents("tr").find($(".dateDesdeM")).datepicker("option", "maxDate", selectedDate);
        }
    });
    $(".dateDesdeItem").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        dateFormat: 'dd/mm/yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onClose: function (selectedDate) {
            $(this).parents("tr").find($(".dateHastaItem")).datepicker("option", "minDate", selectedDate);
        }
    });
    $(".dateHastaItem").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        dateFormat: 'dd/mm/yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onClose: function (selectedDate) {
            $(this).parents("tr").find($(".dateDesdeItem")).datepicker("option", "maxDate", selectedDate);
        }
    });


    $(".btnCargaAcademica").click(function () {
        var currentItem = $(this).data("item");
        idpcaItem = $(this).data("idpca");
        var objBodyPrint = $(".areaModal");
        var dataSent = $(this).data("valor");
        idtrItem = $(this).data("idtr");
        console.log("currentIten :" + currentItem);
        showCargaAcademica(objBodyPrint, dataSent, function () {
            pageSetUp();
            initFormPlugins();
            if (idpcaItem !== "") {
                //console.log("enter to true condition id:"+idpca)
                var cuotas = $(".cuota_docente");
                getPagoDocente(idpcaItem, cuotas);
                getProcesoCargaAcademicaById(idpcaItem, function (item) {
                    $(".btnAceptarCuotasCA").hide();
                    $(".btnProcesar").show('fast');
                    iddgpItem = item.idDgp.idDgp;
                    getTiHoraPago($(".divSelectTiHoraPAGO"), function (obj) {
                        $(".TiHoraPago").val(item.idTipoHoraPago.idTiHoraPago);
                        $(".TiHoraPago").attr("disabled", "disabled");
                    });
                });
                $(".btnProcesar").click(function () {
                    ProcesarCargaAcademica();
                });
            } else {
                $(".fe_desde_p, .fe_hasta_p, .hl_docente, .TiHoraPago").change(function () {
                    var tiHoraPago = $(".TiHoraPago option[value|='" + $(".TiHoraPago").val() + "']").data("valor");
                    calcularCuotasDocente($(".fe_desde_p").val(), $(".fe_hasta_p").val(), $(".hl_docente").val(), tiHoraPago);
                });
                getTiHoraPago($(".divSelectTiHoraPAGO"));
                $(".btnAceptarCuotasCA").click(function () {
                    var data = {
                        "opc": "Registrar_CA",
                        "id": idtrItem,
                        "idTiHoraPago": $(".TiHoraPago").val()
                    };
                    $.ajax({
                        url: "carga_academica?" + $(".form_carga_academica").serialize() + "&" + dataSent,
                        type: "POST",
                        data: data
                    }).done(function (data) {
                        if (data.rpta === true) {
                            $.fn.dataTable
                                    .Api(objDatatableCagaAcad).ajax
                                    .reload();
                            $.smallBox({
                                title: "Registrado!",
                                content: "<i class='fa fa-clock-o'></i> <i>Se ha almacenado correctamente...</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 6000
                            });

                            $(".proceso").val(data.proceso);
                            $(".dgp").val(data.dgp);
                            $(".btnAceptarCuotasCA").hide();
                            $(".btnProcesar").show('fast');
                        }
                    });
                });

            }
        });
    });
}
function getTiHoraPago(objDivSelect, callback) {
    objDivSelect.empty();
    console.log("cargando tipo de hora pago...");
    var data = {
        "opc": "getTiHoraPago",
        "idtr": idtrItem
    };
    $.ajax({
        url: "trabajador", data: data, type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.status) {
                objDivSelect.append(data.html);
                callback();
            } else {
                console.log("Error al cargar el tipo de hora pago");
            }
        }
    });
}
function getPagoDocente(id, divObj) {
    var data = {
        "opc": "getPagoDocenteHtml",
        "id": id
    };
    $.ajax({
        url: "pago_docente", data: data, type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.status) {
                divObj.empty();
                divObj.append(data.html);
                console.log(data.html);
            } else {
                console.log("Error al cargar las cuotas del docente");
            }
        }
    });
}
function getProcesoCargaAcademicaById(id, callback) {
    var data = {
        "opc": "getProcesoCargaAcademicaById",
        "id": id
    };
    $.ajax({
        url: "carga_academica", data: data, type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.status) {
                var item = data.item;
                $(".fe_desde_p").val(item.feDesde);
                $(".fe_hasta_p").val(item.feHasta);
                $(".hl_docente").val(item.caTotalHl);

                $(".fe_desde_p").attr("disabled", "disabled");
                $(".fe_hasta_p").attr("disabled", "disabled");
                $(".hl_docente").attr("disabled", "disabled");
                callback(item);
            } else {
                console.log("Error al cargar proceso carga academica");
            }
        }
    });
}
/*FIN carga academica*/
function showCargaAcademica(objBodyPrint, dataAjax, callback) {
    var url = 'carga_academica';
    var fila = 1;
    var columna = 0;
    var g = 0;
    $(".modalTitle").text("");
    objBodyPrint.empty();
    $.ajax({url: "carga_academica?opc=horarioCursosAcademico", type: 'POST', success: function (htmlContent, textStatus, jqXHR) {
            objBodyPrint.append(htmlContent);
            /*test*/

            $.post(url, 'opc=getDetCargaAcademica&' + dataAjax, function (data) {
                var dataList = data.list;
                $(".modalTitle").text(dataList[0].ap_paterno + " " + dataList[0].ap_materno + " " + dataList[0].no_trabajador);
                $.each(dataList, function (index, dataItem) {
                    var myArray = dataItem.de_horario.trim();
                    //console.log(myArray);
                    $('.bodyCursos').append('<span class="badge bg-color-blueLight">' + (g + 1) + '</span> '
                            + dataItem.no_curso + '</br><li> ' + dataItem.no_eap + '</li><li>' + dataItem.de_tipo_curso + '</li>');
                    for (var i = 0; i < myArray.length; i++) {
                        columna++;
                        if (myArray[i] === "1") {
                            $(".fila-" + fila + " .columna-" + columna).append('<span class="badge bg-color-blueLight">' + (g + 1) + '</span>');
                        }
                        if (columna === 7) {
                            columna = 0;
                            fila++;
                        }
                    }
                    fila = 1;
                    columna = 0;
                    g++;
                    /*end print html*/
                });
                callback();
            });
        }});
}
function ProcesarCargaAcademica() {
    $.ajax({
        url: "carga_academica", data: {
            "opc": "Procesar",
            "dgp": iddgpItem,
            "proceso": idpcaItem
        }, type: "POST"
    }).done(function (data) {
        if (data.rpta) {
            //   window.location.href = "../../carga_academica?opc=Reporte_Carga_Academica";
        }
    });
}
function calcularCuotasDocente(valorFeDesde, valorFeHasta, valorHorasLaborales, valorTipoHoraPago) {
    var cuotas = $(".cuota_docente");
    cuotas.empty();
    $.post("pago_docente", "opc=Listar_Cuotas&fe_desde=" + valorFeDesde + "&fe_hasta=" + valorFeHasta
            + "&pago_semanal=" + (parseFloat(valorHorasLaborales) * parseFloat(valorTipoHoraPago)), function (objJson) {
        var lista = objJson.lista;
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        } else {
            cuotas.append("<div class='row text-center'>");
            cuotas.append("<div class='col-md-3 text-center'><label class='txt-color-blueDark'>Mes</label></div>");
            cuotas.append("<div class='col-md-5 text-center'><label class='txt-color-blueDark'>Fecha Pago Aprox.</label></div>");
            cuotas.append("<div class='col-md-4 text-center'><label class='txt-color-blueDark'>Monto</label></div>");
            cuotas.append("</div>");
            for (var i = 0; i < lista.length; i++) {
                cuotas.append(lista[i].html);
            }
            cuotas.append('<input type="hidden" value="' + lista.length + '" name="num_itera">');
        }
    });
}