/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var anno = '';
var mes = '';
function drawHeaderDatatable() {
    var texto_html = '';
    texto_html += '<table id="authorizedRequirements" class="table table-striped table-bordered table-hover" width="100%">'
            + '<thead><tr><th class="hasinput"></th>'
            + '<th class="hasinput icon-addon" style="width:100px"><input placeholder="Fecha" class="form-control filtrar_fecha">'
            + ' <label for="dateselect_filter" class="glyphicon glyphicon-calendar no-margin padding-top-15" rel="tooltip" title="" data-original-title="Filter Date"></label>'
            + '  </th> <th class="hasinput" ><input type="text" class="form-control" placeholder="Filtrar por nombre" /></th>'
            + '<th class="hasinput" ><input type="text" class="form-control" placeholder="Filtrar por puesto" /> </th>'
            + '<th class="hasinput" ><input type="text" class="form-control" placeholder="Filtrar por area" /> </th>'
            + '<th class="hasinput" ><input type="text" class="form-control" placeholder="Filtrar por departamento" /></th>'
            + '<th class="hasinput"  > </th>'
            + ' <th class="hasinput" ></th>'
            + '  <th class="hasinput"></th>'
            + ' <th class="hasinput" > </th>'
            + ' <th class="hasinput" ></th>' +
            '</tr>'
            + '  <tr data-hide="phone,tablet"> <th><strong>Nro</strong></th>'
            + '<th ><strong>MES PROCESADO</strong></th>'
            + '  <th data-class="expand" ><strong>Apellidos Y Nombres</strong></th>'
            + '  <th data-hide="phone,tablet"><strong>Puesto</strong></th>'
            + '  <th data-hide="phone,tablet"><strong>Area</strong></th>'
            + '  <th data-hide="phone,tablet"><strong>Departamento</strong></th>'
            + '  <th data-hide="phone,tablet" style="width:18%"><strong>Requerimiento</strong></th>'
            + '  <th ><strong>Descripcion</strong></th>'
            + ' <th  data-hide="phone,tablet">Fecha de Creación</th> '
            + '<th  data-hide="phone,tablet">Fecha de Autorización</th>'
            + ' <th  data-hide="phone,tablet">Motivo</th>'
            + ' <th  data-hide="phone,tablet">MFL</th>  </tr>'
            + '</thead><tbody class="tbody_autorizado"> </tbody> </table>';
    $('.imprimir_tabla').empty();
    $('.imprimir_tabla').append(texto_html);
    $('.filtrar_fecha').datepicker({
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'MM yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onClose: function (dateText, inst) {
            filtrar_mes_anno();
        }
    });
    $('.filtrar_fecha').datepicker('setDate', new Date());
}
function filtrar_mes_anno() {
    var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
    var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
    $('.filtrar_fecha').datepicker('setDate', new Date(anno, mes, 1));
    mes = month;
    anno = year;
    listar_autorizados(mes, anno);
}
function initDatatableAuthorizedRequirements() {
    console.log("enter to initDatatableAuthorizedRequirements function");
    drawHeaderDatatable();
    var responsiveHelper_datatable_fixed_column = undefined;
    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };
    var uriAuthorizedRequirements = "../../autorizacion";
    var otable = $('#authorizedRequirements').DataTable({
        "processing": true,
        "serverSide": true,
        "pageLength": 10,
        "ajax": {
            "url": uriAuthorizedRequirements,
            "type": "POST",
            "dataSrc": "data",
            "data": {
                "opc": "List_Dgp_Aut"
            }
        },
        "columns": [
            {
                "data": "row_number"

            }, {
                "data": "mes_anno_aut"
            }, {
                "data": function (data) {
                    return data.ap_p + " " + data.ap_m + " " + data.nombre;
                }
            }, {
                "data": "puesto"
            }, {
                "data": "area"
            }, {
                "data": "dep"
            }
            , {
                "data": "req"
            }
            , {
                "data": "paso"
            }
            , {
                "data": "fecha_c"
            }
            , {
                "data": "fecha_aut"
            }
            , {
                "data": function (data) {
                    var txt = '';
                    if (data.motivo === "1") {
                        txt += 'Trabajador Nuevo';
                    } else if (data.motivo === '2') {
                        txt += 'Renovación';
                    }
                    return txt;
                }
            }
            , {
                "data": function (data) {
                    var txt = '';
                    if (data.mfl === "0") {
                        txt += 'No';
                    } else if (data.mfl === '1') {
                        txt += 'Si';
                    }
                    return txt;
                }
            }
        ],
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6 hidden-xs'f><'col-sm-6 col-xs-12 hidden-xs'<'toolbar'>>r>" +
                "t" +
                "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "autoWidth": true,
        "preDrawCallback": function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper_datatable_fixed_column) {
                responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#authorizedRequirements'), breakpointDefinition);
            }
        },
        "rowCallback": function (nRow) {
            responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
        },
        "drawCallback": function (oSettings) {
            responsiveHelper_datatable_fixed_column.respond();
        }

    });
    // Apply the filter
    $("#authorizedRequirements thead th input[type=text]").on('keyup change', function () {
        otable.column($(this).parent().index() + ':visible').search(this.value).draw();
    });
}
function listar_autorizados(mes, anno) {
    var text_html = "";
    /* $.post("../../autorizacion", "opc=List_Dgp_Aut&mes=" + mes + "&anno=" + anno, function (objJson) {
     var lista = objJson.data;
     if (objJson.rpta === -1) {
     alert(objJson.mensaje);
     return;
     }
     var count = 0;
     for (var i = 0; i < lista.length; i++) {
     count++;
     text_html += "<tr>";
     text_html += "<td>" + (count) + "</td>";
     text_html += "<td>" + lista[i].mes_anno_aut + "</td>";
     text_html += "<td>" + lista[i].ap_p + " " + lista[i].ap_m + " " + lista[i].nombre + "</td>";
     text_html += "<td>" + lista[i].puesto + "</td>";
     text_html += "<td>" + lista[i].area + "</td>";
     text_html += "<td>" + lista[i].dep + "</td>";
     text_html += "<td>" + lista[i].req + "</td>";
     text_html += "<td class='text-success'><strong>" + lista[i].paso + "</strong></td>";
     text_html += "<td>" + lista[i].fecha_c + "</td>";
     text_html += "<td>" + lista[i].fecha_aut + "</td>";
     if (lista[i].motivo === '1') {
     text_html += "<td>Trabajador Nuevo</td>";
     } else if (lista[i].motivo === '2') {
     text_html += "<td>Renovación</td>";
     }
     
     if (lista[i].mfl === '0') {
     text_html += "<td>No</td>";
     } else if (lista[i].mfl === '1') {
     text_html += "<td>Si</td>";
     }
     text_html += "</tr>";
     }
     crear_tabla();
     $(".tbody_autorizado").append(text_html);
     text_html = "";
     reload_table();
     });*/
    //  initDatatableAuthorizedRequirements();
}
/*CARGA ACADEMICA*/
function loadDatatableCargaAcademica() {
    $.ajax({
        url: "../../autorizacion", data: "opc=headerTableAutorizacionCA", type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.access) {
                $(".tHeadAutCA").append(data.htmlHeader);
                $(".tBodyAutCA").append(data.htmlBody);
                $(".popoverPlazo").popover({
                    html: true
                });
                $(".tableAutCargaAcademica").DataTable({
                    "initComplete": function (settings, json) {
                        var api = this.api();
                        console.log(" filas:" + api.rows().length);
                        $(".badgeAutCAcademico").text(api.rows().length).show();
                    }
                });
            }
        }
    });
}
/*END CARGA CADEMICA*/

