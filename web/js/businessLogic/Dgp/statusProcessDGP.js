/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// DO NOT REMOVE : GLOBAL FUNCTIONS!
function closedthis() {
    $.smallBox({
        title: "¡DGP registrada correctamente!",
        content: "Ya puede visualizar la informacion del DGP",
        color: "#739E73",
        iconSmall: "fa fa-check fa-2x fadeInRight animated",
        timeout: 6000
    });
}
function closedthis2() {
    $.smallBox({
        title: "¡Documentos del trabajador registrados correctamente!",
        content: "ya puede visualizar toda los documentos del trabajador...",
        color: "#739E73",
        iconSmall: "fa fa-check fa-2x fadeInRight animated",
        timeout: 6000
    });
}
function printDetProceso(objProgAut, postData) {
    objProgAut.empty();
    objProgAut.append('<img src="../../img/ajax-loader/horizontal_fountain.gif" />');
    $.ajax({
        url: "../../dgp",
        data: "opc=Imprimir_det_proceso" + postData,
        type: 'POST',
        success: function (data, textStatus, jqXHR) {
            if (data.rpta === "1") {
                objProgAut.empty();
                objProgAut.append(data.html);
                objProgAut.find(".new-circle").popover({trigger: 'hover click'});
            }
        }
    });
}

function initStatusProcessDGP() {
    var responsiveHelper_dt_basic = undefined;
    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };
    var table_req = $('#dt_basic').dataTable({
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                "t" +
                "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "autoWidth": true,
        "preDrawCallback": function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper_dt_basic) {
                responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
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
    var rows = table_req.fnGetNodes();
    for (var i = 0; i < rows.length; i++) {
        var obj = $(rows[i]).find(".prog_aut");
        printDetProceso(obj, obj.data("value"));
    }
    var responsiveHelperCAacademico = undefined;
    var varTableCAcademica = $(".tableEsCargaAcademica").dataTable({
        "ajax": {
            "url": "../../carga_academica",
            "type": "POST",
            "dataSrc": "list",
            "data": {
                "opc": "listEsCargaAcademica"
            }
        }, "columns": [
            {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            },
            {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            },
            {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            },
            {"data": "ap_paterno"},
            {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            },
            {"data": "no_dep"}, {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            }
        ],
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>"
                + "t"
                + "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "oLanguage": {
            "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
        },
        "autoWidth": true,
        "preDrawCallback": function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelperCAacademico) {
                responsiveHelperCAacademico = new ResponsiveDatatablesHelper(
                        $('.tableEsCargaAcademica'),
                        breakpointDefinition);
            }
        },
        "rowCallback": function (row, data, index) {
            responsiveHelperCAacademico.createExpandIcon(row);
            $('td:eq(0)', row).html(index + 1);
            $('td:eq(0)', row).html(data.mes_procesamiento);
            $('td:eq(2)', row)
                    .html(
                            '<div class="btn-group">'
                            + '   <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">'
                            + '   <i class="fa fa-gear fa-lg"></i>'
                            + '     <i class="fa fa-caret-down"></i>'
                            + ' </button>'
                            + ' <ul class="dropdown-menu">'
                            + '     <li><a href="../../dgp?iddgp=' + data.id_dgp + '&opc=User_Aut">Usuarios - Prox. Autorizacion</a></li>'
                            + '<li><a href="../../dgp?iddgp=' + data.id_dgp + '&opc=Seguimiento">Ver Historial</a> </li>'
                            + '<li><a href="../../documento?iddgp=' + data.id_dgp + '&idtr=' + data.id_trabajador + '&opc=Ver_Documento">Ver Documentos</a></li>'
                            + ' <li><a data-valor="' + data.id_dgp + ';' + data.id_trabajador + ';' + data.ap_paterno + ' ' + data.ap_materno + ' ' + data.no_trabajador + '" class="click" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false" onclick="sendAjaxComment()" >Comentario</a></li>'
                            + ' <li><a href="../../solicitud_requerimiento?iddgp=' + data.id_dgp + '&opc=Reg_List_Solicitud">Hacer Solicitud</a></li>'
                            + ' <li class="divider"></li><li>'
                            + '<li><a href="../../dgp?iddgp=' + data.id_dgp + '&idtr=' + data.id_trabajador + '&opc=Detalle">Ver Requerimiento</a> </li>'
                            + ' </ul>'
                            + ' </div>'
                            );
            if (data.es_dgp === "2") {
                $('td:eq(6)', row).html('<span class="label label-danger">Fuera de Proceso</span>');
            } else {
                $('td:eq(6)', row).html('<span class="label label-primary">En Proceso</span>');
            }
            $('td:eq(3)', row).html(data.ap_paterno + ' ' + data.ap_materno + ' ' + data.no_trabajador);
            // var rows = varTableCAcademica.fnGetNodes();
            //   for (var i = 0; i < rows.length; i++) {
            //  var obj = $(rows[i]).find(".prog_aut");
            printDetProceso($('td:eq(4)', row), "&dgp=" + data.id_dgp + "&idrp=" + data.id_detalle_req_proceso + "&iddep=" + data.id_departamento);
            $('td:eq(4)', row).addClass("new-progress");
            // }

        }
    });
}