var statusBarAut = $(".statusBarAut");
function statusBtnSendToRem() {
    if ($(".envioRem").length == 0) {
        $(".btn_pro_remuneracion").attr("disabled", "disabled");
        return false;
    } else {
        $(".btn_pro_remuneracion").removeAttr("disabled");
        return true;
    }
}
function statusBtnSendFirma() {
    if ($(".firm_contr").length == 0) {
        $(".btn_pro_firma").attr("disabled", "disabled");
        return true;
    } else {
        $(".btn_pro_firma").removeAttr("disabled");
        return false;
    }
}
function statusFirmaAndRem() {
    if (!statusBtnSendToRem() == true & statusBtnSendFirma() == true) {
        $(".btnProcesarFirmaAndRem").attr("disabled", "disabled");
    } else {
        $(".btnProcesarFirmaAndRem").removeAttr("disabled");
    }
}

function nobackbutton() {
    window.location.hash = "no-back-button";
    window.location.hash = "Again-No-back-button"; //chrome

    window.onhashchange = function () {
        window.location.hash = "";
    };
}
function exito(titulo, mensaje) {
    $.smallBox({
        title: titulo,
        content: mensaje,
        color: "#739E73",
        iconSmall: "fa fa-cloud",
        timeout: 3000
    });
}
function procesarFirmas(callback, callbackOnItem) {
    $.each($(".firm_contr"), function () {
        var currentInputFirma = $(this);
        var valAut = currentInputFirma.parents('tr').find(".valAut");
        if (currentInputFirma.prop('checked')) {
            $.ajax({
                async: false,
                url: "../../contrato",
                type: "POST", success: function (data, textStatus, jqXHR) {
                    if (data.rpta) {
                        console.log("status firma updated:" + data.rpta);
                        $.ajax({
                            async: false,
                            url: "../../autorizacion",
                            type: "POST", success: function (data, textStatus, jqXHR) {
                                if (data.rpta) {
                                    console.log("autorizado!");
                                    var table = new $.fn.dataTable.Api('#dt_basic1');
                                    var thisTD = currentInputFirma.parents("td");

                                    currentInputFirma.parent().remove();
                                    thisTD.append("Si");
                                    thisTD.next().empty();
                                    thisTD.next().append('<div class="smart-form"><label class="toggle"><input type="checkbox" value=""  class="envioRem"  name="estado" name="checkbox - toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label></div>');
                                    /*Agregar Boton*/
                                    exito("Procesado con exito!", "Se ha actualizado el contrato");
                                    statusBtnSendToRem();
                                    statusBtnSendFirma();
                                    statusFirmaAndRem();
                                    if (typeof callbackOnItem !== 'undefined') {
                                        console.log("Enter to callbackOnItem:" + valAut.val());
                                        callbackOnItem(valAut, data);
                                    }
                                }
                            },
                            data: "opc=Aceptar" + valAut.val()
                        });
                    }

                },
                data: "opc=Actualizar_Firma" + valAut.val()
            });
        }
    });
    if (typeof callback !== 'undefined') {
        callback();
    } else {
        //  window.location.href = "../../autorizacion";
    }

}
function refreshCurrentPage() {
    console.log("redirecto to autorizacion");
    window.location.href = "../../autorizacion";
}
function procesarSendToRemu(callback) {
    console.log("enter to procesarSendToRemu function");
    $(".headerReqAutorizado").addClass("widget-body-ajax-loading");
    //  var lenghtDatatable = $('#dt_basic1 tr').length;
    $.each($(".envioRem"), function (index) {
        var thisObject = $(this);
        var valAut = thisObject.parents('tr').find(".valAut");
        if (thisObject.prop('checked')) {
            console.log("checked condition");
            processAutorizacionMasive(valAut.val(), function (data) {
                console.log("enter to autorizacion");
                exito("Procesado con exito!", "Envió el requerimiento correctamente");
                statusBtnSendToRem();
                statusBtnSendFirma();
                statusFirmaAndRem();
                console.log("Autorizacion :" + data.rpta);
                $(".headerReqAutorizado").removeClass("widget-body-ajax-loading");
                var table = new $.fn.dataTable.Api('#dt_basic1');
                table.row(thisObject.parents('tr')).remove().draw();
            });
        }
    });
    if (typeof callback !== 'undefined') {
        callback();
    } else {
    }
}
function loadFormSendEmail(emails) {
    console.log("enter to function loadFormSendEmail");
    $('.sendEmailsModal').modal({keyboard: false, backdrop: 'static'});
    $('.sendEmailsModal').modal('show');
    $(".emailInput").tagsinput({
        confirmKeys: [13, 44],
        freeInput: true
    });
    $('.emailInput').tagsinput('add', emails);
}
function registerAndProcessCodHuella(inputItem, emails, dataProcess) {
    console.log("enter to function registerAndProcessCodHuella");
    if (inputItem.val() !== "" & typeof inputItem.val() !== "undefined") {
        $(".headerReqAutorizado").addClass("widget-body-ajax-loading");
        registerCOdHuella(inputItem, function () {
            processAutorizacionMasive(dataProcess, function () {
                $(".headerReqAutorizado").removeClass("widget-body-ajax-loading");
                loadFormSendEmail(emails);
                var table = new $.fn.dataTable.Api('#dt_basic1');
                table.row(inputItem.parents('tr')).remove().draw();
                //  table.fnFilterClear();
                table
                        .search('')
                        .columns().search('')
                        .draw();
            });
        });
    }
}
function registerCOdHuella(inputItem, callback) {
    console.log("::enter to registerCOdHuella function");
    if (inputItem.val() !== "" & typeof inputItem.val() !== "undefined") {
        $.ajax({
            async: false,
            url: "../../trabajador", data: "opc=registrar_huella&cod=" + inputItem.val() + "&idtr=" + inputItem.parents("tr").find(".idTrabajador").val(),
            type: "POST", success: function (data, textStatus, jqXHR) {
                if (data.rpta) {
                    console.log("huella registrada!");
                    if (typeof callback !== 'undefined') {
                        callback(data);
                    }
                }
            }

        });
    }
}
function processAutorizacionMasive(values, callback) {
    console.log("::enter to processAutorizacionMasive function");
    $.ajax({
        async: false,
        url: "../../autorizacion",
        data: "opc=Aceptar" + values,
        type: "POST", success: function (data, textStatus, jqXHR) {
            if (data.rpta) {
                console.log("autorizacion registrada");

            } else {
                console.log('ocurrio un error al autorizar.');
            }
            if (typeof callback !== 'undefined') {
                callback(data);
            }
        }
    });
}
function sendEmail(dataURL, callback) {
    console.log("::enter to sendEmail function");
    // loadFormSendEmail(emailsConcat);
    statusBarAut.text("Enviando correos...");
    /*open modal*/
    $.ajax({
        //  async: false,
        url: "../../autorizacion",
        type: "POST", success: function (data, textStatus, jqXHR) {
            if (data.status) {
                statusBarAut.text("Correos enviados!").fadeOut('slow');
                //  console.log(table.row(inputItem.parent('tr')).data());
                $.bigBox({
                    title: "Registro terminado!",
                    content: "<i class='fa fa-clock-o'></i> <i>Se enviaron a los correos del trabajador: " + data.sendto + "...</i>",
                    color: "#296191",
                    icon: "fa fa-check shake animated",
                    number: "1",
                    timeout: 6000
                });
                if (typeof callback !== 'undefined') {
                    callback(data);
                }
            } else if (!data.status) {
                statusBarAut.text("Ha ocurrido un error en el envio de correos.");
                $.bigBox({
                    title: "Ha ocurrido un error en el envio de correos.",
                    content: "<i class='fa fa-clock-o'></i> <i>" + data.mensaje + "</i>",
                    color: "#953b39",
                    icon: "fa fa-check shake animated"
                            //,number: "1"
                            //,timeout: 6000
                });
                if (typeof callback !== 'undefined') {
                    callback(data);
                }
            }
        },
        data: "opc=Enviar_Correo" + dataURL
    });
}
$(document).ready(function () {
    statusBtnSendToRem();
    statusBtnSendFirma();
    statusFirmaAndRem();
    loadDatatableCargaAcademica();
    pageSetUp();
    //runAllForms();
    $(".inputFileEmail").fileinput({
        language: "es",
        layoutTemplates: {
            main1: "{preview}\n" +
                    "<div class=\'input-group {class}\'>\n" +
                    "   <div class=\'input-group-btn\' >\n" +
                    "       {browse}\n" +
                    "       {upload}\n" +
                    "       {remove}\n" +
                    "   </div>\n" +
                    "   {caption}\n" +
                    "</div>"},
        allowedFileExtensions: ['jpg', 'png', 'gif', 'pdf', 'docx', 'doc', 'txt'],
        maxFileSize: 500,
        maxFilesNum: 10,
        browseClass: "btn btn-primary btn-sm",
        removeClass: "btn btn-danger btn-sm"
    });
    $('.inputFileEmail').change(function () {
        console.log(this.files[0].mozFullPath);
    });
    $('.emailbody').summernote({
        height: 350,
        focus: false,
        tabsize: 2
    });


    $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
        $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>");
    });
    $(".inp_cod_aps").keypress(function (event) {
        return /\d/.test(String.fromCharCode(event.keyCode));
    });
    $(".inp_cod_huella").keypress(function (event) {
        return /\d/.test(String.fromCharCode(event.keyCode));
    });
    $(".btnHorario").click(function () {
        listHorario($(this).data("valor"));
    });

    // listar_autorizados(mes, anno);
    initDatatableAuthorizedRequirements();
    /* BASIC ;*/
    var responsiveHelper_dt_basic = undefined;
    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };
    $('.btnSendEmail').button({
        loadingText: 'Enviando...'
    }

    );
    $(".btnSendEmail").click(function () {
        var $btn = $(this);
        $btn.button('loading');
        var emailInput = $(".emailInput").val();
        var asunto = $(".asunto").val();
        var messageEmail = $(".messageEmail").val();
        var from = $(".emailSubject").val();
        var pwd = $(".pwdSubject").val();

        sendEmail("&to=" + emailInput + "&from=" + from + "&asunto=" + asunto + "&cuerpo=" + messageEmail + "&pwdSubject=" + pwd, function () {
            $btn.button('reset');
        });


    });
    $('#dt_basic1').dataTable({
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                "t" +
                "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "autoWidth": true,
        "preDrawCallback": function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper_dt_basic) {
                responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic1'), breakpointDefinition);
            }
        },
        "rowCallback": function (nRow) {
            responsiveHelper_dt_basic.createExpandIcon(nRow);
        },
        "drawCallback": function (oSettings) {
            responsiveHelper_dt_basic.respond();
        }
    });
    /* END BASIC */
    $(".btnProcesarFirmaAndRem").click(function () {
        $.SmartMessageBox({
            title: "¡Advertencia!",
            content: "¿Esta seguro de procesar Firmas y Envio a Remuneración?",
            buttons: '[No][Si]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Si") {
                procesarFirmas(function () {
                    console.log("item");
                }, function (item) {
                    console.log("item:" + item);
                    processAutorizacionMasive(item.val(), function () {

                        /*termina la autorizacion*/
                        var table = new $.fn.dataTable.Api('#dt_basic1');
                        table.row(item.parents('tr')).remove().draw();
                    });
                });
            }
            if (ButtonPressed === "No") {
            }
        });
    });
    $(".btn_pro_remuneracion").click(function () {
        $.SmartMessageBox({
            title: "¡Advertencia!",
            content: "¿Esta seguro de procesar estos requerimientos?",
            buttons: '[No][Si]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Si") {
                procesarSendToRemu();
            }
            if (ButtonPressed === "No") {
            }
        });
    });
    $(".btn_pro_firma").click(function () {
        $.SmartMessageBox({
            title: "¡Advertencia!",
            content: "¿Esta seguro de procesar firmas a estos requerimientos?",
            buttons: '[No][Si]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Si") {
                try {
                    procesarFirmas();
                } catch (err) {

                } finally {
                }
            }
            if (ButtonPressed === "No") {
            }
        });
    });
    $(".btn_cod_aps").click(function () {
        $.SmartMessageBox({
            title: "¡Advertencia!",
            content: "¿Esta seguro de procesar codigos APS a estos requerimientos?",
            buttons: '[No][Si]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Si") {

                var lenghtDatatable = $('#dt_basic1 tr').length;
                console.log("total:" + lenghtDatatable);

                $.each($(".inp_cod_aps"), function (index) {
                    var itemCodAps = $(this);
                    var valAut = itemCodAps.parents('tr').find(".valAut");
                    if (itemCodAps.val() !== "" & typeof itemCodAps.val() !== 'undefined') {
                        console.log(index + "codigo aps: " + itemCodAps.val());
                        $(".headerReqAutorizado").addClass("widget-body-ajax-loading");
                        $.ajax({
                            async: false,
                            url: "../../trabajador", data: "opc=reg_aps_masivo&cod=" + itemCodAps.val() + "&idtr=" + itemCodAps.parents("tr").find(".idTrabajador").val(),
                            type: "POST", success: function (objJson, textStatus, jqXHR) {
                                if (objJson.rpta) {
                                    $.ajax({
                                        async: false,
                                        url: "../../autorizacion",
                                        type: "POST", success: function (objJson, textStatus, jqXHR) {
                                            if (objJson.rpta) {
                                                var table = new $.fn.dataTable.Api('#dt_basic1');
                                                table.row(itemCodAps.parents('tr')).remove().draw();
                                                exito("Procesado con exito!", "Codigo APS ingresado correctamente");
                                                console.log("autorizado!");
                                                $(".headerReqAutorizado").removeClass("widget-body-ajax-loading");
                                            }
                                        },
                                        data: "opc=Aceptar" + valAut.val()
                                    });
                                }
                            }
                        });
                    }
                });
            }
            if (ButtonPressed === "No") {
            }
        });
    });
    $(".btn_cod_huella").click(function () {

        $.SmartMessageBox({
            title: "¡Advertencia!",
            content: "¿Esta seguro de procesar códigos de huella a estos requerimientos?",
            buttons: '[No][Si]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Si") {
                $.each($(".inp_cod_huella"), function (index) {
                    var objInputHuella = $(this);
                    var valAut = objInputHuella.parents('tr').find(".valAut");
                    var correoTrabajador = objInputHuella.parents('tr').find(".correoTrabajador");
                    registerAndProcessCodHuella(objInputHuella, correoTrabajador.val(), valAut.val());
                });

                $.each($(".cbHuellaItem"), function (index) {
                    var itemRegistered = $(this);
                    if (itemRegistered.prop('checked')) {
                        console.log(index + 1)
                        if (itemRegistered.val() !== "" & typeof itemRegistered.val() !== "undefined") {
                            var itemValue = itemRegistered.parents('tr').find(".valAut");
                            var correoTrabajador = itemRegistered.parents('tr').find(".correoTrabajador");
                            processAutorizacionMasive(itemValue.val(), function () {
                                //$(".headerReqAutorizado").addClass("widget-body-ajax-loading");
                                loadFormSendEmail(correoTrabajador.val());

                            });
                        }
                    }

                });
            }
            if (ButtonPressed === "No") {
            }
        });
    });
});
